import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/controllers/geocoding.dart';
import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Route.dart';
import 'package:Adventour/models/Place.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/src/core.dart';

class RouteEngine {
  Future<Route> makeRoute(
      String locationId, List<String> types, int radius) async {
    Location location;
    if (locationId == null) {
      Position position = await Geolocator.getCurrentPosition();
      location = Location(position.latitude, position.longitude);
    } else {
      location = await geocoding.searchByPlaceId(locationId);
    }

    List<Place> locationPlaces = (await searchEngine.searchByLocationWithType(
        LOCALITY, location, 50000));

    if (locationPlaces.isEmpty) return null;

    locationId = locationPlaces.first.id;
    String locationName = locationPlaces.first.name;

    List<Place> prePlaces = [];

    for (String type in types) {
      prePlaces.addAll(
          await searchEngine.searchByLocationWithType(type, location, radius));
    }

    if (prePlaces.length < 3) return null;

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
        place.type == null ||
        place.userRatingsTotal < 500);
    if (placesWithoutDuplicates.length < 3) return null;

    placesWithoutDuplicates.sort((a, b) => b.rating.compareTo(a.rating));

    List<Place> places = [];

    for (String type in types) {
      Place routePlace;
      if (type == TOURIST_ATTRACTION || type == PARK) {
        routePlace = placesWithoutDuplicates
            .firstWhere((place) => place.types.contains(type), orElse: () {});
        if (routePlace != null) {
          places.add(routePlace);
          placesWithoutDuplicates.remove(routePlace);
        }
        routePlace = placesWithoutDuplicates
            .firstWhere((place) => place.types.contains(type), orElse: () {});
        if (routePlace != null) {
          places.add(routePlace);
          placesWithoutDuplicates.remove(routePlace);
        }
      } else {
        routePlace = placesWithoutDuplicates
            .firstWhere((place) => place.types.contains(type), orElse: () {});
        if (routePlace != null) {
          places.add(routePlace);
          placesWithoutDuplicates.remove(routePlace);
        }
      }
    }

    if (places.length < 3) return null;

    LatLng start = LatLng(location.lat, location.lng);

    List<Path> paths = [];
    for (var transport in transports) {
      Path path = await directionsEngine.makePath(start, places, transport);
      if (path != null) paths.add(path);
    }
    Route route =
        Route(start, places, paths, db.currentUserId, locationName, locationId);

    return route;
  }
}

RouteEngine routeEngine = RouteEngine();
