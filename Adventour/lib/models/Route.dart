import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;

class Route {
  LatLng _start;
  List<Place> _places;
  List<Path> _paths;

  Route(start,places, paths) {
    _start = start;
    _places = places;
    _paths = paths;
  }

  List<Path> get paths => _paths;

  List<Place> get places => _places;

  Duration duration(int index){
    List<Duration> stretchsDurations = _paths[index].stretchs.map((stretch) => stretch.duration).toList();
    print(stretchsDurations.toString());
    Duration pathDuration = stretchsDurations.reduce((value, element) => value + element);
    print(pathDuration.toString());
    List<Duration> placesDurations = _places.map((place) => place.duration).toList();
    print(placesDurations.toString());
    Duration placesDuration = placesDurations.reduce((value, element) => value + element);
    print(placesDuration.toString());
    return pathDuration + placesDuration;
  }


  void addPlace(Place place, Stretch stretch) {
    exampleRoute._places.add(place);
    exampleRoute._paths.first.stretchs.add(stretch);
  }

  void removePlace(int index) {
    exampleRoute.places.removeAt(index);
    exampleRoute.paths.first.stretchs.removeAt(index);
  }
}

Route exampleRoute = Route(LatLng(39.47018449999999, -0.3705346),[
  Place(39.4753061, -0.3764726, 'Catedral de Valencia',
      'ChIJb2UMoVJPYA0R2uk8Hly_1uU', CHURCH, 5,"https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png",Duration(minutes: 20)),
  Place(39.4752113, -0.3552065, 'Ciudad de las artes y de las ciencias',
      'ChIJgUOb0elIYA0RlPjrpQdE62I', [MUSEUM], 5,"https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png",Duration(minutes: 35))
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

class Path {
  List<Stretch> _stretchs;
  String _transport;

  Path(stretchs,transport){
    _stretchs = stretchs;
    _transport = transport;
  }

  Path.fromGoogleRoute(directions.Route route, String transport) {
    List<Stretch> stretchs = [];
    int stretchId = 0;
    for (var leg in route.legs) {
      stretchId++;
      List<LatLng> points = [];
      for (var step in leg.steps) {
        points.add(LatLng(step.startLocation.lat, step.startLocation.lng));
      }
      Duration duration = Duration(minutes: leg.duration.value.toInt());
      stretchs.add(Stretch(stretchId.toString(),points, duration));
    }
    _stretchs = stretchs;
    _transport = transport;
  }

  List<Stretch> get stretchs => _stretchs;

  get transport => _transport;
}

class Stretch {
  String _id;
  List<LatLng> _points;
  Duration _duration;

  Stretch(id,points,duration){
    _id = id;
    _points = points;
    _duration = duration;
  }

  String get id => _id;

  List<LatLng> get points => _points;

  Duration get duration => _duration;
}