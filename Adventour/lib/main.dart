import 'package:Adventour/pages/main_page.dart';
import 'package:Adventour/widgets/center_position_button.dart';
import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:Adventour/pages/information_places.dart';
void main() {
  SdkContext.init(IsolateOrigin.main);
  //runApp(MyApp());
  runApp(InformationPlaces());
}

class MyApp extends StatelessWidget {
  @override
  HereMapController _hereMapController;
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HERE SDK for Flutter - Hello Map!',
      home: Scaffold(
        body: HereMap(onMapCreated: _onMapCreated),
        floatingActionButton:
        CenterPositionButton(hereMapController: _hereMapController),
      ),
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay,
        (MapError error) {
      if (error != null) {
        print('Map scene not loaded. MapError: ${error.toString()}');
        return;
      }
      _hereMapController = hereMapController;
      const double distanceToEarthInMeters = 8000;
      hereMapController.camera.lookAtPointWithDistance(
          GeoCoordinates(39.2434, -0.42), distanceToEarthInMeters);
    });
  }
}
