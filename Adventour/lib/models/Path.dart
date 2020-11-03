import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:google_maps_webservice/directions.dart' as directions;

class Path {
  Place _origin;
  Place _destination;
  List<Trajectory> _trajectories;

  Path(origin, destination, trajectories) {
    _origin = origin;
    _destination = destination;
    _trajectories = trajectories;
  }

  List<Trajectory> get trajectories => _trajectories;

  
}

class Trajectory {
  List<LatLng> _points;
  String _transport;

  Trajectory.fromGoogleRoute(directions.Route route,String transport) {
      List<LatLng> points = [];
      for (var leg in route.legs) {
        for (var step in leg.steps) {
          points.add(LatLng(step.startLocation.lat, step.startLocation.lng));
        }
      }
      _points = points;
  }

  List<LatLng> get points => _points;

}
