import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/models/Place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/src/core.dart';

const CAR = 'car';
const WALK = 'walk';
const BICYCLE = 'bicycle';

List<String> transports = [CAR, WALK, BICYCLE];

class DirectionsEngine {
  final _directions = GoogleMapsDirections(
    apiKey: "AIzaSyAzLMUtt6ZleHHXpB2LUaEkTjGuT8PeYho",
  );

  // Future<List<Trajectory>> makeTrajectories(Place originPlace, Place destinationPlace, String transport) async {
  //   String origin = originPlace.latitude.toString() +',' + originPlace.longitude.toString();
  //   String destination = destinationPlace.latitude.toString() +',' + destinationPlace.longitude.toString();
  //   DirectionsResponse response = await _directions.directions(
  //     origin,
  //     destination,
  //     travelMode: toTravelMode(transport),
  //   );
  //   List<Trajectory> trajectories = response.routes.map((route) => Trajectory.fromGoogleRoute(route,transport)).toList();
  //   return trajectories;
  // }

  Future<List<r.Path>> makePaths(
      LatLng start, List<Place> places, String transport) async {
    if (places.length < 2) return [];
    String origin =
        start.latitude.toString() + ',' + start.longitude.toString();
    Place furthestPlace = getFurthestPlace(start, places);
    String destination = furthestPlace.latitude.toString() +
        ',' +
        furthestPlace.longitude.toString();
    List<Waypoint> waypoints = [Waypoint.optimize()];
    for (var place in places) {
      if (place != furthestPlace) waypoints.add(Waypoint.fromPlaceId(place.id));
    }
    DirectionsResponse response = await _directions.directions(
      origin,
      destination,
      waypoints: waypoints,
      units: Unit.metric,
      travelMode: toTravelMode(transport),
    );
    if(response.hasNoResults) return [];
    List<r.Path> paths = response.routes
        .map((route) => r.Path.fromGoogleRoute(
            route, response.geocodedWaypoints, transport))
        .toList();
    return paths;
  }
}

TravelMode toTravelMode(String transport) {
  switch (transport) {
    case CAR:
      return TravelMode.driving;
    case WALK:
      return TravelMode.walking;
    case BICYCLE:
      return TravelMode.bicycling;
  }
}

DirectionsEngine directionsEngine = DirectionsEngine();
