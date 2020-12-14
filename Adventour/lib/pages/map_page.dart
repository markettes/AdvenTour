import 'dart:async';

import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/controllers/map_controller.dart';
import 'package:Adventour/controllers/route_engine.dart';
import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/User.dart';
import 'package:Adventour/widgets/category_checkbox.dart';
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

import '../app_localizations.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapController _mapController = MapController();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Position _position;
  bool _fixedPosition = false;

  TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: SafeArea(
        child: MyDrawer(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'route',
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () => Navigator.pushNamed(context, '/customRoutePage'),
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
              if (_fixedPosition)
                setState(() {
                  _fixedPosition = false;
                });
              else if (_position != null) {
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
                  ? Colors.lightBlue
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
                      decoration: !_mapController.isNight
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
                                hintText: AppLocalizations.of(context)
                                    .translate('search'),
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

    Place place = (await searchEngine.searchByText(prediction.description,
            Location(_position.latitude, _position.longitude), 1000))
        .first;

    _mapController.addMarker(place, context);
    setState(() {
      _locationController.text = prediction.description;
    });
    Navigator.pop(context);
    _mapController.goToCoordinates(place.latitude, place.longitude, 15);
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/drawer_background.jpg'),
              fit: BoxFit.cover,
            )),
            child: StreamBuilder(
                stream: db.getUser(db.currentUserId),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  User user = snapshot.data;
                  print('?' + user.image);
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          backgroundImage: user.image != ''
                              ? NetworkImage(
                                  user.image,
                                )
                              : AssetImage("assets/empty_photo.jpg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            user.userName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profilePage');
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
                              AppLocalizations.of(context).translate('profile'),
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
                          Navigator.pushNamed(context, '/routesPage');
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
                              AppLocalizations.of(context).translate('routes'),
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
                          Navigator.pushNamed(context, '/achievementsPage');
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.emoji_events,
                              size: 35,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .translate('achievements'),
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
                          Navigator.pushNamed(context, '/historyPage');
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.update,
                              size: 35,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppLocalizations.of(context).translate('history'),
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
                          Navigator.pushNamed(context, '/settingsPage');
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.help,
                              size: 35,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppLocalizations.of(context).translate('help'),
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: MaterialButton(
                //         onPressed: () {
                //           //Navigator
                //         },
                //         child: Row(
                //           children: [
                //             Icon(
                //               Icons.star,
                //               size: 35,
                //               color: Theme.of(context).primaryColor,
                //             ),
                //             SizedBox(
                //               width: 10,
                //             ),
                //             Text(
                //               'Favourites',
                //               style: Theme.of(context).textTheme.bodyText1,
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Expanded(
                  child: Row(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
