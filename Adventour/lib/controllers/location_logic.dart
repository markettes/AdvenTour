import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:here_sdk/core.dart';

class LocationLogic {
  StreamSubscription<Position> positionStream(hereMapController, widgetPinned) {
    return getPositionStream(desiredAccuracy: LocationAccuracy.high)
        .listen((event) {
      if (event == null) {
        print("Todo mal");
      } else {
        widgetPinned.setCoordinates(GeoCoordinates(
          event.latitude,
          event.longitude,
        ));

        //Seguimiento de localización
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
  }
}
