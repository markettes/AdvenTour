import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/models/Journay.dart';
import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Adventour/controllers/search_engine.dart';

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  GoogleMapController _mapController;

  Position _position;

  Map<PolylineId, Polyline> _polylines = {};

  @override
  void initState() {
    _drawJournay();
    super.initState();
  }

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
          
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(_position.latitude, _position.longitude),
              zoom: 11,
            ),
            polylines: Set<Polyline>.of(_polylines.values),
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
    _addPaths(journay.paths);
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _changeMapStyle(_mapController);
  }

    Future _changeMapStyle(GoogleMapController controller) async {
    String style = await rootBundle.loadString("assets/map_style.json");
    controller.setMapStyle(style);
  }

  _addPaths(List<Path> paths){
    List<Polyline> polylines = paths.map((path) => path.polyline).toList();
    for (Polyline polyline in polylines) {
      _polylines[polyline.polylineId] = polyline;
    }
    setState(() {
      
    });
  }
}
