import 'package:google_maps_webservice/src/places.dart';

const AMUSEMENT_PARK = "amusement_park";
const AQUARIUM = "aquarium";
const ART_GALLERY = "art_gallery";
const BAR = "bar";
const BOWLING_ALLEY = "bowling_alley";
const CAFE = "cafe";
const CASINO = "casino";
const CHURCH = "church";
const CITY_HALL = "city_hall";
const COURTHOUSE = "courthouse";
const HINDU_TEMPLE = "hindu_temple";
const LIBRARY = "library";
const MOSQUE = "mosque";
const MOVIE_THEATER = "movie_theater";
const MUSEUM = "museum";
const NIGHT_CLUB = "night_club";
const PARK = "park";
const RESTAURANT = "restaurant";
const SHOPPING_MALL = "shopping_mall";
const STADIUM = "stadium";
const SYNAGOGUE = "synagogue";
const TOURIST_ATTRACTION = "tourist_attraction";
const UNIVERSITY = "university";
const ZOO = "zoo";

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

  Place(String id, {latitude, longitude}) {
    _id = id;
    _latitude = latitude;
    _longitude = longitude;
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
  }

  get detailed => _detailed;

  get id => _id;

  get name => _name;

  get latitude => _latitude;

  get longitude => _longitude;

  get adress => _adress;

  get telephone => _telephone;

  get rating => _rating;

  get icon => _icon;

  List<Photo> get photos => _photos;

  List<Review> get reviews => _reviews;

  get openingHours => _openingHours;

  get weekdaytext => _weekdaytext;

  get openNow => _openNow;

  @override
  String toString() {
    return """
id = $_id
name = $_name
icon = $_icon
adress = $_adress
latitude = $_latitude
longitude = $_longitude
telephone = $_telephone
rating = $_rating
photos = ${_photos}
reviews = ${_reviews}
openingHours = ${_openingHours}
weekdaytext = ${_weekdaytext}
openNow = ${_openNow}
    """;
  }
}
