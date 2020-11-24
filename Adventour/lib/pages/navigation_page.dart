import 'dart:async';

import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/controllers/map_controller.dart';
import 'package:Adventour/controllers/polyline_engine.dart';
import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/FinishedRoute.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/models/Route.dart';
import 'package:Adventour/models/User.dart';
import 'package:Adventour/pages/search_page.dart';
import 'package:Adventour/widgets/circle_icon.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toast/toast.dart';

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
  FinishedRoute _finishedRoute;
  Place _nearestPlace;
  double totalDistance;
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
        appBar: _finishedRoute == null
            ? AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                title: Text(route.name),
                actions: [
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  )
                ],
              )
            : null,
        bottomNavigationBar: _finishedRoute == null
            ? Container(
                height: 90,
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
                  child: Column(
                    children: [
                      if (_nearestPlace != null) Text(_nearestPlace.name),
                      if (_nearestPlace != null) SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            _nearestPlace != null
                                ? typeToIcon(_nearestPlace.type)
                                : Icons.info,
                            color: Theme.of(context).primaryColor,
                            size: 40,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : null,
        body: _finishedRoute == null
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
                          var polylineCoordinates = _mapController.polylines;
                          print("queqeu ${polylineCoordinates}");

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
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        '${tiempoDurante()}',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]);
                })
            : FinishedRouteWidget(finishedRoute: _finishedRoute),
      ),
    );
  }

  void _checkStretch(Position position) {
    _nearestPlace = r.nearestPlace(position, _places);

    if (Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          _nearestPlace.latitude,
          _nearestPlace.longitude,
        ) <
        20.0) {
      _places.remove(_nearestPlace);
      _mapController.clearMarker(_nearestPlace.id);
      if (_places.isEmpty) {
        print('?' + route.name);
        _finishedRoute =
            FinishedRoute(route, DateTime.now(), stopwatch.elapsed);
        stopwatch.stop();
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
    String min, hours;
    if (time.inMinutes.remainder(60) < 10)
      min = '0' + time.inMinutes.remainder(60).toString();
    else
      min = time.inMinutes.remainder(60).toString();
    hours = time.inHours.toString();
    return '$hours:$min';
  }
}

class FinishedRouteWidget extends StatefulWidget {
  FinishedRouteWidget({
    @required this.finishedRoute,
  });

  FinishedRoute finishedRoute;

  @override
  _FinishedRouteWidgetState createState() => _FinishedRouteWidgetState();
}

class _FinishedRouteWidgetState extends State<FinishedRouteWidget> {
  bool delete = false;
  List<String> _types;

  @override
  void initState() {
    db.completeRoute(db.currentUserId);

    _types = widget.finishedRoute.types();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 120,
            backgroundImage: NetworkImage(
              searchEngine.searchPhoto(widget.finishedRoute.image),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 30,
            child: ListView.separated(
              itemCount: _types.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(width: 2),
              itemBuilder: (context, index) {
                String type = _types[index];
                return SizedBox(
                    width: 28,
                    child: CircleIcon(
                      type: type,
                      size: 16,
                      padding: EdgeInsets.all(4),
                    ));
              },
            ),
          ),
          Text(
            widget.finishedRoute.name + ' finished',
            style: Theme.of(context).textTheme.headline2,
          ),
          Text('in ' + widget.finishedRoute.durationText,
              style:
                  Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
                  value: delete,
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (value) {
                    delete = value;
                    setState(() {});
                  }),
              GestureDetector(
                child: Icon(Icons.delete),
                onLongPress: () =>
                    Toast.show('Delete route from your routes', context),
              )
            ],
          ),
          PrimaryButton(
              text: 'OK',
              onPressed: () {
                if (delete)
                  db.deleteRoute(
                      db.currentUserId, widget.finishedRoute.routeId);
                db.addFinishedRoute(db.currentUserId, widget.finishedRoute);
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
