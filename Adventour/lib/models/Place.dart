
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
  String _id;
  String _name;
  String _icon;
  String _adress;
  double _latitude;
  double _longitude;
  double _rating;

  Place.fromGoogleMaps(Map json) {
    var location = json["geometry"]["location"];

    _id = json["place_id"];
    _name = json["name"];
    _icon = json["icon"];
    _adress = json["vicinity"];
    _latitude = location["lat"];
    _longitude = location["lng"];
  }

  get name => _name;

  get latitude => _latitude;

  get longitude => _longitude;

  @override
  String toString() {
    return """
id = $_id
name = $_name
icon = $_icon
adress = $_adress
latitude = $_latitude
longitude = $_longitude
    """;
  }
}
