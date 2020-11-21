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
        typeToIcon(type),
        size: size,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(10),
      shape: CircleBorder(),
    );
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
      case RESTAURANT:
        return 'Place type: Restaurant';
      case TOURIST_ATTRACTION:
        return 'Place type: Tourist attraction';
      case STADIUM:
        return 'Place type: Stadium';
      case MUSEUM:
        return 'Place type: Museum';
      case NIGHT_CLUB:
        return 'Place type: Night club';
      case SHOPPING_MALL:
        return 'Place type: Shopping mall';
      default:
        throw Exception('Icon not available for $type');
    }
}


}
