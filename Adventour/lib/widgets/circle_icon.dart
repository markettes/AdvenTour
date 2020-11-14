import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  CircleIcon({
    @required this.image,
  });

  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Theme.of(context).primaryColor
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Image.network(image,color: Colors.white,),
      ),
    );
  }

}