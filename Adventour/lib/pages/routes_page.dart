import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/widgets/route_widget.dart';
import 'package:Adventour/widgets/scroll_column_expandable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:toast/toast.dart';

import '../app_localizations.dart';

class RoutesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('routes') ),
      ),
      body: StreamBuilder(
        stream: db.getRoutes(db.currentUserId),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          List<r.Route> routes = snapshot.data;
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: routes.isNotEmpty
                    ? CustomScrollView(slivers: [
                        SliverToBoxAdapter(child: Text(routes.length.toString() + '/10 routes',textAlign: TextAlign.end,)),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            r.Route route = routes[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: GestureDetector(
                                child: RouteWidget(
                                  route: route,
                                  onTap: () => showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        BottomSheetRoutes(route: route),
                                  ),
                                ),
                              ),
                            );
                          }, childCount: routes.length),
                        )
                      ])
                    : Center(child: Text('Empty routes')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          if(routes.length == 10) Toast.show('Limit of routes is 10', context);
          else Navigator.pushNamed(context, '/customRoutePage');
        } ,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BottomSheetRoutes extends StatelessWidget {
  const BottomSheetRoutes({
    @required this.route,
  });

  final r.Route route;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: route.images.isNotEmpty
                      ? NetworkImage(searchEngine.searchPhoto(route.image))
                      : null,
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      route.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontSize: 22),
                    ),
                    Text(route.locationName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontSize: 15))
                  ],
                ),
              ],
            ),
          ),
          FlatButton.icon(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/navigationPage',
                  arguments: {'route': route});
            },
            icon: Icon(
              Icons.play_arrow,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            label: Text(
              'Start',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          FlatButton.icon(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/routePage',
                  arguments: {'route': route});
            },
            icon: Icon(
              Icons.edit,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            label: Text(
              'Edit',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          FlatButton.icon(
            onPressed: () {
              Navigator.pop(context);
              db.deleteRoute(db.currentUserId, route.id);
            },
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            label: Text(
              'Delete',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          FlatButton.icon(
            onPressed: () {
              Navigator.pop(context);
              route.isPublic = !route.isPublic;
              print(route.isPublic);
              db.updateRoute(route);
            },
            icon: Icon(
              route.isPublic ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            label: Text(
              route.isPublic ? 'Public' : 'Private',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ],
      ),
    );
  }
}
