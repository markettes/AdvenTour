import 'package:Adventour/libraries/place.dart';
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
  String _icon;
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

  Place(latitude, longitude, [name, id, types, rating, icon, duration]) {
    _detailed = false;
    _latitude = latitude;
    _longitude = longitude;
    _name = name;
    _id = id;
    _types = types;
    _rating = rating;
    _icon = icon;
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
    _icon = result.icon;
    _latitude = result.geometry.location.lat;
    _longitude = result.geometry.location.lng;
    _types = result.types;
    _rating = result.rating;
    _userRatingsTotal = result.userRatingsTotal;
    _adress = result.vicinity;
    _duration = Duration(minutes: 30);
  }

  Place.fromDetails(PlaceDetails details) {
    _detailed = true;
    _id = details.placeId;
    _name = details.name;
    _icon = details.icon;
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
        'latitude': _latitude,
        'longitude': _longitude,
        'name': _name,
        'icon': _icon,
        'duration': _duration.inMinutes,
      };

  get detailed => _detailed;

  get id => _id;

  get name => _name;

  get latitude => _latitude;

  get longitude => _longitude;

  get adress => _adress;

  get telephone => _telephone;

  num get rating => _rating;

  get icon => _icon;

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
type = $_types
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

  void sortPlaceTypes(List<String> selectedTypes) {
    List sorted = [];
    sorted.addAll(selectedTypes);
    for (var placeType in placeTypes) {
      if (!sorted.contains(placeType)) sorted.add(placeType);
    }
    placeTypes = sorted;
  }

// icon = $_icon
// adress = $_adress
// latitude = $_latitude
// longitude = $_longitude
// telephone = $_telephone
// rating = $_rating
// photos = ${_photos}
// reviews = ${_reviews}
// openingHours = ${_openingHours}
// weekdaytext = ${_weekdaytext}
// openNow = ${_openNow}
