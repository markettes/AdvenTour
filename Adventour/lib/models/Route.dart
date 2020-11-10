import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;

class Route {
  LatLng _start;
  List<Place> _places;
  List<Path> _paths;
  String name;
  String img;

  Route(start, places, paths, [this.name, this.img]) {
    _start = start;
    _places = places;
    _paths = paths;
  }

  LatLng get start => _start;

  List<Path> get paths => _paths;

  set paths(List<Path> paths) => _paths = paths;

  List<Place> get places => _places;

  Duration duration(int index) {
    List<Duration> stretchsDurations =
        _paths[index].stretchs.map((stretch) => stretch.duration).toList();
    Duration pathDuration =
        stretchsDurations.reduce((value, element) => value + element);
    List<Duration> placesDurations =
        _places.map((place) => place.duration).toList();
    Duration placesDuration =
        placesDurations.reduce((value, element) => value + element);
    return pathDuration + placesDuration;
  }

  void addPlace(Place place) => exampleRoute._places.add(place);

  void removePlace(int index) => exampleRoute.places.removeAt(index);

  sortPlaces(int index) {
    List<Place> places = [];
    for (var stretch in _paths[index].stretchs) {
      print('?' + stretch.points.last.latitude.toString());
      places.add(_places.firstWhere((place) =>
          place.latitude == stretch.points.last.latitude &&
          place.longitude == stretch.points.last.longitude));
    }
    _places = places;
  }

  List<String> getPlacesTypes(List<Place> p) {
    print('hola');
    List<String> t = [];
    for (var i = 0; i < p.length; i++) {
      t.add(p[i].types.first);
    }
    print(t.toString());
    return t;
  }
}

Route exampleRoute = Route(
    LatLng(39.47018449999999, -0.3705346),
    [
      Place(
          39.4753061,
          -0.3764726,
          'Catedral de Valencia',
          'ChIJb2UMoVJPYA0R2uk8Hly_1uU',
          CHURCH,
          5,
          "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png",
          Duration(minutes: 20)),
      Place(
          39.4752113,
          -0.3552065,
          'Ciudad de las artes y de las ciencias',
          'ChIJgUOb0elIYA0RlPjrpQdE62I',
          [MUSEUM],
          5,
          "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png",
          Duration(minutes: 35))
    ],
    [
      Path([
        Stretch(
            '1',
            [
              LatLng(39.47018449999999, -0.3705346),
              LatLng(39.4753061, -0.3764726)
            ],
            Duration(minutes: 20)),
        Stretch(
            '2',
            [LatLng(39.4753061, -0.3764726), LatLng(39.4752113, -0.3552065)],
            Duration(minutes: 25)),
      ], CAR)
    ],
    'Valencia Center',
    'https://cdn.civitatis.com/espana/valencia/galeria/ayuntamiento-valencia.jpg');

Route museumRouteValencia = Route(
    LatLng(39.469576, -0.375961),
    [
      Place(
          39.469571,
          -0.375984,
          'Museo Histórico Municipal',
          'ChIJW3iCd0tPYA0RHE-7303MbYo',
          MUSEUM,
          5,
          "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png",
          Duration(minutes: 20)),
      Place(
          39.471837,
          -0.362429,
          'Museo Histórico Militar',
          'ChIJMXSot7tIYA0RwDMjqTNrL7M',
          MUSEUM,
          5,
          "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png",
          Duration(minutes: 30)),
      Place(
          39.478662,
          -0.383099,
          'Museu de Prehistòria de València',
          'ChIJU0Yei1BPYA0RTQbWU6KZhi8',
          MUSEUM,
          5,
          "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png",
          Duration(minutes: 35)),
      Place(
          39.472767,
          -0.408512,
          "Museu d'Història de València",
          'ChIJ3y4qOndPYA0R_pa4I9GJJgI',
          MUSEUM,
          5,
          "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png",
          Duration(minutes: 30)),
    ],
    [
      Path([
        Stretch(
            '1',
            [LatLng(39.469576, -0.375961), LatLng(39.469571, -0.375984)],
            Duration(minutes: 2)),
      ], WALK),
      Path([
        Stretch(
            '2',
            [LatLng(39.469571, -0.375984), LatLng(39.471837, -0.362429)],
            Duration(minutes: 10)),
      ], CAR),
      Path([
        Stretch(
            '3',
            [LatLng(39.471837, -0.362429), LatLng(39.478662, -0.383099)],
            Duration(minutes: 10)),
      ], CAR),
      Path([
        Stretch(
            '4',
            [LatLng(39.478662, -0.383099), LatLng(39.472767, -0.408512)],
            Duration(minutes: 10)),
      ], CAR),
    ],
    'Valencia Best Museums',
    'https://cdn.civitatis.com/espana/valencia/galeria/ayuntamiento-valencia.jpg');

class Path {
  List<Stretch> _stretchs;
  String _transport;

  Path(stretchs, transport) {
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
      stretchs.add(Stretch(stretchId.toString(), points, duration));
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

  Stretch(id, points, duration) {
    _id = id;
    _points = points;
    _duration = duration;
  }

  String get id => _id;

  List<LatLng> get points => _points;

  Duration get duration => _duration;
}
