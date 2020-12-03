import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/controllers/route_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('delete stop', () async {
    List<String> _placeTypes = [PARK, TOURIST_ATTRACTION, RESTAURANT, MUSEUM];
    Route route = await routeEngine.makeRoute(
        'ChIJb7Dv8ExPYA0ROR1_HwFRo7Q', _placeTypes, MEDIUM_DISTANCE);
    expect(route.places.length, 6);
    route.removePlace(route.places[5]);
    expect(route.places.length, 5);
  });
}
