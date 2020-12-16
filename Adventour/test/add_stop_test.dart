import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/controllers/route_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('add_stop', () async {
    List<String> _placeTypes = [PARK, TOURIST_ATTRACTION, RESTAURANT, MUSEUM];
    Route route = await routeEngine.makeRoute(
        'ChIJb7Dv8ExPYA0ROR1_HwFRo7Q', _placeTypes, MEDIUM_DISTANCE);

    expect(route.locationId, 'ChIJb7Dv8ExPYA0ROR1_HwFRo7Q');
    expect(route.locationName, 'Valencia');
    expect(route.likes, 0);
    expect(route.places.length, 6);

    route.addPlace(Place(0.42144, 0.4123412));

    expect(route.places.length, 7);
  });
}
