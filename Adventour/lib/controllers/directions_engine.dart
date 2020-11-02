import 'package:Adventour/models/Path.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/models/Place.dart';
import 'package:google_maps_webservice/directions.dart';

class DirectionsEngine {
  final _directions = GoogleMapsDirections(
    apiKey: "AIzaSyAzLMUtt6ZleHHXpB2LUaEkTjGuT8PeYho",
  );

  Future<r.Route> makeRoute(Place originPlace, Place destinationPlace, String transport) async {
    String origin = originPlace.latitude.toString() +',' + originPlace.longitude.toString();
    String destination = destinationPlace.latitude.toString() +',' + destinationPlace.longitude.toString();
    DirectionsResponse response = await _directions.directions(
      origin,
      destination,
      travelMode: toTravelMode(transport),
    );
    List<Path> paths = response.routes.map((route) => Path.fromGoogleRoute(route)).toList();
    return r.Route(paths);
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
