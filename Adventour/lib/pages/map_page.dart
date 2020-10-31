import 'dart:async';

import 'package:Adventour/widgets/square_icon_button.dart';
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
          }
        },
        child: Icon(
          Icons.gps_fixed,
          color:
              _fixedPosition ? Colors.blue[200] : Theme.of(context).buttonColor,
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
                    if (_fixedPosition)
                      setState(() {
                        _fixedPosition = false;
                      });
                  },
                );
              }),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    child: Icon(
                      Icons.menu,
                      color: Theme.of(context).buttonColor,
                    ),
                    color: Theme.of(context).primaryColor,
                    height: 53,
                    elevation: 15,
                    shape: CircleBorder(),
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                  ),
                  MaterialButton(
                    child: Text(
                      'Clean markers',
                    ),
                    textColor: Theme.of(context).buttonColor,
                    color: Theme.of(context).primaryColor,
                    disabledTextColor: Theme.of(context).disabledColor,
                    height: 40,
                    elevation: 15,
                    onPressed: _markers.isEmpty || _markers.length == 1
                        ? null
                        : () => _clearMarkers(),
                  ),
                  MaterialButton(
                    child: Icon(
                      Icons.search,
                      color: Theme.of(context).buttonColor,
                    ),
                    color: Theme.of(context).primaryColor,
                    height: 53,
                    shape: CircleBorder(),
                    onPressed: () async {
                      setState(() {
                        _fixedPosition = false;
                      });
                      Prediction prediction = await PlacesAutocomplete.show(
                          context: context,
                          apiKey: "AIzaSyAzLMUtt6ZleHHXpB2LUaEkTjGuT8PeYho",
                          location:
                              Location(_position.latitude, _position.longitude),
                          mapController: _mapController,
                          addMarker: _addMarker);
                    },
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

  void _addMarker(Marker marker) {
    // var markerIdVal = MyWayToGenerateId();
    final MarkerId markerId = marker.markerId;

    setState(() {
      _markers[markerId] = marker;
    });
    print(_markers.length);
  }

  void _clearMarkers() {
    setState(() {
      _markers.clear();
    });
  }
}
