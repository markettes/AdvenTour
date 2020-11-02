import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;
import 'package:Adventour/models/Path.dart' as p;

class Route {
  List<p.Path> _paths;

  Route(paths) {
    _paths = paths;
  }

  List<p.Path> get paths => _paths;
}

