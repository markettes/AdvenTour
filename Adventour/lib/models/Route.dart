import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Path.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;

class Route {
  List<Place> _places;
  List<Path> _paths;

  Route(places, paths) {
    _places = places;
    _paths = paths;
  }

  List<Path> get paths => _paths;

  List<Place> get places => _places;

  
}
