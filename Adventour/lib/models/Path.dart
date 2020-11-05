import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;

class Path {
  List<Stretch> _stretchs;
  String _transport;

  Path(stretchs,transport){
    _stretchs = stretchs;
    _transport = transport;
  }

  Path.fromGoogleRoute(directions.Route route, String transport) {
    List<Stretch> stretchs = [];
    for (var leg in route.legs) {
      List<LatLng> points = [];
      for (var step in leg.steps) {
        points.add(LatLng(step.startLocation.lat, step.startLocation.lng));
      }
      Duration duration = Duration(minutes: leg.duration.value.toInt());
      stretchs.add(Stretch(points, duration));
    }
    _stretchs = stretchs;
    _transport = transport;
  }

  List<Stretch> get stretchs => _stretchs;

  get transport => _transport;
}

class Stretch {
  List<LatLng> _points;
  Duration _duration;

  Stretch(points,duration){
    _points = points;
    _duration = duration;
  }

  List<LatLng> get points => _points;

  Duration get duration => _duration;
}