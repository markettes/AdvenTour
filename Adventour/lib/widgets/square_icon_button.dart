import 'package:flutter/material.dart';

class SquareIconButton extends StatelessWidget {
  SquareIconButton({
    @required this.icon,
    @required this.onPressed,
  });
  IconData icon;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: Theme.of(context).primaryColor,
      constraints: BoxConstraints(minWidth: 0),
      child: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(6),
      shape: ContinuousRectangleBorder(),
    );
  }
}
