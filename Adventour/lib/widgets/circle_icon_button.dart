import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  CircleIconButton({
    @required this.type,
    @required this.onPressed,
    this.activated = true,
    this.icon = true,
  });

  String type;
  Function onPressed;
  bool activated;
  bool icon;

  void setIcon(bool estado) {
    this.icon = estado;
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: activated
          ? Theme.of(context).primaryColor
          : Theme.of(context).disabledColor,
      constraints: BoxConstraints(minWidth: 0),
      child: icon
          ? Icon(
              toIcon(type),
              size: 25,
              color: Colors.white,
            )
          : toImage(type),
      padding: EdgeInsets.all(10),
      shape: CircleBorder(),
    );
  }

  IconData toIcon(String type) {
    switch (type) {
      case 'car':
        return Icons.directions_car;
      case 'walk':
        return Icons.directions_walk;
      case 'bicycle':
        return Icons.directions_bike;
      case 'public':
        return Icons.directions_subway;
      case 'amusement_park':
        return Icons.park;
      case 'museum':
        return Icons.museum;
      case 'library':
        return Icons.local_library;
      case 'restaurants':
        return Icons.restaurant;
      default:
        throw Exception();
    }
  }

  ImageIcon toImage(String type) {
    switch (type) {
      case 'church':
        return ImageIcon(
          AssetImage("assets/church.png"),
          color: Colors.white,
        );
      case 'night_club':
        return ImageIcon(
          AssetImage("assets/night_club.png"),
          color: Colors.white,
        );
      case 'zoo':
        return ImageIcon(
          AssetImage("assets/zoo.png"),
          color: Colors.white,
        );
      default:
        throw Exception("No existe asset para esta categoría");
    }
  }
}
