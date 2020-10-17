import 'package:flutter/material.dart';

enum CircleIconButtonType { Food, Museum }

class CircleIconButton extends StatelessWidget {
  CircleIconButton({
    @required this.type,
    @required this.onPressed,
  });

  CircleIconButtonType type;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: Theme.of(context).primaryColor,
      constraints: BoxConstraints(minWidth: 0),
      child: Icon(
        icon(type),
        size: 25,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(10),
      shape: CircleBorder(),
    );
  }
}

IconData icon(CircleIconButtonType type) {
  switch (type) {
    case CircleIconButtonType.Food:
      return Icons.restaurant;
    case CircleIconButtonType.Museum:
      return Icons.museum;
    default:
      return Icons.error;
  }
}
