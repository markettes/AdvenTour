import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;

class Path {
  List<LatLng> _points;
  List<LatLng> _wayPoints;
  List<Duration> _durations;
  String _transport;

  Path.fromGoogleRoute(directions.Route route, String transport) {
    List<LatLng> points = [];
    List<LatLng> wayPoints = [];
    List<Duration> durations = [];
    print(route.legs.first.startLocation);
    wayPoints.add(LatLng(route.legs.first.startLocation.lat,
        route.legs.first.startLocation.lng));
    for (var leg in route.legs) {
      print('> ' + leg.duration.value.toString());
      wayPoints.add(LatLng(leg.endLocation.lat, leg.endLocation.lng));
      durations.add(Duration(minutes: leg.duration.value.toInt()));
      for (var step in leg.steps) {
        points.add(LatLng(step.startLocation.lat, step.startLocation.lng));
      }
    }
    _points = points;
    _transport = transport;
    _wayPoints = wayPoints;
    _durations = durations;
  }

  List<LatLng> get points => _points;

  List<LatLng> get wayPoints => _wayPoints;

  List<Duration> get durations => _durations;

  get transport => _transport;
}
