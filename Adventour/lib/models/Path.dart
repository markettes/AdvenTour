import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;

class Route {
  List<Place> _places;
  List<Path> _paths;

  Route(places, paths) {
    _places = places;
    _paths = paths;
  }

  List<Path> get trajectories => _paths;

  List<Place> get places => _places;

  
}

class Path {
  List<LatLng> _points;
  String _transport;

  Path.fromGoogleRoute(directions.Route route,String transport) {
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
