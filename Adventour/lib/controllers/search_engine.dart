import 'package:Adventour/models/Place.dart';
import 'package:google_maps_webservice/src/core.dart';
import 'package:google_maps_webservice/src/places.dart';

class SearchEngine {
  GoogleMapsPlaces _googleMapsPlaces =
      GoogleMapsPlaces(apiKey: "AIzaSyAzLMUtt6ZleHHXpB2LUaEkTjGuT8PeYho");

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

  Future<List<Place>> searchByText(
      String text, Location location, int radius) async {
    PlacesSearchResponse response = await _googleMapsPlaces.searchByText(text,
        location: location, radius: radius);

    List<Place> places =
        response.results.map((result) => Place.fromNearby(result)).toList();

    return places;
  }

  Future<Place> searchWithDetails(
      String id) async {
    PlacesDetailsResponse response = await _googleMapsPlaces.getDetailsByPlaceId(id);


    Place place = Place.fromDetails(response.result);

    return place;
  }
}

SearchEngine searchEngine = SearchEngine();
