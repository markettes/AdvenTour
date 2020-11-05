import 'package:Adventour/controllers/directions_engine.dart';
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

Route exampleRoute = Route([
  Place(39.47018449999999, -0.3705346,'Start','Start'),
  Place(39.4753061, -0.3764726, 'Catedral de Valencia',
      'ChIJb2UMoVJPYA0R2uk8Hly_1uU', CHURCH, 5),
  Place(39.4752113, -0.3552065, 'Ciudad de las artes y de las ciencias',
      'ChIJgUOb0elIYA0RlPjrpQdE62I', [MUSEUM], 5)
], [
  Path([
    Stretch([LatLng(39.47018449999999, -0.3705346),LatLng(39.4753061, -0.3764726)], Duration(minutes: 20)),
    Stretch([LatLng(39.4753061, -0.3764726),LatLng(39.4752113, -0.3552065)], Duration(minutes: 25)),
  ], CAR)
]);
