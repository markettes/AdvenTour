import 'package:Adventour/models/Place.dart';
import 'package:google_maps_webservice/src/core.dart';
import 'package:Adventour/libraries/place.dart';

String API_KEY = "AIzaSyD3tJNw9gvqyeBxcqAYbPEYMOBAfIprRds";

class SearchEngine {
  GoogleMapsPlaces _googleMapsPlaces =
      GoogleMapsPlaces(apiKey: API_KEY);

  Future<List<Place>> searchByLocation(Location location, int radius) async {
    PlacesSearchResponse response =
        await _googleMapsPlaces.searchNearbyWithRadius(location, radius);

    List<Place> places =
        response.results.map((result) => Place.fromNearby(result)).toList();

    return places;
  }

  Future<List<Place>> searchByLocationWithType(
      String type, Location location, int radius) async {
    PlacesSearchResponse response = await _googleMapsPlaces
        .searchNearbyWithRadius(location, radius, type: type);
    List<Place> places =
        response.results.map((result) => Place.fromNearby(result)).toList();

    return places;
  }

  Future<List<Place>> searchByLocationByRank(
      String type, Location location, int radius) async {
    PlacesSearchResponse response = await _googleMapsPlaces
        .searchNearbyWithRankBy(location, 'prominence', type: type);
    List<Place> places =
        response.results.map((result) => Place.fromNearby(result)).toList();

    return places;
  }

  Future<List<Place>> searchByText(
      String text, Location location, int radius) async {
    PlacesSearchResponse response = await _googleMapsPlaces.searchByText(text,
        location: location, radius: radius);

    List<Place> places =
        response.results.map((result) => Place.fromNearby(result)).toList();

    return places;
  }

  Future<Place> searchWithDetails(String id) async {
    PlacesDetailsResponse response =
        await _googleMapsPlaces.getDetailsByPlaceId(id);

    Place place = Place.fromDetails(response.result);

    return place;
  }

  String searchPhoto(String photoReference) {
    return _googleMapsPlaces.buildPhotoUrl(
        photoReference: photoReference, maxHeight: 1000, maxWidth: 1000);
  }
}

SearchEngine searchEngine = SearchEngine();
