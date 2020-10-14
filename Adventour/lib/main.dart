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
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HERE SDK for Flutter - Hello Map!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple[500],
        accentColor: Colors.deepPurple[100],
        backgroundColor: Colors.deepPurple[50],
        textTheme: TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 30,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 30,
            color: Colors.deepPurple[500],
          ),
          bodyText1: TextStyle(
            fontWeight: FontWeight.w400,
          ),
          bodyText2: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
        ),
      ),
      home: MainPage(),
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
