import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;

class Route {
  LatLng _start;
  List<Place> _places;
  List<Path> _paths;
  List<String> _transports;
  String _name;

  String _image;

  Route(start, places, paths, transports, [name, image]) {
    _start = start;
    _places = places;
    _paths = paths;
    _transports = transports;
    _name = name;
    _image = image;
  }

  Map<String, dynamic> toJson() => {
        'latitude': _start.latitude,
        'longitude': _start.longitude,
        'places': _places.map((place) => place.toJson()).toList(),
        'paths': _paths.map((path) => path.toJson()).toList(),
        'transports': _transports,
        'name': _name,
        'image': _image,
      };

  LatLng get start => _start;

  List<Path> get paths => _paths;

  set paths(List<Path> paths) => _paths = paths;

  List<Place> get places => _places;

  String get name => _name;

  String get image => _image;

  List<String> get transports => _transports;

  void addPlace(Place place) => _places.add(place);

  void removePlace(Place place) => _places.remove(place);
}

Route exampleRoute = Route(
  LatLng(39.47018449999999, -0.3705346),
  [
    Place(
        39.4753061,
        -0.3764726,
        'Catedral de Valencia',
        'ChIJb2UMoVJPYA0R2uk8Hly_1uU',
        TOURIST_ATTRACTION,
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
        [LatLng(39.47018449999999, -0.3705346), LatLng(39.4753061, -0.3764726)],
        Duration(minutes: 20),
        'ChIJb2UMoVJPYA0R2uk8Hly_1uU',
      ),
      Stretch(
        '2',
        [LatLng(39.4753061, -0.3764726), LatLng(39.4752113, -0.3552065)],
        Duration(minutes: 25),
        'ChIJgUOb0elIYA0RlPjrpQdE62I',
      ),
    ], WALK)
  ],
  WALK,
  'Valencia Center',
  'https://www.thetimes.co.uk/imageserver/image/methode%2Ftimes%2Fprod%2Fweb%2Fbin%2Fc139090c-acf0-11e7-88ab-06bb8ee1988e.jpg?crop=1478%2C831%2C8%2C138',
);

class Path {
  List<Stretch> _stretchs;
  String _transport;

  Path(stretchs, transport) {
    _stretchs = stretchs;
    _transport = transport;
  }

  Path.fromGoogleRoute(directions.Route route,
      List<directions.GeocodedWaypoint> waypoints, String transport) {
    print('?waypoints');
    for (var waypoint in waypoints) {
      print('?' + waypoint.placeId);
    }
    List<Stretch> stretchs = [];
    for (var i = 0; i < route.legs.length; i++) {
      var leg = route.legs[i];
      List<LatLng> points = [];
      for (var step in leg.steps) {
        points.add(LatLng(step.startLocation.lat, step.startLocation.lng));
      }
      Duration duration = Duration(seconds: leg.duration.value);
      stretchs.add(Stretch(transport + i.toString(), points, duration,
          waypoints[i + 1].placeId));
    }
    _stretchs = stretchs;
    _transport = transport;
  }

  Map<String, dynamic> toJson() => {
        'stretchs': _stretchs.map((stretch) => stretch.toJson()).toList(),
        'transport': _transport
      };

  List<Stretch> get stretchs => _stretchs;

  get transport => _transport;

  Duration duration(Duration placesDuration) {
    List<Duration> stretchsDurations =
        _stretchs.map((stretch) => stretch.duration).toList();
    Duration pathDuration =
        stretchsDurations.reduce((value, element) => value + element);
    // List<Duration> placesDurations =
    //     _places.map((place) => place.duration).toList();
    // Duration placesDuration =
    //     placesDurations.reduce((value, element) => value + element);
    return pathDuration + placesDuration;
  }
}

class Stretch {
  String _id;
  List<LatLng> _points;
  Duration _duration;
  String _destinationId;

  Stretch(id, points, duration, destionationId) {
    _id = id;
    _points = points;
    _duration = duration;
    _destinationId = destionationId;
  }

  Map<String, dynamic> toJson() => {
        'id': _id,
        'points': _points
            .map((point) =>
                {'latitude': point.latitude, 'longitude': point.longitude})
            .toList(),
        'duration': _duration.inMinutes,
        'destinationId': _destinationId
      };

  String get id => _id;

  List<LatLng> get points => _points;

  Duration get duration => _duration;

  String get destinationId => _destinationId;
}
