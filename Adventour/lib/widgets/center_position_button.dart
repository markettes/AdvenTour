import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';

class CenterPositionButton extends StatelessWidget {
  const CenterPositionButton({
    @required this.hereMapController,
  });

  final HereMapController hereMapController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        hereMapController.camera
            .lookAtPointWithDistance(GeoCoordinates(39.2434, -0.42), 8000);
      },
      child: Icon(
        Icons.my_location,
        size: 35,
        color: Colors.black,
      ),
      backgroundColor: Colors.deepPurple,
    );
  }
}
