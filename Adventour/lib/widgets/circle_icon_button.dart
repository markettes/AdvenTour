import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

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

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      onLongPress: (){
        Toast.show(_placeTypeToString(), context, duration: 3, gravity:  Toast.BOTTOM);
      },
      elevation: 2.0,
      fillColor: activated
          ? Theme.of(context).primaryColor
          : Theme.of(context).disabledColor,
      constraints: BoxConstraints(minWidth: 0),
      child: Icon(
        _toIcon(),
        size: size,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(10),
      shape: CircleBorder(),
    );
  }

  IconData _toIcon() {
    switch (type) {
      case CAR:
        return Icons.directions_car;
      case WALK:
        return Icons.directions_walk;
      case BICYCLE:
        return Icons.directions_bike;
      case PARK:
        return Icons.fence;
      case PLACE_OF_WORSHIP:
        return Icons.history_edu;
      case RESTAURANT:
        return Icons.restaurant;
      case TOURIST_ATTRACTION:
        return Icons.camera_alt;
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
      case NATURAL:
        return Icons.eco;
      default:
        throw Exception('Icon not available for $type');
    }
  }

  String _placeTypeToString() {
  switch (type) {
      case CAR:
        return 'Transport: Car';
      case WALK:
        return 'Transport: Walk';
      case BICYCLE:
        return 'Transport: Bycicle';
      case PARK:
        return 'Place type: Park';
      case PLACE_OF_WORSHIP:
        return 'Place type: Place of worship';
      case RESTAURANT:
        return 'Place type: Restaurant';
      case TOURIST_ATTRACTION:
        return 'Place type: Tourist attraction';
      case MOVIE_THEATER:
        return 'Place type: Movie theatre';
      case STADIUM:
        return 'Place type: Stadium';
      case MUSEUM:
        return 'Place type: Museum';
      case NIGHT_CLUB:
        return 'Place type: Night club';
      case SHOPPING_MALL:
        return 'Place type: Shopping mall';
      case NATURAL:
        return 'Place type: Natural place';
      default:
        throw Exception('Icon not available for $type');
    }
}


}
