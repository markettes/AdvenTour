
import 'package:Adventour/models/Route.dart';
import 'package:Adventour/models/Place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart';

const CAR = 'car';
const WALK = 'walk';
const PUBLIC = 'public';
const BICYCLE = 'bicycle';

List<String> transports = [CAR,WALK,PUBLIC,BICYCLE];

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

    Future<List<Path>> makePaths(LatLng start,List<Place> places, String transport) async {
      if(places.length < 2) return [];
    String origin = start.latitude.toString() +',' + start.longitude.toString();
    String destination = places.last.latitude.toString() +',' + places.last.longitude.toString();
    DirectionsResponse response = await _directions.directions(
      origin,
      destination,
      waypoints: places.sublist(0,places.length - 1).map((place) => Waypoint.fromPlaceId(place.id)).toList(),
      travelMode: toTravelMode(transport),
    );
    List<Path> paths = response.routes.map((route) => Path.fromGoogleRoute(route,transport)).toList();
    return paths;
  }
}

TravelMode toTravelMode(String transport) {
  switch (transport) {
    case 'car':
      return TravelMode.driving;
    case 'walk':
      return TravelMode.walking;
    case 'public':
      return TravelMode.transit;
    case 'bicycle':
      return TravelMode.bicycling;
  }
}

DirectionsEngine directionsEngine = DirectionsEngine();
