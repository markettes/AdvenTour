import 'dart:ffi';

import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/controllers/map_controller.dart';
import 'package:Adventour/models/Path.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() {
  //SdkContext.init(IsolateOrigin.main);
  runApp(NavigationPage());
}

class NavigationPage extends StatefulWidget {
  NavigationPage({Key key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final Set<Polyline> polyline = {};

  r.Route route1 = r.Route([
    Place(39.47018449999999, -0.3705346, 'Start', 'Start'),
    Place(39.4753061, -0.3764726, 'Catedral de Valencia',
        'ChIJb2UMoVJPYA0R2uk8Hly_1uU', CHURCH, 5),
    Place(39.4752113, -0.3552065, 'Ciudad de las artes y de las ciencias',
        'ChIJgUOb0elIYA0RlPjrpQdE62I', [MUSEUM], 5)
  ], [
    Path([
      Stretch(
          '1',
          [
            LatLng(39.47018449999999, -0.3705346),
            LatLng(39.4753061, -0.3764726)
          ],
          Duration(minutes: 20)),
      Stretch(
          '2',
          [LatLng(39.4753061, -0.3764726), LatLng(39.4752113, -0.3552065)],
          Duration(minutes: 25))
    ], CAR)
  ]);

  r.Route route;
  GoogleMapController mapController;
  List<LatLng> routeCoords;
  GoogleMapPolyline googleMapPolyline = new GoogleMapPolyline(
    apiKey: "AIzaSyAzLMUtt6ZleHHXpB2LUaEkTjGuT8PeYho",
  );

  getSomePoints() async {
    for (var i = 0; i < route1.places.length - 1; i++) {
      Place start = route1.places[i];
      Place end = route1.places[i + 1];

      routeCoords.addAll(await googleMapPolyline.getCoordinatesWithLocation(
          origin: LatLng(start.latitude, start.longitude),
          destination: LatLng(end.latitude, end.longitude),
          mode: RouteMode.driving));
    }
  }

  Location location;
  LocationData currentLocation;
  double bearing;

  @override
  void initState() {
    super.initState();
    getSomePoints();

    location = Location();

    location.onLocationChanged.listen((LocationData cLoc) {
      setState(() {
        currentLocation = cLoc;
        bearing = currentLocation.heading;
      });

      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              currentLocation.latitude,
              currentLocation.longitude,
            ),
            tilt: 45,
            bearing: bearing,
            zoom: 22,
          ),
        ),
      );
    });

    setInitialLocation();
  }

  @override
  Widget build(BuildContext context) {
    //Map arguments = ModalRoute.of(context).settings.arguments;
    //route = arguments['route'];

    CameraPosition initialCameraPosition = CameraPosition(
      zoom: 22,
      tilt: 45,
      target: LatLng(39.432346, -0.425294),
    );
    if (currentLocation != null) {
      initialCameraPosition = CameraPosition(
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 22,
        tilt: 45,
        bearing: bearing,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                mapController = controller;
                polyline.add(Polyline(
                  polylineId: PolylineId('route1'),
                  visible: true,
                  points: routeCoords,
                  width: 8,
                  color: Theme.of(context).primaryColor,
                  startCap: Cap.roundCap,
                  endCap: Cap.buttCap,
                ));
              });
            },
            polylines: polyline,
            initialCameraPosition: initialCameraPosition,
            myLocationEnabled: true,
          ),
        ),
      ),
    );
  }

  void setInitialLocation() async {
    currentLocation = await location.getLocation();
  }
}
