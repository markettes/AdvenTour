import 'package:flutter/material.dart';

class ActualLocation extends StatelessWidget {
  ActualLocation({
    this.color,
  });

  Color color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.my_location,
      size: 25,
      color: color,
    );
  }
}
