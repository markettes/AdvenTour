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

  r.Route route1 = r.exampleRoute;

  r.Route route;
  GoogleMapController mapController;
  List<LatLng> routeCoords = List();
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

    print(routeCoords);
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

      if (mapController != null) {
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
      }
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: Icon(Icons.cancel),
            color: Theme.of(context).buttonColor,
            onPressed: () {
              return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return cancelar_ruta_alert();
                  });
            },
          ),
          title: Text("Título de la ruta?"),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ], //Menú de los tres puntitos.
        ),
        bottomNavigationBar: null, //Falta esto
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

class cancelar_ruta_alert extends StatelessWidget {
  const cancelar_ruta_alert({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("¿Deseas cancelar la ruta?"),
      content: Text(
          "Si cancelas la ruta perderás todo el progreso realizado hasta ahora. ¿Seguro que quieres cancelarla?"),
      actions: [
        TextButton(
            onPressed: () {
              return Navigator.of(context).pop();
            },
            child: Text("Volver a la ruta")),
        TextButton(onPressed: null, child: Text("Sí")) //Cancelar ruta
      ],
    );
  }
}
