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

  void addNewPlace(Place p, Stretch s) {
    exampleRoute._places.add(p);
    exampleRoute._paths.first.stretchs.add(s);
    // r._places.add(
    //   Place(39.462531, -0.359762, 'Parque Gulliver',
    //       'ChIJ98E0IMFIYA0RX4pSCR-943Q', PARK, 5),
    // );
    // r._paths.first.stretchs.add(Stretch(
    //     '3',
    //     [LatLng(39.4752113, -0.3552065), LatLng(39.462531, -0.359762)],
    //     Duration(minutes: 30)));
  }

  void removePlace(Place p, Stretch s) {
    exampleRoute.places.remove(p);
    exampleRoute.paths.first.stretchs.remove(s);
  }
}

Route exampleRoute = Route([
  Place(39.47018449999999, -0.3705346, 'Start', 'Start'),
  Place(39.4753061, -0.3764726, 'Catedral de Valencia',
      'ChIJb2UMoVJPYA0R2uk8Hly_1uU', CHURCH, 5),
  Place(39.4752113, -0.3552065, 'Ciudad de las artes y de las ciencias',
      'ChIJgUOb0elIYA0RlPjrpQdE62I', [MUSEUM], 5)
], [
  Path([
    Stretch(
        '1',
        [LatLng(39.47018449999999, -0.3705346), LatLng(39.4753061, -0.3764726)],
        Duration(minutes: 20)),
    Stretch(
        '2',
        [LatLng(39.4753061, -0.3764726), LatLng(39.4752113, -0.3552065)],
        Duration(minutes: 25)),
  ], CAR)
]);
