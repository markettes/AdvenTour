import 'package:Adventour/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  SdkContext.init(IsolateOrigin.main);
  runApp(CurrentLocation());
}

class CurrentLocation extends StatelessWidget {
  void _getCurrentLocation() async {
    final position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba',
      home: Scaffold(
        appBar: AppBar(title: Text("Location Services")),
        body: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(""),
              FlatButton(
                  onPressed: () {
                    _getCurrentLocation();
                  },
                  color: Colors.green,
                  child: Text(
                    "Find Location",
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HERE SDK for Flutter - Hello Map!',
      home: HereMap(onMapCreated: _onMapCreated),
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay,
        (MapError error) {
      if (error != null) {
        print('Map scene not loaded. MapError: ${error.toString()}');
        return;
      }

      const double distanceToEarthInMeters = 8000;
      hereMapController.camera.lookAtPointWithDistance(
          GeoCoordinates(39.2434, -0.42), distanceToEarthInMeters);
    });
  }
}
