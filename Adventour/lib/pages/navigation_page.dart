import 'package:Adventour/controllers/map_controller.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() {
  //SdkContext.init(IsolateOrigin.main);
  runApp(NavigationPage());
}

class NavigationPage extends StatefulWidget {
  NavigationPage({Key key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  r.Route route;
  MapController mapController = MapController();

  Location location;
  LocationData currentLocation;
  double bearing;

  @override
  void initState() {
    super.initState();

    location = Location();

    location.onLocationChanged.listen((LocationData cLoc) {
      currentLocation = cLoc;
      bearing = currentLocation.heading;
    });

    setInitialLocation();
  }

  @override
  Widget build(BuildContext context) {
    //Map arguments = ModalRoute.of(context).settings.arguments;
    //oute = arguments['route'];

    CameraPosition initialCameraPosition = CameraPosition(
      zoom: 22,
      tilt: 45,
      target: LatLng(39.432346, -0.425294),
    );
    if (currentLocation != null) {
      initialCameraPosition = CameraPosition(
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 22,
        tilt: 45,
        bearing: bearing,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: GoogleMap(
            initialCameraPosition: initialCameraPosition,
            myLocationEnabled: true,
          ),
        ),
      ),
    );
  }

  void setInitialLocation() async {
    currentLocation = await location.getLocation();
  }
}
