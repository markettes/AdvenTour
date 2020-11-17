import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  CircleIcon({this.image, this.type, this.size = 30,this.padding = const EdgeInsets.all(8)});

  String image;
  String type;
  double size;
  EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: null,
      elevation: 2,
      fillColor: Theme.of(context).primaryColor,
      constraints: BoxConstraints(minWidth: 0),
      padding: padding,
      child: Icon(
        typeToIcon(type),
        size: size,
        color: Colors.white,
      ),
      shape: CircleBorder(),
    );
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Theme.of(context).primaryColor),
      child: image != null
          ? Image.network(image, color: Colors.white)
          : Icon(
              typeToIcon(type),
              color: Colors.white,
            ),
    );
  }
}
