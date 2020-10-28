import 'dart:convert';

import 'package:Adventour/models/Place.dart';
import 'package:http/http.dart';

class SearchEngine {
  final placesApiKey = "AIzaSyAzLMUtt6ZleHHXpB2LUaEkTjGuT8PeYho";

  Future<List<Place>> searchByLocation(
      String type, double latitude, double longitude, int radius) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=' +
            latitude.toString() +
            ',' +
            longitude.toString() +
            '&radius=' +
            radius.toString() +
            '&type=' +
            type +
            '&key=' +
            placesApiKey;
    Response response = await get(url);
    var decoded = json.decode(response.body);
    List results = decoded["results"];
    List<Place> places =
        results.map((place) => Place.fromGoogleMaps(place)).toList();
    return places;
  }

  Future<List<Place>> searchByText(String text) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=' +
            text +
            '&key=' +
            placesApiKey;
    Response response = await get(url);
    var decoded = json.decode(response.body);
    List results = decoded["results"];
    List<Place> places =
        results.map((place) => Place.fromGoogleMaps(place)).toList();
    return places;
  }
}
