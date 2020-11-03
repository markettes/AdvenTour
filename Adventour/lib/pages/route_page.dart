import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/controllers/geocoding.dart';
import 'package:Adventour/controllers/map_controller.dart';
import 'package:Adventour/controllers/route_engine.dart';
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
  MapController _mapController = MapController();

  directions.Location _location;
  String placeId;
  List<String> placeTypes;
  List<String> transports;

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
            future: _makeRoute(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if (!snapshot.hasData) return CircularProgressIndicator();
              p.Route route = snapshot.data;
              _mapController.drawRoute(route.trajectories.first.points);
              for (var place in route.places) {
                _mapController.addMarker(place, context);
              }
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(_location.lat, _location.lng),
                  zoom: 12.5,
                ),
                markers: Set<Marker>.of(_mapController.markers.values),
                polylines: Set<Polyline>.of(_mapController.polylines.values),
                onMapCreated: _mapController.onMapCreated,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
              );
            }));
  }

  Future<p.Route> _makeRoute() async {
    if (placeId == null) {
      Position position = await Geolocator.getCurrentPosition();
      _location = directions.Location(position.latitude, position.longitude);
    } else {
      _location = await geocoding.searchByPlaceId(placeId);
    }

    p.Route route =
        await routeEngine.makeShortRoute(_location, placeTypes, transports);

    return route;
  }


}
