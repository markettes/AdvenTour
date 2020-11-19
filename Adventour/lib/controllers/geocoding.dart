import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/directions.dart';

class Geocoding {
  final _geocoding = GoogleMapsGeocoding(
    apiKey: "AIzaSyD3tJNw9gvqyeBxcqAYbPEYMOBAfIprRds",
  );

  Future<Location> searchByPlaceId(String placeId) async {
    GeocodingResponse response = await _geocoding.searchByPlaceId(
      placeId,
    );
    return response.results.first.geometry.location;
  }
}

Geocoding geocoding = Geocoding();
