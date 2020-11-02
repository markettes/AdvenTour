import 'dart:async';

import 'package:Adventour/controllers/route_engine.dart';
import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Adventour/pages/search_page.dart';
import 'package:google_maps_webservice/src/core.dart';
import 'package:google_maps_webservice/src/places.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController _mapController;
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Position _position;
  bool _fixedPosition = false;

  @override
  void initState() {
    print('*******************************************');
    routeEngine.makeShortRoute(Location(40.781728, -73.966262), [
      CITY_HALL,
      CHURCH,
      TOURIST_ATTRACTION,
      PARK,
      BAR,
      CAFE,
      COURTHOUSE,
      LIBRARY,
      MOSQUE,
      MOVIE_THEATER,
      STADIUM,
      SYNAGOGUE,
      UNIVERSITY,
      ART_GALLERY,
      HINDU_TEMPLE,
      MUSEUM,
      NIGHT_CLUB,
      RESTAURANT,
      SHOPPING_MALL
    ], [
      'walk'
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: Drawer(),
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
                _mapController.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                    bearing: 0,
                    target: LatLng(_position.latitude, _position.longitude),
                    zoom: 18.0,
                  ),
                ));
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
                if (!snapshot.hasData) return CircularProgressIndicator();
                Position position = snapshot.data;
                return Listener(
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    zoomControlsEnabled: false,
                    markers: Set<Marker>.of(_markers.values),
                    onTap: _touchedPlace,
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
                  // FUTURO DRAWER
                  // MaterialButton(
                  //   child: Icon(
                  //     Icons.menu,
                  //     color: Theme.of(context).buttonColor,
                  //   ),
                  //   color: Theme.of(context).primaryColor,
                  //   height: 53,
                  //   elevation: 15,
                  //   shape: CircleBorder(),
                  //   onPressed: () {
                  //     _scaffoldKey.currentState.openDrawer();
                  //   },
                  // ),

                  MaterialButton(
                    child: Icon(
                      Icons.search,
                      color: Theme.of(context).buttonColor,
                    ),
                    color: Theme.of(context).primaryColor,
                    height: 53,
                    shape: CircleBorder(),
                    elevation: 15,
                    onPressed: () async {
                      setState(() {
                        _fixedPosition = false;
                      });
                      await PlacesAutocomplete.show(
                        context: context,
                        onTapPrediction: _onTapPrediction,
                        onSubmitted: _onSubmitted,
                      );
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MaterialButton(
                    child: _markers.isEmpty
                        ? Container()
                        : Icon(
                            Icons.delete,
                            color: Theme.of(context).buttonColor,
                          ),
                    color: Theme.of(context).primaryColor,
                    height: 40,
                    shape: CircleBorder(),
                    elevation: 15,
                    onPressed: _markers.isEmpty ? null : () => _clearMarkers(),
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
              if (!snapshot.hasData) return CircularProgressIndicator();
              _position = snapshot.data;
              if (_fixedPosition) {
                _mapController.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(_position.latitude, _position.longitude),
                    zoom: 18.0,
                  ),
                ));
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _changeMapStyle(_mapController);
  }

  Future _changeMapStyle(GoogleMapController controller) async {
    String style = await rootBundle.loadString("assets/map_style.json");
    controller.setMapStyle(style);
  }

  void _addMarkers(List<Place> places) {
    List<Marker> markers = places
        .map((place) => Marker(
              markerId: MarkerId(place.name),
              position: LatLng(place.latitude, place.longitude),
              infoWindow: InfoWindow(
                title: place.name ?? "Unknown",
                onTap: () =>
                    Navigator.of(context).pushNamed('/placePage', arguments: {
                  place: place,
                  _goToPlace: _goToPlace,
                  _clearMarkers: _clearMarkers,
                  _addMarkers: _addMarkers
                }),
              ),
            ))
        .toList();

    for (var marker in markers) {
      final MarkerId markerId = marker.markerId;

      _markers[markerId] = marker;
    }
    setState(() {});
  }

  void _clearMarkers() {
    setState(() {
      _markers.clear();
    });
  }

  Future<Place> _touchedPlace(LatLng point) async {
    List<Place> places = await searchEngine.searchByLocation(
        Location(point.latitude, point.longitude), 50);

    int menor = 100;
    Place place;
    for (var p in places) {
      int _distanceInMeters = Geolocator.distanceBetween(
              point.latitude, point.longitude, p.latitude, p.longitude)
          .round();
      if (_distanceInMeters < menor) {
        menor = _distanceInMeters;
        place = p;
      }
    }

    if (place != null) {
      place = await searchEngine.searchWithDetails(place.id);
      print(place.toString());

      _clearMarkers();
      _addMarkers([place]);
      Navigator.of(context).pushNamed('/placePage', arguments: {
        place: place,
        _goToPlace: _goToPlace,
        _clearMarkers: _clearMarkers,
        _addMarkers: _addMarkers
      });
    }
  }

  void _goToPlace(Place place) {
    Navigator.pop(context);
    _mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(place.latitude, place.longitude),
        zoom: 18.0,
      ),
    ));
  }

  void _goToPlaces(List<Place> places, LatLng location) {
    Navigator.pop(context);
    _mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: location,
        zoom: 14.5,
      ),
    ));
  }

  Future _onSubmitted(String value) async {
    List<Place> places = await searchEngine.searchByText(
        value, Location(_position.latitude, _position.longitude), 1000);
    _clearMarkers();
    _addMarkers(places);
    if (places.length == 1) {
      Place place = places.first;
      _goToPlace(place);
    }
    if (places.length > 1) {
      _goToPlaces(places, LatLng(_position.latitude, _position.longitude));
    }
  }

  Future _onTapPrediction(Prediction prediction) async {
    _clearMarkers();
    Place place = (await searchEngine.searchByText(prediction.description,
            Location(_position.latitude, _position.longitude), 1000))
        .first;
    _goToPlace(place);
    _addMarkers([place]);
  }
}
