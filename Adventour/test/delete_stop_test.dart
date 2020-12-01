import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/controllers/route_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart';
import 'package:Adventour/pages/route_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/mockito.dart';
import 'dart:math';

Future<void> main() async {
  var routePage;

  test('delete stop', () async {
    routePage = RoutePage().createState();
    List<String> _placeTypes = [PARK, TOURIST_ATTRACTION, RESTAURANT, MUSEUM];
    Route route = await routeEngine.makeRoute(
        'ChIJb7Dv8ExPYA0ROR1_HwFRo7Q', _placeTypes, MEDIUM_DISTANCE);
    routePage.route = route;
    expect(route.places.length, 6);
    routePage.removePlace(route.places[5]);
    expect(route.places.length, 5);
  });
}
