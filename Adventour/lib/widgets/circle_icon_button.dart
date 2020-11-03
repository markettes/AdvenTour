import 'package:Adventour/controllers/directions_engine.dart';
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
      child: Icon(
        toIcon(type),
        size: 25,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(10),
      shape: CircleBorder(),
    );
  }

  IconData toIcon(String type) {
    switch (type) {
      case CAR:
        return Icons.directions_car;
      case WALK:
        return Icons.directions_walk;
      case BICYCLE:
        return Icons.directions_bike;
      case PUBLIC:
        return Icons.directions_subway;
      case PARK:
        return Icons.park;
      case CHURCH:
        return Icons.location_city;
      case RESTAURANT:
        return Icons.restaurant;
      case CITY_HALL:
        return Icons.house_outlined;
      case BAR:
        return Icons.sports_bar;
      case TOURIST_ATTRACTION:
        return Icons.camera_alt;
      default:
        throw Exception('Icon not available');
    }
  }
}
