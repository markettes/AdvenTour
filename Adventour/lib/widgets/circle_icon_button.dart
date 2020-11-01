import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  CircleIconButton({
    @required this.type,
    @required this.onPressed,
    this.activated = true
  });

  String type;
  Function onPressed;
  bool activated;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: activated?Theme.of(context).primaryColor:Theme.of(context).disabledColor,
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
      case 'car':
        return Icons.directions_car;
      case 'walk':
        return Icons.directions_walk;
      case 'bicycle':
        return Icons.directions_bike;
      case 'public':
        return Icons.directions_subway;
      default:
        throw Exception();
    }
  }
}
