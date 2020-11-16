import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/widgets/route_widget.dart';
import 'package:Adventour/widgets/scroll_column_expandable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RoutesPage extends StatelessWidget {
  const RoutesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My routes'),
      ),
      body: StreamBuilder(
        stream: db.getRoutes(db.currentUserId),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (!snapshot.hasData) return CircularProgressIndicator();
          var routes = snapshot.data;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: routes.length,
              separatorBuilder: (context, index) => SizedBox(height: 5),
              itemBuilder: (context, index) {
                r.Route route = routes[index];
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  actions: <Widget>[
                    IconSlideAction(
                      caption: 'Request',
                      color: Colors.transparent,
                      icon: Icons.file_upload,
                      foregroundColor: Theme.of(context).primaryColor,
                      onTap: () => db.requestRoute(db.currentUserId,route.id),
                    ),
                  ],
                  child: RouteWidget(route),
                );
              },
            ),
          );
        },
        // builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //   if (!snapshot.hasData) {
        //     return Center(child: Text("There are no routes"));
        //   }
        //   return ListView(children: getRoutes(snapshot));
        // },
      ),
    );
  }
}
