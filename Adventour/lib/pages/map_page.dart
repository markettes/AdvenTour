import 'dart:async';

import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Adventour/models/Place.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController _mapController;
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  SearchEngine _seachEngine = SearchEngine();
  Timer _timer;
  bool _centerPositionOn = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      body: Listener(
        onPointerDown: (e) {
          if (_centerPositionOn) {
            _timer.cancel();
            _centerPositionOn = false;
          }
        },
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            FutureBuilder(
                future: Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  Position position = snapshot.data;
                  LatLng currentPosition =
                      LatLng(position.latitude, position.longitude);
                  return GoogleMap(
                    onMapCreated: _onMapCreated,
                    zoomControlsEnabled: false,
                    markers: Set<Marker>.of(_markers.values),
                    initialCameraPosition: CameraPosition(
                      target: currentPosition,
                      zoom: 11.0,
                    ),
                    onTap: (position) {
                      print(position);
                    },
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                  );
                }),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 6,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  width: size.width * 0.9,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: ()=>_scaffoldKey.currentState.openDrawer(),
                      )
                    ),
                    onSubmitted: null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () async {
          if (await Geolocator.isLocationServiceEnabled()) {
            try {
              _currentLocationR();
            } on PlatformException catch (err) {
              return err;
            }
          }
        },
        isExtended: false,
        child: Icon(
          Icons.gps_fixed,
          color: Theme.of(context).buttonColor,
        ),
      ),
    );
  }

  void _centerScreen() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } on Exception {
      position = null;
    }

    _mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(position.latitude, position.longitude),
        zoom: 18.0,
      ),
    ));
  }

  void _currentLocationR() {
    if (!_centerPositionOn) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        _centerScreen();
        _centerPositionOn = true;
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _changeMapStyle(_mapController);
    _searchRestaurants(controller);
  }

  Future _changeMapStyle(GoogleMapController controller) async {
    String style = await rootBundle.loadString("assets/map_style.json");
    controller.setMapStyle(style);
  }

  Future _searchRestaurants(GoogleMapController controller) async {
    List<Place> places =
        await _seachEngine.searchByLocation(PARK, 39.5305989, -0.3489142, 2000);
    for (var place in places) {
      print(place.toString());
    }
  }

  void _add() {
    // var markerIdVal = MyWayToGenerateId();
    final MarkerId markerId = MarkerId('1');

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(39.531600, -0.349953),
      infoWindow: InfoWindow(title: markerId.toString(), snippet: '*'),
      onTap: () {
        // _onMarkerTapped(markerId);
      },
    );

    setState(() {
      // adding a new marker to map
      _markers[markerId] = marker;
    });
  }
}
