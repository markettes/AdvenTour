import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:google_maps_webservice/directions.dart' as directions;

class Path {
  List<LatLng> _points = [];

  Path(points) {
    _points = points;
  }

  List<LatLng> get points => _points;

  Path.fromGoogleRoute(directions.Route route) {
    List<LatLng> points = [];
    for (var leg in route.legs) {
      for (var step in leg.steps) {
        points.add(LatLng(step.startLocation.lat, step.startLocation.lng));
      }
      _points = points;
    }
  }

}
