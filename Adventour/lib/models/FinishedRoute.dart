import 'package:Adventour/models/Route.dart';

class FinishedRoute extends Route {
  DateTime _dateTime;
  Duration _duration;
  FinishedRoute(
      route, this._dateTime,this._duration)
      : super(route.start, route.places, route.paths, route.author, route.locationName, route.locationId);

  toJson(){
    //TODO
  }

  DateTime get dateTime => _dateTime;

  Duration get duration => _duration;
}
