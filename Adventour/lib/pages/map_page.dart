import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as Location;

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController mapController;
  Timer timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (!snapshot.hasData) return CircularProgressIndicator();
          Position position = snapshot.data;
          LatLng currentPosition =
              LatLng(position.latitude, position.longitude);
          return GoogleMap(
            onMapCreated: _onMapCreated,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: currentPosition,
              zoom: 11.0,
            ),
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: _currentLocation,
        isExtended: false,
        label: Icon(
          Icons.location_on,
          color: Theme.of(context).buttonColor,
        ),
      ),
    );
  }

  void _currentLocation() async {
    final GoogleMapController controller = mapController;
    Location.LocationData currentLocation;
    var location = new Location.Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 18.0,
      ),
    ));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
