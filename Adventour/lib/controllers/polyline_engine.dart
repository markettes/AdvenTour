import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineEngine {
  GoogleMapPolyline _googleMapPolyline = GoogleMapPolyline(
    apiKey: API_KEY,
  );

  Future<List<LatLng>> getPoints(
      LatLng start, LatLng destination, String transport) async {
    return await _googleMapPolyline.getCoordinatesWithLocation(
      origin: start,
      destination: destination,
      mode: toRouteMode(
        transport,
      ),
    );
  }
}

RouteMode toRouteMode(String transport) {
  switch (transport) {
    case CAR:
      return RouteMode.driving;
    case WALK:
      return RouteMode.walking;
    case BICYCLE:
      return RouteMode.bicycling;
    default:
      return throw new Exception("$transport is a transport not available");
  }
}

PolylineEngine polylineEngine = PolylineEngine();
