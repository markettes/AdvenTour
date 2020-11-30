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
  test('is deleting the stop', () async {
    routePage = RoutePage().createState();

    Route r = Route(
      LatLng(39.47820559999999, -0.40747310000000425),
      [
        Place(39.4450763, -0.39401050000000737, '1st place', 'id1'),
        Place(39.4735895, -0.37897259999999733, '2nd place', 'id2'),
        Place(39.4780257, -0.40761059999999816, '3rd place', 'id3'),
        Place(39.4692764, -0.37804199999999355, '4th place', 'id4')
      ],
      [
        Path([
          Stretch('1', LatLng(39.4450763, -0.39401050000000737),
              Duration(minutes: 20), '1st stretch'),
          Stretch('2', LatLng(39.4735895, -0.37897259999999733),
              Duration(minutes: 25), '2nd stretch'),
          Stretch('3', LatLng(39.4780257, -0.40761059999999816),
              Duration(minutes: 20), '3rd stretch'),
          Stretch('4', LatLng(39.4692764, -0.37804199999999355),
              Duration(minutes: 25), '4th stretch')
        ], WALK),
        Path([
          Stretch('1', LatLng(39.4450763, -0.39401050000000737),
              Duration(minutes: 20), '1st stretch'),
          Stretch('2', LatLng(39.4735895, -0.37897259999999733),
              Duration(minutes: 25), '2nd stretch'),
          Stretch('3', LatLng(39.4780257, -0.40761059999999816),
              Duration(minutes: 20), '3rd stretch'),
          Stretch('4', LatLng(39.4692764, -0.37804199999999355),
              Duration(minutes: 25), '4th stretch')
        ], CAR),
        Path([
          Stretch('1', LatLng(39.4450763, -0.39401050000000737),
              Duration(minutes: 20), '1st stretch'),
          Stretch('2', LatLng(39.4735895, -0.37897259999999733),
              Duration(minutes: 25), '2nd stretch'),
          Stretch('3', LatLng(39.4780257, -0.40761059999999816),
              Duration(minutes: 20), '3rd stretch'),
          Stretch('4', LatLng(39.4692764, -0.37804199999999355),
              Duration(minutes: 25), '4th stretch')
        ], BICYCLE),
      ],
      'Marcos Gálvez',
      'Valencia con niños',
    );

    routePage.route = r;
    routePage.removePlace(routePage.route.places[3]);
    expect(routePage.route.places.length, 3);
  });

  test('is deleting the stretch', () async {
    routePage = RoutePage().createState();
    // List<String> _placeTypes = [PARK, TOURIST_ATTRACTION, RESTAURANT, MUSEUM];
    // Route route = await routeEngine.makeRoute(
    //     'ChIJb7Dv8ExPYA0ROR1_HwFRo7Q', _placeTypes, MEDIUM_DISTANCE);
    Route r = Route(
      LatLng(39.47820559999999, -0.40747310000000425),
      [
        Place(39.4450763, -0.39401050000000737, '1st place', 'id1'),
        Place(39.4735895, -0.37897259999999733, '2nd place', 'id2'),
        Place(39.4780257, -0.40761059999999816, '3rd place', 'id3'),
        Place(39.4692764, -0.37804199999999355, '4th place', 'id4')
      ],
      [
        Path([
          Stretch('1', LatLng(39.4450763, -0.39401050000000737),
              Duration(minutes: 20), '1st stretch'),
          Stretch('2', LatLng(39.4735895, -0.37897259999999733),
              Duration(minutes: 25), '2nd stretch'),
          Stretch('3', LatLng(39.4780257, -0.40761059999999816),
              Duration(minutes: 20), '3rd stretch'),
          Stretch('4', LatLng(39.4692764, -0.37804199999999355),
              Duration(minutes: 25), '4th stretch')
        ], WALK),
        Path([
          Stretch('1', LatLng(39.4450763, -0.39401050000000737),
              Duration(minutes: 20), '1st stretch'),
          Stretch('2', LatLng(39.4735895, -0.37897259999999733),
              Duration(minutes: 25), '2nd stretch'),
          Stretch('3', LatLng(39.4780257, -0.40761059999999816),
              Duration(minutes: 20), '3rd stretch'),
          Stretch('4', LatLng(39.4692764, -0.37804199999999355),
              Duration(minutes: 25), '4th stretch')
        ], CAR),
        Path([
          Stretch('1', LatLng(39.4450763, -0.39401050000000737),
              Duration(minutes: 20), '1st stretch'),
          Stretch('2', LatLng(39.4735895, -0.37897259999999733),
              Duration(minutes: 25), '2nd stretch'),
          Stretch('3', LatLng(39.4780257, -0.40761059999999816),
              Duration(minutes: 20), '3rd stretch'),
          Stretch('4', LatLng(39.4692764, -0.37804199999999355),
              Duration(minutes: 25), '4th stretch')
        ], BICYCLE),
      ],
      'Marcos Gálvez',
      'Valencia con niños',
    );
    routePage.route = r;
    await routePage.removePlace(routePage.route.places[3]);
    print(routePage.route.paths[0].transport);
    for (var st in routePage.route.paths[0].stretchs) {
      print(st.duration.inMinutes);
      print(st.destination);
    }
    expect(routePage.route.paths[0].stretchs.length, 3);
  });
}
