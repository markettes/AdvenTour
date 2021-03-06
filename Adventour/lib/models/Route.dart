import 'dart:math';

import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;

class Route {
  LatLng _start;
  List<Place> _places;
  List<Path> _paths;
  String _name;
  List<String> _images;
  String _id;
  String _author;
  DateTime _creationDate;
  String _locationName;
  String _locationId;
  bool _isPublic;
  List<String> _likes;

  Route(start, places, paths, locationName, locationId) {
    _start = start;
    _places = places;
    _paths = paths;
    _creationDate = DateTime.now();
    _locationName = locationName;
    _locationId = locationId;
    _isPublic = true;
    _likes = [];
  }

  Map<String, dynamic> toJson() => {
        'latitude': _start.latitude,
        'longitude': _start.longitude,
        'places': _places.map((place) => place.toJson()).toList(),
        'paths': _paths.map((path) => path.toJson()).toList(),
        'name': _name,
        'images': _images,
        'author': _author,
        'creationDate': _creationDate,
        'locationName': _locationName,
        'locationId': _locationId,
        'isPublic':_isPublic.toString(),
        'likes': _likes,
      };

  Route.fromJson(DocumentSnapshot doc) {
    _id = doc.id;
    var data = doc.data();
    _start = LatLng(data['latitude'], data['longitude']);
    _places = List<Place>();
    for (var place in data['places']) {
      _places.add(Place.fromJson(place));
    }
    _paths = List<Path>();
    for (var path in data['paths']) {
      _paths.add(Path.fromJson(path));
    }
    _name = data['name'];
    _images = List<String>.from(data['images']);
    _author = data['author'];
    _creationDate = (data['creationDate'] as Timestamp).toDate();
    _locationName = data['locationName'];
    _locationId = data['locationId'];
    _isPublic = data['isPublic'] == 'true';
    _likes = List<String>.from(data['likes']);
  }

  String get id => _id;

  String get author => _author;

  set author(String author) => _author = author;

  LatLng get start => _start;

  List<Path> get paths => _paths;

  set paths(List<Path> paths) => _paths = paths;

  List<Place> get places => _places;

  String get name => _name;

  set name(String name) => _name = name;

  set images(List<String> images) => _images = images;

  List<String> get images => _images;

  void addPlace(Place place) => _places.add(place);

  void removePlace(Place place) => _places.remove(place);

  String get locationName => _locationName;

  String get locationId => _locationId;

  String get image => _images[0];

  List get likes => _likes;

  bool get isPublic => _isPublic;

  set isPublic(bool isPublic) => _isPublic = isPublic;

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
    """;
  }
}

Place nearestPlace(Position position, List<Place> places) {
  if (places.isEmpty) return null;
  Place nearestPlace = places.first;
  for (var i = 1; i < places.length; i++) {
    if (Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          places[i].latitude,
          places[i].longitude,
        ) <
        Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          nearestPlace.latitude,
          nearestPlace.longitude,
        )) nearestPlace = places[i];
  }
  return nearestPlace;
}

List<Route> toRoutes(List docs) =>
    docs.map((doc) => Route.fromJson(doc)).toList();

class Path {
  List<Stretch> _stretchs;
  String _transport;

  Path(stretchs, transport) {
    _stretchs = stretchs;
    _transport = transport;
  }

  Path.fromGoogleRoute(directions.Route route,
      List<directions.GeocodedWaypoint> waypoints, String transport) {
    List<Stretch> stretchs = [];
    for (var i = 0; i < route.legs.length; i++) {
      var leg = route.legs[i];
      Duration duration = Duration(seconds: leg.duration.value);
      LatLng destination = LatLng(leg.endLocation.lat, leg.endLocation.lng);
      stretchs.add(Stretch(transport + i.toString(), destination, duration,
          waypoints[i + 1].placeId));
    }
    _stretchs = stretchs;
    _transport = transport;
  }

  Map<String, dynamic> toJson() => {
        'stretchs': _stretchs.map((stretch) => stretch.toJson()).toList(),
        'transport': _transport
      };

  Path.fromJson(Map<dynamic, dynamic> data) {
    _stretchs = new List<Stretch>();
    for (var stretch in data['stretchs']) {
      _stretchs.add(Stretch.fromJson(stretch));
    }
    _transport = data['transport'];
  }

  List<Stretch> get stretchs => _stretchs;
  String get transport => _transport;

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

  @override
  bool operator ==(other) {
    return (other is Path) &&
        _transport == other.transport &&
        _stretchs == other.stretchs;
  }
}

class Stretch {
  String _id;
  Duration _duration;
  String _destinationId;
  LatLng _destination;

  Stretch(id, destination, duration, destionationId) {
    _id = id;
    _destination = destination;
    _duration = duration;
    _destinationId = destionationId;
  }

  Map<String, dynamic> toJson() => {
        'id': _id,
        'latitude': _destination.latitude,
        'longitude': _destination.longitude,
        'duration': _duration.inMinutes,
        'destinationId': _destinationId
      };

  Stretch.fromJson(Map<dynamic, dynamic> data) {
    _id = data['id'];
    _destination = LatLng(data['latitude'], data['longitude']);
    _duration = Duration(minutes: data['duration']);
    _destinationId = data['destinationId'];
  }

  @override
  bool operator ==(other) {
    return (other is Stretch) &&
        _duration == other.duration &&
        roundDouble(_destination.latitude, 4) ==
            roundDouble(other.destination.latitude, 4) &&
        roundDouble(_destination.longitude, 4) ==
            roundDouble(other.destination.longitude, 4);
  }

  String get id => _id;

  Duration get duration => _duration;

  LatLng get destination => _destination;

  String get destinationId => _destinationId;

  double roundDouble(double value, int places) {
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }
}
