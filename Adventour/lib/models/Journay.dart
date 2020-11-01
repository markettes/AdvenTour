import 'package:Adventour/models/Place.dart';
import 'package:google_maps_webservice/directions.dart';

class Journay {
  String _origin;
  String _destination;
  List<Route> _routes;

  Journay(origin,destination,routes){
    _origin = origin;
    _destination =  destination;
    _routes = routes;
  }

  String get origin => _origin;

  String get destination => _destination;

  List<Route> get routes => _routes;
}