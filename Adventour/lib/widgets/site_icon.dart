import 'package:flutter/material.dart';

enum SiteIconType { Food, Museum }

class SiteIcon extends StatelessWidget {
  SiteIcon({
    @required this.type,
    @required this.onPressed,
  });

  SiteIconType type;
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

IconData icon(SiteIconType type) {
  switch (type) {
    case SiteIconType.Food:
      return Icons.restaurant;
    case SiteIconType.Museum:
      return Icons.museum;
    default:
      return Icons.error;
  }
}
