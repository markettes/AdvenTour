import 'dart:async';

import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/controllers/map_controller.dart';
import 'package:Adventour/controllers/route_engine.dart';
import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/widgets/input_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Adventour/pages/search_page.dart';
import 'package:google_maps_webservice/src/core.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:intl/intl.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapController _mapController = MapController();
  String _mapStyle;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Position _position;
  bool _fixedPosition = false;

  TextEditingController _locationController = TextEditingController();

  DateTime now;
  String formattedDate;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isHL = false;

  @override
  void initState() {
    now = DateTime.now();
    formattedDate = DateFormat('kk').format(now);

    if (int.parse(formattedDate) < 20) {
      rootBundle.loadString('assets/map_styles/light.json').then((string) {
        _mapStyle = string;
      });
    } else {
      rootBundle.loadString('assets/map_styles/dark.json').then((string) {
        _mapStyle = string;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //----
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      image: DecorationImage(
                        image: AssetImage('assets/drawer_background.jpg'),
                        fit: BoxFit.cover,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: auth.currentUser.photoUrl != null
                                    ? NetworkImage(
                                        '${auth.currentUser.photoUrl}')
                                    : AssetImage("assets/empty_photo.jpg"),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "${auth.currentUser.email}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              //Navigator
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.flag,
                                  size: 35,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Highlights',
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              //Navigator
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 35,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Favourites',
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              //Navigator
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.settings,
                                  size: 35,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Settings',
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              //Navigator
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 35,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Account',
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              auth.signOut();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  size: 35,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Logout',
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'route',
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () => Navigator.pushNamed(context, '/creatingRoutePage'),
            child: Icon(
              Icons.flag,
              color: Theme.of(context).buttonColor,
            ),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'current_location',
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () async {
              if (_position != null) {
                _mapController.goToCoordinates(
                    _position.latitude, _position.longitude, 18);
                setState(() {
                  _fixedPosition = true;
                });
              }
            },
            child: Icon(
              Icons.gps_fixed,
              color: _fixedPosition
                  ? Colors.blue[200]
                  : Theme.of(context).buttonColor,
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          FutureBuilder(
              future: Geolocator.getLastKnownPosition(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());
                Position position = snapshot.data;
                return Listener(
                  child: GoogleMap(
                    onMapCreated: _mapController.onMapCreated,
                    zoomControlsEnabled: false,
                    markers: Set<Marker>.of(_mapController.markers.values),
                    initialCameraPosition: CameraPosition(
                      target: LatLng(position.latitude, position.longitude),
                      zoom: 11.0,
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                  ),
                  onPointerMove: (event) {
                    if (_fixedPosition)
                      setState(() {
                        _fixedPosition = false;
                      });
                  },
                );
              }),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      decoration: int.parse(formattedDate) < 20
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                              boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 20,
                                  )
                                ])
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                            ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: IconButton(
                              icon: Icon(
                                Icons.menu,
                                size: 30,
                              ),
                              onPressed: () {
                                _scaffoldKey.currentState.openDrawer();
                              },
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search...',
                              ),
                              controller: _locationController,
                              onTap: () async {
                                setState(() {
                                  _fixedPosition = false;
                                });
                                await PlacesAutocomplete.show(
                                  context: context,
                                  onTapPrediction: _onTapPrediction,
                                  onSubmitted: _onSubmitted,
                                );
                              },
                              readOnly: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: _locationController.text.isEmpty
                                ? null
                                : IconButton(
                                    icon: Icon(
                                      Icons.clear,
                                      size: 30,
                                    ),
                                    onPressed: _mapController.markers.isEmpty
                                        ? null
                                        : () {
                                            setState(() {
                                              _locationController.clear();
                                              _mapController.clearMarkers();
                                            });
                                          },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // MaterialButton(
                  //   child: Icon(
                  //     Icons.logout,
                  //     color: Theme.of(context).buttonColor,
                  //   ),
                  //   color: Theme.of(context).primaryColor,
                  //   height: 53,
                  //   shape: CircleBorder(),
                  //   elevation: 15,
                  //   onPressed: () async {
                  //     auth.signOut();
                  //   },
                  // ),
                  // SizedBox(height: 5),
                  // MaterialButton(
                  //   child: Icon(
                  //     Icons.search,
                  //     color: Theme.of(context).buttonColor,
                  //   ),
                  //   color: Theme.of(context).primaryColor,
                  //   height: 53,
                  //   shape: CircleBorder(),
                  //   elevation: 15,
                  //   onPressed: () async {
                  //     setState(() {
                  //       _fixedPosition = false;
                  //     });
                  //     await PlacesAutocomplete.show(
                  //       context: context,
                  //       onTapPrediction: _onTapPrediction,
                  //       onSubmitted: _onSubmitted,
                  //     );
                  //   },
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // MaterialButton(
                  //   child: _mapController.markers.isEmpty
                  //       ? Container()
                  //       : Icon(
                  //           Icons.delete,
                  //           color: Theme.of(context).buttonColor,
                  //         ),
                  //   color: Theme.of(context).primaryColor,
                  //   height: 40,
                  //   shape: CircleBorder(),
                  //   elevation: 15,
                  //   onPressed: _mapController.markers.isEmpty
                  //       ? null
                  //       : () {
                  //           setState(() {
                  //             _mapController.clearMarkers();
                  //           });
                  //         },
                  // ),
                ],
              ),
            ),
          ),
          StreamBuilder(
            stream: Geolocator.getPositionStream(
                desiredAccuracy: LocationAccuracy.medium),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              _position = snapshot.data;
              if (_fixedPosition) {
                _mapController.goToCoordinates(
                    _position.latitude, _position.longitude, 18);
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  Future _onSubmitted(String value) async {
    List<Place> places = await searchEngine.searchByText(
        value, Location(_position.latitude, _position.longitude), 1000);
    _mapController.clearMarkers();
    for (var place in places) {
      _mapController.addMarker(place, context);
    }

    setState(() {
      _locationController.text = value;
    });
    if (places.length == 1) {
      Place place = places.first;
      Navigator.pop(context);
      _mapController.goToCoordinates(place.latitude, place.longitude, 15);
    }
    if (places.length > 1) {
      Navigator.pop(context);
      _mapController.zoomOut(_position.latitude, _position.longitude);
    }
  }

  Future _onTapPrediction(Prediction prediction) async {
    _mapController.clearMarkers();
    var data = await _firestore.collection('Highlights').get();

    Place place = (await searchEngine.searchByText(prediction.description,
            Location(_position.latitude, _position.longitude), 1000))
        .first;

    for (var i = 0; i < data.docs.length; i++) {
      if (data.docs[i].get('id') == prediction.placeId) {
        Navigator.pop(context);
        return Navigator.of(context).pushNamed(
          '/highlightPage',
          arguments: {'place': place, 'photo': data.docs[i].get('photo')},
        );
      }
    }

    _mapController.addMarker(place, context);
    setState(() {
      _locationController.text = prediction.description;
    });
    Navigator.pop(context);
    _mapController.goToCoordinates(place.latitude, place.longitude, 15);
  }
}

// Future<Place> _touchedPlace(LatLng point) async {
//   List<Place> places = await searchEngine.searchByLocation(
//       Location(point.latitude, point.longitude), 50);

//   int menor = 100;
//   Place place;
//   for (var p in places) {
//     int _distanceInMeters = Geolocator.distanceBetween(
//             point.latitude, point.longitude, p.latitude, p.longitude)
//         .round();
//     if (_distanceInMeters < menor) {
//       menor = _distanceInMeters;
//       place = p;
//     }
//   }

//   if (place != null) {
//     place = await searchEngine.searchWithDetails(place.id);
//     print(place.toString());

//     _clearMarkers();
//     _addMarkers([place]);
//     Navigator.of(context).pushNamed('/placePage', arguments: {
//       place: place,
//       _goToPlace: _goToPlace,
//       _clearMarkers: _clearMarkers,
//       _addMarkers: _addMarkers
//     });
//   }
// }
