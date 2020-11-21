import 'dart:async';
import 'dart:ffi';

import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/controllers/map_controller.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/models/Stack.dart' as s;
import 'package:Adventour/pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  MapController _mapController = MapController();

  r.Route route;

  Stopwatch stopwatch = Stopwatch();

  //Time Logic
  s.Stack<r.Stretch> stretches = s.Stack();
  s.Stack<r.Stretch> stretchesPassed = s.Stack();

  Location location;
  LocationData currentLocation;
  double bearing;


  @override
  void initState() {
    super.initState();

    location = Location();

    location.onLocationChanged.listen((LocationData cLoc) {
      setState(() {
        currentLocation = cLoc;
        bearing = currentLocation.heading;
      });

      if (stretches.toList().isNotEmpty) {
        checkStretch(cLoc);
      }
    });

    setInitialLocation();
  }

  void checkStretch(LocationData loc) {
    r.Stretch st = stretches.pop();
    LatLng dest = st.destination;
    if (Geolocator.distanceBetween(
          loc.latitude,
          loc.longitude,
          dest.latitude,
          dest.longitude,
        ) <
        20.0) {
      stretchesPassed.push(st);
    } else {
      stretches.push(st);
    }
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    route = arguments['route'];
    List listaStretches = route.paths.first.stretchs;

    Polyline polyline = arguments['polyline'];
    print('?'+polyline.toString());

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

    String tiempoRestante() {
      int tiempoRestante = 0;
      for (var st in stretches.toList()) {
        tiempoRestante += st.duration.inMinutes;
      }
      return '${tiempoRestante ~/ 60}h ${tiempoRestante % 60}min';
    }

    String tiempoDurante() {
      Duration time = stopwatch.elapsed;
      if (time.inMinutes < 60) {
        return '${time.inMinutes % 60}min';
      } else {
        return '${time.inMinutes ~/ 60}h ${time.inMinutes % 60}min';
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(Icons.cancel),
          color: Theme.of(context).buttonColor,
          onPressed: () {
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CancelRouteAlert();
                });
          },
        ),
        title: Text(''), //TO DO.
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ], //Menú de los tres puntitos.
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black, blurRadius: 5),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.info,
                color: Theme.of(context).primaryColor,
                size: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.directions_walk,
                          color: Theme.of(context).primaryColor),
                      Text('${tiempoRestante()}'),
                      Icon(
                        Icons.location_pin,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text('${stretches.toList().length}')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.alarm, color: Theme.of(context).primaryColor),
                      Text(
                        '${tiempoDurante()}',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: GoogleMap(
          onMapCreated: (googleMapController) =>
              _mapController.onMapCreated(googleMapController, () {
            _mapController.goToCoordinates(
                currentLocation.latitude, currentLocation.longitude, 22);
            _mapController.drawPolyline(polyline);
            for (var place in route.places) {
              _mapController.addMarker(place, context);
            }
            if (stopwatch.isRunning) {
              stopwatch.stop();
              stopwatch.reset();
            }
            stopwatch.start();
            for (var i = listaStretches.length - 1; i >= 0; i--) {
              stretches.push(listaStretches[i]);
            }
            setState(() {});
          }),
          markers: Set<Marker>.of(_mapController.markers.values),
          polylines: Set<Polyline>.of(_mapController.polylines.values),
          initialCameraPosition: initialCameraPosition,
          myLocationEnabled: true,
        ),
      ),
    );
  }

  void setInitialLocation() async {
    currentLocation = await location.getLocation();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class CancelRouteAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Would you like to cancel the route?"),
      content: Text(
          "If you cancel the route you will loose all the progress. Are you sure?"),
      actions: [
        TextButton(
            onPressed: () {
              return Navigator.of(context).pop();
            },
            child: Text("Return")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              //Borrar progreso ruta actual (?)
              Navigator.of(context).pop();
            },
            child: Text("Yes")) //Cancelar ruta
      ],
    );
  }
}
