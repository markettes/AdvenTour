import 'dart:async';

import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/controllers/map_controller.dart';
import 'package:Adventour/controllers/polyline_engine.dart';
import 'package:Adventour/models/FinishedRoute.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/models/Route.dart';
import 'package:Adventour/pages/search_page.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  MapController _mapController = MapController();

  r.Route route;

  Stopwatch stopwatch = Stopwatch();

  //Time Logic
  List<Place> _places = [];

  Position _position;
  Polyline _polyline;
  int _selectedPath = 0;
  bool _listVisible = true;
  List<LatLng> routeCoords = List();
  bool _fixedPosition = true;
  bool _finished = false;
  FinishedRoute _finishedRoute;
  // double bearing;

  // @override
  // void initState() {
  //   super.initState();

  //   location = Location();

  //   locationStream = location.onLocationChanged.listen((LocationData cLoc) {
  //     currentLocation = cLoc;
  //     bearing = currentLocation.heading;

  //     if (stretches.toList().isNotEmpty) {
  //       checkStretch(cLoc);
  //     }

  //     setState(() {});
  //   });

  //   setInitialLocation();
  // }

  @override
  void dispose() {
    stopwatch = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    route = arguments['route'];

    // CameraPosition initialCameraPosition = CameraPosition(
    //   zoom: 22,
    //   tilt: 45,
    //   target: LatLng(39.432346, -0.425294),
    // );
    // if (_position != null) {
    //   initialCameraPosition = CameraPosition(
    //     target: LatLng(_position.latitude, _position.longitude),
    //     zoom: 22,
    //     tilt: 45,
    //     // bearing: 90
    //   );
    // }

    return WillPopScope(
      onWillPop: () {
        _showCancelAlert();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(route.name),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
        bottomNavigationBar: !_finished
            ? Container(
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
                              Text(
                                  '${route.paths[_selectedPath].stretchs.length}')
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.alarm,
                                  color: Theme.of(context).primaryColor),
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
              )
            : null,
        body: !_finished
            ? StreamBuilder(
                stream: Geolocator.getPositionStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  _position = snapshot.data;

                  if (_places.isNotEmpty) {
                    _checkStretch(_position);
                    _drawNextPlace(_position);
                  }
                  if (_fixedPosition && _mapController.mapCreated) {
                    _mapController.goToCoordinates(
                        _position.latitude, _position.longitude, 19);
                  }

                  return Stack(children: [
                    Listener(
                      child: GoogleMap(
                        onMapCreated: (googleMapController) => _mapController
                            .onMapCreated(googleMapController, () async {
                          _mapController.goToCoordinates(
                              _position.latitude, _position.longitude, 20);
                          // _mapController.drawPolyline(polyline);
                          for (var place in route.places) {
                            _mapController.addMarker(place, context);
                          }
                          if (stopwatch.isRunning) {
                            stopwatch.stop();
                            stopwatch.reset();
                          }
                          stopwatch.start();

                          _places.addAll(route.places);

                          setState(() {});
                        }),
                        onCameraMoveStarted: () {
                          _listVisible = false;
                          setState(() {});
                        },
                        onCameraIdle: () {
                          _listVisible = true;
                          setState(() {});
                        },
                        markers: Set<Marker>.of(_mapController.markers.values),
                        polylines:
                            Set<Polyline>.of(_mapController.polylines.values),
                        initialCameraPosition: CameraPosition(
                          target:
                              LatLng(_position.latitude, _position.longitude),
                          zoom: 22,
                          tilt: 45,
                          // bearing: 90
                        ),
                        myLocationEnabled: true,
                        zoomControlsEnabled: false,
                        myLocationButtonEnabled: false,
                      ),
                      onPointerMove: (event) {
                        if (_fixedPosition)
                          setState(() {
                            _fixedPosition = false;
                          });
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: AnimatedOpacity(
                        opacity: _listVisible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 600),
                        curve: Curves.fastOutSlowIn,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleIconButton(
                            type: route.paths[_selectedPath].transport,
                            onPressed: nextTransport,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: AnimatedOpacity(
                        opacity: _listVisible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 600),
                        curve: Curves.fastOutSlowIn,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleIconButton(
                            icon: Icon(
                              Icons.gps_fixed,
                              color: _fixedPosition
                                  ? Colors.lightBlue
                                  : Theme.of(context).buttonColor,
                            ),
                            onPressed: () async {
                              if (_fixedPosition)
                                setState(() {
                                  _fixedPosition = false;
                                });
                              else if (_position != null) {
                                _mapController.goToCoordinates(
                                    _position.latitude,
                                    _position.longitude,
                                    18);
                                setState(() {
                                  _fixedPosition = true;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    )
                  ]);
                })
            : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Route finished',style: Theme.of(context).textTheme.headline2,),
                  Text(tiempoDurante()),
                  PrimaryButton(
                    text: 'OK',
                    onPressed: ()=>Navigator.pop(context),
                  ),
                ],
              ),
            ),
      ),
    );
  }

  void _checkStretch(Position position) {
    Place nearestPlace = r.nearestPlace(position, _places);

    if (Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          nearestPlace.latitude,
          nearestPlace.longitude,
        ) <
        20.0) {
      _places.remove(nearestPlace);
      _mapController.clearMarker(nearestPlace.id);
      _places.clear();
      if (_places.isEmpty) {
        _finishedRoute =
            FinishedRoute(route, DateTime.now(), stopwatch.elapsed);
        _finished = true;
      }
    }
  }

  Future _drawNextPlace(Position position) async {
    routeCoords = [];
    String transport = route.paths[_selectedPath].transport;
    LatLng destination = nearestPlace(position, _places).coordinates;

    routeCoords.addAll(await polylineEngine.getPoints(
        LatLng(_position.latitude, _position.longitude),
        LatLng(destination.latitude, destination.longitude),
        transport));

    _polyline = Polyline(
        polylineId: PolylineId('Route'),
        points: routeCoords,
        color: Colors.blue,
        width: 4);
    _mapController.drawPolyline(_polyline);
  }

  Future<void> _showEndDialog() async {
    showDialog<void>(
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
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void nextTransport() {
    if (_selectedPath == route.paths.length - 1)
      _selectedPath = 0;
    else
      _selectedPath++;
    setState(() {});
  }

  Future<void> _showCancelAlert() async {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
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
      },
    );
  }

  String tiempoRestante() {
    int tiempoRestante = 0;
    for (var st in route.paths[_selectedPath].stretchs.toList()) {
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
}
