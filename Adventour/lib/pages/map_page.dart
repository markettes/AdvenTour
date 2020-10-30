import 'dart:async';

import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Adventour/models/Place.dart';

const kGoogleApiKey = "AIzaSyAzLMUtt6ZleHHXpB2LUaEkTjGuT8PeYho";

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController _mapController;
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  Timer _timer;
  bool _centerPositionOn = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Position _position;
  bool _fixedPosition = false;
  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
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

            // try {
            //   _currentLocationR();
            // } on PlatformException catch (err) {
            //   return err;
            // }
          }
        },
        child: Icon(
          Icons.gps_fixed,
          color: _fixedPosition ? Colors.blue[200] : Theme.of(context).buttonColor,
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
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
                    initialCameraPosition: CameraPosition(
                      target: LatLng(position.latitude, position.longitude),
                      zoom: 11.0,
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                  ),
                  onPointerMove: (event) {
                    if(_fixedPosition)
                      setState(() {
                        _fixedPosition = false;
                      });
                  },
                );
              }),
          StreamBuilder(
              stream: Geolocator.getPositionStream(
                  desiredAccuracy: LocationAccuracy.medium),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (!snapshot.hasData) return CircularProgressIndicator();
                _position = snapshot.data;
                if (_fixedPosition){
                  _mapController.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(_position.latitude, _position.longitude),
                      zoom: 18.0,
                    ),
                  ));
                }
                  
                return SearchBar(
                  size: size,
                  scaffoldKey: _scaffoldKey,
                  mapController: _mapController,
                  addMarker: _addMarker,
                  position: _position,
                );
              })
        ],
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
    //_searchRestaurants(controller);
  }

  Future _changeMapStyle(GoogleMapController controller) async {
    String style = await rootBundle.loadString("assets/map_style.json");
    controller.setMapStyle(style);
  }

  void _addMarker(Marker marker) {
    // var markerIdVal = MyWayToGenerateId();
    final MarkerId markerId = marker.markerId;

    setState(() {
      // adding a new marker to map
      _markers[markerId] = marker;
    });
  }
}
