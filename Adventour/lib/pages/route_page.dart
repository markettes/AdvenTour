import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/controllers/geocoding.dart';
import 'package:Adventour/controllers/route_engine.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/models/Path.dart' as p;
import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;
import 'package:Adventour/controllers/search_engine.dart';

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  GoogleMapController _mapController;

  Position _position;
  String placeId;
  List<String> placeTypes = [];
  List<String> transports = [];

  Map<PolylineId, Polyline> _polylines = {};

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    placeId = arguments['placeId'];
    placeTypes = arguments['placeTypes'];
    transports = arguments['transports'];
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
          return FutureBuilder(
              future: _makeRoute(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (!snapshot.hasData) return CircularProgressIndicator();
                p.Path path  = snapshot.data;
                _drawRoute(path);
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
              });
        },
      ),
    );
  }

  Future<p.Path> _makeRoute() async {
    directions.Location location = placeId == null
        ? directions.Location(_position.latitude, _position.longitude)
        : await geocoding.searchByPlaceId(placeId);
        
    p.Path route = await routeEngine.makeShortRoute(location, placeTypes, transports);
    
    return route;
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _changeMapStyle(_mapController);
  }

  Future _changeMapStyle(GoogleMapController controller) async {
    String style = await rootBundle.loadString("assets/map_style.json");
    controller.setMapStyle(style);
  }

  _drawRoute(p.Path path) {
    List<LatLng> points = [];
    points.addAll(path.trajectories.first.points);
    Polyline polyline = Polyline(
        polylineId: PolylineId('route'),
        points: points,
        color: Colors.blue,
        width: 2);
    _polylines[polyline.polylineId] = polyline;
  }
}
