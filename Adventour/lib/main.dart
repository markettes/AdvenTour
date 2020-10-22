import 'package:Adventour/pages/main_page.dart';
import 'package:Adventour/widgets/actual_location.dart';
import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:geolocator/geolocator.dart';

import 'controllers/location_logic.dart';

void main() {
  SdkContext.init(IsolateOrigin.main);
  runApp(MyApp());
}

class CurrentLocation {
  void _getCurrentLocation() async {
    final position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HERE SDK for Flutter - Hello Map!',
      home: HereMap(
        onMapCreated: _onMapCreated,
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

      WidgetPin widgetPinned = hereMapController.pinWidget(
        ActualLocation(
          color: Colors.lightBlue,
        ),
        GeoCoordinates(
          39.432073,
          -0.425456,
        ),
      );

      LocationLogic().positionStream(
        hereMapController,
        widgetPinned,
      );
    });
  }
}
