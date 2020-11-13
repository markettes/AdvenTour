import 'dart:ffi';

import 'package:Adventour/controllers/map_controller.dart';
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

  r.Route route;
  GoogleMapController mapController;
  List<LatLng> routeCoords;
  GoogleMapPolyline googleMapPolyline = new GoogleMapPolyline(
    apiKey: "AIzaSyAzLMUtt6ZleHHXpB2LUaEkTjGuT8PeYho",
  );

  getSomePoints() async {
    routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
        origin: LatLng(39.432346, -0.425294),
        destination: LatLng(39.433756, -0.427180),
        mode: RouteMode.driving);
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
