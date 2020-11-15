import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/widgets/route_widget.dart';
import 'package:flutter/material.dart';

class RoutesPage extends StatelessWidget {
  const RoutesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My routes'),
      ),
    );
  }
}
