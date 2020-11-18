import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/controllers/geocoding.dart';
import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Route.dart';
import 'package:Adventour/models/Place.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/src/core.dart';

const MAX_DISTANCE = 10000;

class RouteEngine {
  Future<RouteEngineResponse> makeRoute(
      String locationId, String locationName, List<String> types) async {
    Location location;
    if (locationId == null) {
      Position position = await Geolocator.getCurrentPosition();
      location = Location(position.latitude, position.longitude);
    } else {
      location = await geocoding.searchByPlaceId(locationId);
    }

    List<Place> prePlaces = [];

    for (String type in types) {
      prePlaces.addAll(await searchEngine.searchByLocationWithType(
          type, location, MAX_DISTANCE));
    }

    List<Place> placesWithoutDuplicates = [];

    for (Place p in prePlaces) {
      bool contains = false;
      for (var i = 0; i < placesWithoutDuplicates.length && !contains; i++) {
        if (p.id == placesWithoutDuplicates[i].id) contains = true;
      }
      if (!contains) placesWithoutDuplicates.add(p);
    }

    placesWithoutDuplicates.removeWhere((place) =>
        place.rating == null ||
        place.types.contains('lodging') ||
        place.rating < 4.3 ||
        place.userRatingsTotal < 500);

    placesWithoutDuplicates.sort((a, b) => b.rating.compareTo(a.rating));

    List<Place> places = [];

    for (String type in types) {
      Place routePlace = placesWithoutDuplicates
          .firstWhere((place) => place.types.contains(type), orElse: () {});
      if (routePlace != null) {
        places.add(routePlace);
        placesWithoutDuplicates.remove(routePlace);
      }
    }
    LatLng start = LatLng(location.lat, location.lng);

    List<Path> paths = [];
    for (var transport in transports) {
      Path path = await directionsEngine.makePath(start, places, transport);
      if (path != null) paths.add(path);
    }
    Route route = Route(start, places, paths, transports, db.currentUserId,
        locationName, locationId);

    return RouteEngineResponse(route, placesWithoutDuplicates);
  }
}

RouteEngine routeEngine = RouteEngine();

class RouteEngineResponse {
  Route _route;
  List<Place> _recommendations;

  RouteEngineResponse(route, recommendations) {
    _route = route;
    _recommendations = recommendations;
  }

  Route get route => _route;

  List<Place> get recommendations => _recommendations;
}
