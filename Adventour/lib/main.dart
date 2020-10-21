import 'package:Adventour/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:geolocator/geolocator.dart';

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
  Icon icon = Icon(
    Icons.person_pin_circle,
    size: 50,
  );
  WidgetPin widgetPinned;

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

      widgetPinned = hereMapController.pinWidget(
        icon,
        GeoCoordinates(
          39.432073,
          -0.425456,
        ),
      );

      getPositionStream(desiredAccuracy: LocationAccuracy.high).listen((event) {
        if (event == null) {
          print("Todo mal");
        } else {
          widgetPinned.setCoordinates(GeoCoordinates(
            event.latitude,
            event.longitude,
          ));

          const double distanceToEarthInMeters = 50;
          hereMapController.camera.lookAtPointWithDistance(
            GeoCoordinates(
              event.latitude,
              event.longitude,
            ),
            distanceToEarthInMeters,
          );
        }
      });
    });
  }
}
