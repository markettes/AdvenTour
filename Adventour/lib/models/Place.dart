class Place {
  String _id;
  String _name;
  String _icon;
  String _adress;
  double _latitude;
  double _longitude;
  num _rating;

  Place.fromGoogleMaps(Map json) {

    var location = json["geometry"]["location"];

    _id = json["place_id"];
    _name = json["name"];
    _icon = json["icon"];
    _adress = json["vicinity"];
    _latitude = location["lat"];
    _longitude = location["lng"];
    _rating = json["rating"];
  }

  get name => _name;
  get id => _id;
  get adress => _adress;
  get latitude => _latitude;
  get longitude => _longitude;
  get rating => _rating;

  @override
  String toString() {
    return """
id = $_id
name = $_name
icon = $_icon
adress = $_adress
latitude = $_latitude
longitude = $_longitude
rating = $_rating
    """;
  }
}
