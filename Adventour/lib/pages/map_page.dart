import 'package:Adventour/controllers/search_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const googleApiKey = "AIzaSyCqBFCpPtKqMKybjTnmbLwnEgX1PxXjwyU";

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController _mapController;
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  SearchEngine _seachEngine = SearchEngine();

  @override
  Widget build(BuildContext context) {
    _add();
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
              markers: Set<Marker>.of(_markers.values),
              initialCameraPosition: CameraPosition(
                target: currentPosition,
                zoom: 11.0,
              ),
              onTap: (position) {
                print(position);
              },
              myLocationEnabled: true,
            );
          }),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _changeMapStyle(_mapController);
    _seachEngine.search();
  }

  Future _changeMapStyle(GoogleMapController controller) async {
    String style = await rootBundle.loadString("assets/map_style.json");
    controller.setMapStyle(style);
  }

  void _add() {
    // var markerIdVal = MyWayToGenerateId();
    final MarkerId markerId = MarkerId('1');

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        39.531600, -0.349953
      ),
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
