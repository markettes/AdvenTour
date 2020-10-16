import 'package:Adventour/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';


void main() {
  SdkContext.init(IsolateOrigin.main);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  HereMapController mapController;
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HERE SDK for Flutter - Hello Map!',
      home: Scaffold(
      body: HereMap(onMapCreated: _onMapCreated),
      floatingActionButton: FloatingActionButton(
        onPressed: () 
        {
         mapController.camera.lookAtPointWithDistance(GeoCoordinates(39.2434, -0.42), 8000);
        },
        child: Icon(
          Icons.my_location,
          size: 35,
          color: Colors.black,
          ),
        backgroundColor: Colors.deepPurple,
      ),
    ),
    );
  }

  //Comentario de prueba
  

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay,
        (MapError error) {
      if (error != null) {
        print('Map scene not loaded. MapError: ${error.toString()}');
        return;
      }
      mapController = hereMapController;
      const double distanceToEarthInMeters = 8000;
      hereMapController.camera.lookAtPointWithDistance(
          GeoCoordinates(39.2434, -0.42), distanceToEarthInMeters);
    });
  }
} 