import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FinishedRoute {
  DateTime _dateTime;
  Duration _duration;
  String _author;
  String _name;
  List<Place> _places;
  List<String> _images;
  String _id;
  String _routeId;
  String _locationName;

  FinishedRoute(Route route, this._dateTime, this._duration) {
    _author = route.author;
    _name = route.name;
    _places = route.places;
    _images = route.images;
    _routeId = route.id;
  }

  FinishedRoute.fromJson(DocumentSnapshot doc) {
    _id = doc.id;
    var data = doc.data();
    _author = data['author'];
    _name = data['name'];
    _places = List<Place>();
    for (var place in data['places']) {
      _places.add(Place.fromJson(place));
    }
    _images = List<String>.from(data['images']);
    _duration = Duration(minutes: data['duration']);
    _dateTime = (data['dateTime'] as Timestamp).toDate();
    _locationName = data['locationName'];
  }

  Map<String, dynamic> toJson() => {
        'places': _places.map((place) => place.toJson()).toList(),
        'name': _name,
        'images': _images,
        'author': _author,
        'dateTime': _dateTime,
        'locationName': _locationName,
        'duration': _duration.inMinutes
      };

  String get name => _name;

  DateTime get dateTime => _dateTime;

  Duration get duration => _duration;

  List<String> get images => _images;

  String get image => _images[0];

  String get routeId => _routeId;
  
  String get locationName => _locationName;

  String get durationText =>
      _duration.inHours.remainder(60).toString() +
      'h ' +
      _duration.inMinutes.remainder(60).toString() +
      'min';

  List<String> types() {
    List<String> types = [];
    for (var place in _places) {
      if (!types.contains(place.type)) types.add(place.type);
    }
    return types;
  }

  @override
  String toString() {
    return """
name = $_name
duration = $_duration
dateTime = $_dateTime
    """;
  }
}

List<FinishedRoute> toFinisedRoutes(List docs) =>
    docs.map((doc) => FinishedRoute.fromJson(doc)).toList();
