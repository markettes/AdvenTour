import 'package:Adventour/controllers/search_engine.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/directions.dart';

class Geocoding {
  final _geocoding = GoogleMapsGeocoding(
    apiKey: API_KEY,
  );

  Future<Location> searchByPlaceId(String placeId) async {
    GeocodingResponse response = await _geocoding.searchByPlaceId(
      placeId,
    );
    return response.results.first.geometry.location;
  }
}

Geocoding geocoding = Geocoding();
