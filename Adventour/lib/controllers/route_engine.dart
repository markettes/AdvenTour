import 'dart:collection';

import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Path.dart';
import 'package:Adventour/models/Place.dart';
import 'package:google_maps_webservice/src/core.dart';

const MAX_DISTANCE_WALK = 5000;
const MAX_DISTANCE_CAR = 20000;
const MAX_DISTANCE_BICYCLE = 10000;
const MAX_DISTANCE_PUBLIC = 15000;

class RouteEngine {
  Future<Route> makeShortRoute(
      Location location, List<String> types, List<String> transports) async {
    var maxDistance = transports.contains('car')
        ? MAX_DISTANCE_CAR
        : transports.contains('public')
            ? MAX_DISTANCE_PUBLIC
            : transports.contains('bicycle')
                ? MAX_DISTANCE_BICYCLE
                : MAX_DISTANCE_WALK;

    List<Place> prePlaces = [];

    for (String type in types) {
      prePlaces.addAll(await searchEngine.searchByLocationWithType(
          type, location, maxDistance));
    }

    List<Place> placesWithoutDuplicates = [];

    for (Place p in prePlaces) {
      bool contains = false;
      for (var i = 0; i < placesWithoutDuplicates.length && !contains; i++) {
        if (p.id == placesWithoutDuplicates[i].id) contains = true;
      }
      if (!contains) placesWithoutDuplicates.add(p);
    }

    // for (var place in placesWithoutDuplicates) {
    //   print(place.toString());
    // }

    placesWithoutDuplicates.removeWhere((place) =>
        place.rating == null ||
        place.rating < 4.3 ||
        place.userRatingsTotal < 500);

    placesWithoutDuplicates.sort((a, b) => b.rating.compareTo(a.rating));

    List<Place> places = [];

    for (String type in types) {
      Place routePlace = placesWithoutDuplicates.firstWhere((place) {
        return place.types.contains(type);
      }, orElse: () {});
      if (routePlace != null) {
        places.add(routePlace);
        placesWithoutDuplicates.remove(routePlace);
      }
    }

    for (Place p in places) {
      print(p.toString());
    }

    places.insert(0, Place(location.lat, location.lng));

    List<Path> trajectories = [];
    for (var transport in transports) {
      trajectories
          .addAll(await directionsEngine.makeTrajectories(places, transport));
    }
    Route route = Route(places, trajectories);

    return route;
  }
}

RouteEngine routeEngine = RouteEngine();
