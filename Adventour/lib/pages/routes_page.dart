import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/widgets/route_widget.dart';
import 'package:Adventour/widgets/scroll_column_expandable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:toast/toast.dart';

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
          List<r.Route> routes = snapshot.data;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: routes.isNotEmpty
                ? ListView.separated(
                    itemCount: routes.length,
                    separatorBuilder: (context, index) => SizedBox(height: 5),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      r.Route route = routes[index];
                      return Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        actions: <Widget>[
                          IconSlideAction(
                            color: Colors.transparent,
                            iconWidget: Icon(
                              Icons.more_vert,
                              size: 30,
                            ),
                            foregroundColor: Theme.of(context).primaryColor,
                            onTap: () => showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                      child: Container(
                                        height: 180,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FlatButton.icon(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.pushNamed(
                                                    context, '/routePage',
                                                    arguments: {
                                                      'route': route
                                                    });
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 30,
                                              ),
                                              label: Text(
                                                'Edit',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2,
                                              ),
                                            ),
                                            FlatButton.icon(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.pushNamed(
                                                    context, '/routePage',
                                                    arguments: {
                                                      'route': route
                                                    });
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 30,
                                              ),
                                              label: Text(
                                                'Delete',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2,
                                              ),
                                            ),
                                            FlatButton.icon(
                                              onPressed: () {
                    
                                                Navigator.pop(context);
                                                if(route.isRequested)
                                                Toast.show('This route has already been requested', context);
                                                else db.requestRoute(
                                                    db.currentUserId, route.id);
                                              },
                                              icon: Icon(
                                                Icons.upload_file,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 30,
                                              ),
                                              label: Text(
                                                'Request',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                          ),
                          // IconSlideAction(
                          //   caption: 'Request',
                          //   color: Colors.transparent,
                          //   icon: Icons.file_upload,
                          //   foregroundColor: Theme.of(context).primaryColor,
                          //   onTap: () =>
                          //       db.requestRoute(db.currentUserId, route.id),
                          // ),
                        ],
                        // secondaryActions: [
                        //   IconSlideAction(
                        //     caption: 'Delete',
                        //     color: Colors.transparent,
                        //     icon: Icons.delete,
                        //     foregroundColor: Theme.of(context).primaryColor,
                        //     onTap: () =>
                        //         db.deleteRoute(route.author, route.id),
                        //   ),
                        // ],
                        child: RouteWidget(
                          route: route,
                          onTap: () => Navigator.pushNamed(
                              context, '/navigationPage',
                              arguments: {'route': route}),
                        ),
                      );
                    },
                  )
                : Center(child: Text('Empty routes')),
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
