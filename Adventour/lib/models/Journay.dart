import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;

class Journay {
  String _origin;
  String _destination;
  List<Path> _paths;

  Journay(origin, destination, paths) {
    _origin = origin;
    _destination = destination;
    _paths = paths;
  }

  String get origin => _origin;

  String get destination => _destination;

  List<Path> get paths => _paths;
}

class Path {
  Polyline _polyline;

  Path(polyline) {
    _polyline = polyline;
  }

  Polyline get polyline => _polyline;
}

Path toPath(directions.Route route) {
  List<LatLng> points = [];
  for (var leg in route.legs) {
    for (var step in leg.steps) {
      points.add(LatLng(step.startLocation.lat, step.startLocation.lng));
    }
  }
  print('???????????????????????' + points.first.latitude.toString());
  Polyline polyline = Polyline(
      polylineId: PolylineId('polyline'),
      points: points,
      color: Colors.blue,
      width: 2);
  return Path(polyline);
}
