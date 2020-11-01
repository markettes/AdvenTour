import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Adventour/controllers/search_engine.dart';

class RoutePage extends StatelessWidget {
  GoogleMapController _mapController;
  Position _position;
  @override
  Widget build(BuildContext context) {
    String placeId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom route'),
      ),
      body: FutureBuilder(
        future: Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (!snapshot.hasData) return CircularProgressIndicator();
          _position = snapshot.data;
          directionsEngine.makeJournay(Place(placeId), Place(placeId), 'car');
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(_position.latitude, _position.longitude),
              zoom: 11,
            ),
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          );
        },
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

}
