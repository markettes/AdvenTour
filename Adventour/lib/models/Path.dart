import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;

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
      Duration duration = Duration(seconds: leg.duration.value.toInt());
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
