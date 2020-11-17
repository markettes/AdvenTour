import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/libraries/place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// NO EN RUTAS PERO IMPLEMENTAR DE OTRA FROMA
// const ZOO = "zoo";
// const AMUSEMENT_PARK = "amusement_park";
// const AQUARIUM = "aquarium";
//const CASINO = "casino";

//SHORT
const PLACE_OF_WORSHIP = "place_of_worship"; // + 30
const MOVIE_THEATER = "movie_theater"; // 30
const PARK = "park"; // + 20
const STADIUM = "stadium"; // 20
const TOURIST_ATTRACTION = "tourist_attraction"; // + 30
//LARGE
const MUSEUM = "museum"; // + 45
const NIGHT_CLUB = "night_club"; // + 60
const RESTAURANT = "restaurant"; // 60
const SHOPPING_MALL = "shopping_mall"; // 60
const NATURAL = "natural_feature";

List placeTypes = [
  RESTAURANT,
  PLACE_OF_WORSHIP,
  MOVIE_THEATER,
  PARK,
  STADIUM,
  TOURIST_ATTRACTION,
  MUSEUM,
  NIGHT_CLUB,
  SHOPPING_MALL,
  NATURAL
];

class Place {
  bool _detailed;
  String _id;
  String _name;
  String _type;
  String _adress;
  String _telephone;
  double _latitude;
  double _longitude;
  num _rating;
  List<Photo> _photos;
  List<Review> _reviews;
  OpeningHoursDetail _openingHours;
  List<String> _weekdaytext;
  bool _openNow;
  List<String> _types;
  num _userRatingsTotal;
  Duration _duration;

  Place(latitude, longitude, [name, id, types, rating, type, duration]) {
    _detailed = false;
    _latitude = latitude;
    _longitude = longitude;
    _name = name;
    _id = id;
    _types = types;
    _rating = rating;
    _type = type;
    _duration = duration;
  }

  // Place.fromGoogleMaps(Map json) {

  //   _id = json["place_id"];
  //   _name = json["name"];
  //   _icon = json["icon"];
  //   _adress = json["vicinity"];
  //   _latitude = location["lat"];
  //   _longitude = location["lng"];
  // }

  Place.fromNearby(PlacesSearchResult result) {
    _detailed = false;
    _id = result.placeId;
    _name = result.name;
    _type = googleIconToType(result.icon);
    _latitude = result.geometry.location.lat;
    _longitude = result.geometry.location.lng;
    _types = result.types;
    _rating = result.rating;
    _userRatingsTotal = result.userRatingsTotal;
    _adress = result.vicinity;
    _duration = Duration(minutes: 30);
    _photos = result.photos;
  }

  Place.fromDetails(PlaceDetails details) {
    _detailed = true;
    _id = details.placeId;
    _name = details.name;
    _type = googleIconToType(details.icon);
    _adress = details.vicinity;
    _latitude = details.geometry.location.lat;
    _longitude = details.geometry.location.lng;
    _rating = details.rating;
    _photos = details.photos;
    _telephone = details.formattedPhoneNumber;
    _reviews = details.reviews;
    if (_reviews != null) {
      _reviews.sort((a, b) => b.rating.compareTo(a.rating));
    }
    if (details.openingHours != null) {
      _openingHours = details.openingHours;
      _weekdaytext = details.openingHours.weekdayText;
      _openNow = details.openingHours.openNow;
    }
    _duration = Duration(minutes: 30);
  }

  Map<String, dynamic> toJson() => {
        'id': _id,
        'latitude': _latitude,
        'longitude': _longitude,
        'name': _name,
        'type': _type,
        'duration': _duration.inMinutes,
        'types': _types
      };

  Place.fromJson(Map<dynamic, dynamic> data) {
    _id = data['id'];
    _latitude = data['latitude'];
    _longitude = data['longitude'];
    _name = data['name'];
    _type = data['type'];
    _duration = Duration(minutes: data['duration']);
    _types = new List<String>();
    for (var type in data['types']) {
      _types.add(type);
    }
  }

  get detailed => _detailed;

  get id => _id;

  get name => _name;

  get latitude => _latitude;

  get longitude => _longitude;

  get adress => _adress;

  get telephone => _telephone;

  num get rating => _rating;

  get type => _type;

  List<Photo> get photos => _photos;

  List<Review> get reviews => _reviews;

  get openingHours => _openingHours;

  get weekdaytext => _weekdaytext;

  get openNow => _openNow;

  List<String> get types => _types;

  num get userRatingsTotal => _userRatingsTotal;

  Duration get duration => _duration;

  @override
  String toString() {
    return """
id = $_id
name = $_name
type = $_type
photos = $_photos
types = $_types
    """;
  }
}

Place getFurthestPlace(LatLng location, List<Place> places) {
  if (places.isEmpty) return null;
  Place furthestPlace = places.first;
  for (var place in places) {
    if (Geolocator.distanceBetween(location.latitude, location.longitude,
            place.latitude, place.longitude) >
        Geolocator.distanceBetween(
            location.latitude,
            location.longitude,
            furthestPlace.latitude,
            furthestPlace.longitude)) furthestPlace = place;
  }
  return furthestPlace;
}

String googleIconToType(String icon) {
  switch (icon) {
    case 'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png':
      return PARK;
    case 'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/worship_general-71.png':
      return PLACE_OF_WORSHIP;
    case 'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png':
      return RESTAURANT;
    case 'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png':
      return TOURIST_ATTRACTION;
    case 'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/camping-71.png':
      return NATURAL;
    case 'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png':
      return SHOPPING_MALL;
    case 'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png':
      return TOURIST_ATTRACTION;
    case 'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/museum-71.png':
      return MUSEUM;
    case 'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/lodging-71.png':
      return null;
    default:
      throw Exception('Icon $icon not implemented');
  }
}

void sortPlaceTypes(List<String> selectedTypes) {
  List sorted = [];
  sorted.addAll(selectedTypes);
  for (var placeType in placeTypes) {
    if (!sorted.contains(placeType)) sorted.add(placeType);
  }
  placeTypes = sorted;
}

IconData typeToIcon(String type) {
  switch (type) {
    case CAR:
      return Icons.directions_car;
    case WALK:
      return Icons.directions_walk;
    case BICYCLE:
      return Icons.directions_bike;
    case PARK:
      return Icons.fence;
    case PLACE_OF_WORSHIP:
      return Icons.history_edu;
    case RESTAURANT:
      return Icons.restaurant;
    case TOURIST_ATTRACTION:
      return Icons.camera_alt;
    case MOVIE_THEATER:
      return Icons.theater_comedy;
    case STADIUM:
      return Icons.sports;
    case MUSEUM:
      return Icons.museum;
    case NIGHT_CLUB:
      return Icons.nightlife;
    case SHOPPING_MALL:
      return Icons.local_mall;
    case NATURAL:
      return Icons.eco;
    default:
      throw Exception('Icon not available for $type');
  }
}
