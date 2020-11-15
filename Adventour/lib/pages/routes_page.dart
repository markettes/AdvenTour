import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/widgets/route_widget.dart';
import 'package:Adventour/widgets/scroll_column_expandable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RoutesPage extends StatelessWidget {
  const RoutesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My routes'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users/${db.currentUserId}/Routes')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            print('hola1');
            return new Center(child: Text("There are no routes"));
          }
          print('hola2');
          return new ListView(children: getRoutes(snapshot));
        },
      ),
    );
  }

  getRoutes(AsyncSnapshot<QuerySnapshot> snapshot) {
    print('hola3');
    return snapshot.data.docs
        .map((doc) => new RouteWidget(r.Route.fromJson(doc.data())))
        .toList();
  }
}
