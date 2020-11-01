import 'package:Adventour/models/Place.dart';
import 'package:google_maps_webservice/directions.dart';

class Journay {
  Place _origin;
  Place _destination;
  List<Route> _routes;

  Journay(origin,destination,routes){
    _origin = origin;
    _destination =  destination;
    _routes = routes;
  }

  Place get origin => _origin;

  Place get destination => _destination;

  List<Route> get routes => _routes;
}