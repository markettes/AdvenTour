import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  CircleIconButton({
    @required this.type,
    @required this.onPressed,
    this.activated = true,
    this.icon = true,
    this.size = 25,
  });

  String type;
  Function onPressed;
  bool activated;
  bool icon;
  double size;

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
        size: size,
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
      case PARK:
        return Icons.park;
      case PLACE_OF_WORSHIP:
        return Icons.history_edu;
      case RESTAURANT:
        return Icons.restaurant;
      case TOURIST_ATTRACTION:
        return Icons.camera_alt;
      case COURTHOUSE:
        return Icons.gavel;
      case MOVIE_THEATER:
        return Icons.theater_comedy;
      case STADIUM:
        return Icons.sports;
      case MUSEUM:
        return Icons.museum;
      case NIGHT_CLUB:
        return Icons.nightlife;
      case SHOPPING_MALL:
        return Icons.local_mall;
      default:
        throw Exception('Icon not available for $type');
    }
  }
}
