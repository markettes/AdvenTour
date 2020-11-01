import 'package:Adventour/models/Journay.dart';
import 'package:Adventour/models/Place.dart';
import 'package:google_maps_webservice/directions.dart';

class DirectionsEngine {
  final _directions = GoogleMapsDirections(
    apiKey: "AIzaSyAzLMUtt6ZleHHXpB2LUaEkTjGuT8PeYho",
  );

  Future<Journay> makeJournay(String origin, String destination, String transport) async {
    DirectionsResponse response = await _directions.directions(
      origin,
      destination,
      travelMode: toTravelMode(transport),
    );
    List<Path> paths = response.routes.map((route) => toPath(route)).toList();
    return Journay(origin, destination, paths);
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
