import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/models/Path.dart' as p;
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
    _makeRoute();
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

  Future _makeRoute() async {
    r.Route route =
        await directionsEngine.makeRoute(Place(39.531493, -0.350044), Place(39.508177, -0.407344), 'car');
    _drawRoute(route);
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _changeMapStyle(_mapController);
  }

  Future _changeMapStyle(GoogleMapController controller) async {
    String style = await rootBundle.loadString("assets/map_style.json");
    controller.setMapStyle(style);
  }

  _drawRoute(r.Route route) {
    List<LatLng> points = [];
    for (p.Path path in route.paths) {
      points.addAll(path.points);
    }
    Polyline polyline = Polyline(
        polylineId: PolylineId('route'),
        points: points,
        color: Colors.blue,
        width: 2);
    setState(() {
      _polylines[polyline.polylineId] = polyline;
    });
  }
}
