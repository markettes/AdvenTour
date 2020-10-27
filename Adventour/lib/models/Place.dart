class Place {
  String _id;
  String _name;
  String _icon;
  String _adress;

  Place.fromGoogleMaps(Map json) {
    _id = json["place_id"];
    _name = json["name"];
    _icon = json["icon"];
    _adress = json["vicinity"];
  }

  get name => _name;

  @override
  String toString() {
    return """
id = $_id
name = $_name
icon = $_icon
adress = $_adress
    """;
  }
}
