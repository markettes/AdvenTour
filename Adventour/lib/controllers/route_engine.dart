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

    //QUITAR DUPLICADOS
    

    prePlaces
        .removeWhere((place) => place.rating == null || place.rating < 4.3 || place.userRatingsTotal < 500);

    List<Place> places = [];

    prePlaces.sort((a, b) => b.rating.compareTo(a.rating));

    for (String type in types) {
      places.add(prePlaces.firstWhere((place) => place.types.contains(type)));
    }

    for (var place in places) {
      print(place.toString());
    }
  }
}

RouteEngine routeEngine = RouteEngine();
