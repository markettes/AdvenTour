import 'dart:convert';

import 'package:Adventour/models/Place.dart';
import 'package:http/http.dart';

class SearchEngine {
  final placesApiKey = "AIzaSyAzLMUtt6ZleHHXpB2LUaEkTjGuT8PeYho";

  Future<List<Place>> searchByLocation(
      double latitude, double longitude) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=' +
            latitude.toString() +
            ',' +
            longitude.toString() +
            '&radius=1500&type=restaurant&key=' +
            placesApiKey;
    Response response = await get(url);
    var decoded = json.decode(response.body);
    List results = decoded["results"];
    List<Place> places =
        results.map((place) => Place.fromGoogleMaps(place)).toList();
    return places;
  }

  Future<List<Place>> searchByLocationCategory(
      double latitude, double longitude, String category) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=' +
            latitude.toString() +
            ',' +
            longitude.toString() +
            '&radius=1500&type=' +
            category +
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
