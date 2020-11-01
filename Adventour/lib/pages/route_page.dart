import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/models/Journay.dart';
import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google;
import 'package:Adventour/controllers/search_engine.dart';

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  google.GoogleMapController _mapController;

  Position _position;

  Map<google.PolylineId, google.Polyline> polylines = {};

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
          _drawJournay();
          return google.GoogleMap(
            initialCameraPosition: google.CameraPosition(
              target: google.LatLng(_position.latitude, _position.longitude),
              zoom: 11,
            ),
            polylines: Set<google.Polyline>.of(polylines.values),
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          );
        },
      ),
    );
  }

  Future _drawJournay() async {
    Journay journay = await directionsEngine.makeJournay('Meliana', 'Burjassot', 'walk');
    print(journay.routes.isEmpty);
    _addJournays([journay]);
  }

  void _onMapCreated(google.GoogleMapController controller) {
    _mapController = controller;
    _changeMapStyle(_mapController);
  }

    Future _changeMapStyle(google.GoogleMapController controller) async {
    String style = await rootBundle.loadString("assets/map_style.json");
    controller.setMapStyle(style);
  }

  _addJournays(List<Journay> journays){
    setState(() {
      polylines[google.PolylineId('1')] = journays.first.routes.first.overviewPolyline as google.Polyline;
    });
  }
}
