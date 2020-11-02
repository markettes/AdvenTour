import 'dart:collection';

import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart';
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
    ;

    prePlaces.removeWhere((place) =>
        place.rating == null ||
        place.rating < 4.3 ||
        place.userRatingsTotal < 500);

    List<Place> places = [];

    prePlaces.sort((a, b) => b.rating.compareTo(a.rating));

    for (Place place in prePlaces) { 
      for (String type in types) {
        if (place.types.contains(type) && !places.contains(place)) {
          places
              .add(prePlaces.firstWhere((place) => place.types.contains(type)));
        }
      }
    }

    // for (Place p in places) {
    //   print(p.name);
    // }

    List<Place> placesWithoutDuplicates = [];

    for (Place p in places) {
      if (!placesWithoutDuplicates.contains(p)) {
        placesWithoutDuplicates.add(p);
      }
    }

    for (var place in placesWithoutDuplicates) {
      print(place.toString());
    }
  }
}

RouteEngine routeEngine = RouteEngine();
