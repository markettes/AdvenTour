import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
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
              initialCameraPosition: CameraPosition(
                target: currentPosition,
                zoom: 11.0,
              ),
              myLocationEnabled: true,
            );
          }),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
