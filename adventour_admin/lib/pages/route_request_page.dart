import 'package:Adventour/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/widgets/route_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:adventour_admin/controllers/db.dart';

class RouteRequestPage extends StatefulWidget {
  @override
  _RouteRequestPageState createState() => _RouteRequestPageState();
}

class _RouteRequestPageState extends State<RouteRequestPage> {
  List<r.Route> requests;

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    requests = arguments['requests'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Route requests'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: auth.signOut,
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: requests.isNotEmpty
              ? ListView.separated(
                  itemCount: requests.length,
                  separatorBuilder: (context, index) => SizedBox(height: 5),
                  itemBuilder: (context, index) {
                    r.Route route = requests[index];
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      actions: <Widget>[
                        IconSlideAction(
                          caption: 'Accept',
                          color: Colors.transparent,
                          icon: Icons.done,
                          foregroundColor: Theme.of(context).primaryColor,
                          onTap: () {
                            //Logro highlight
                            db.routesHighlight(route.author);
                            db.addHighlight(route.author, route.id);
                            db.deleteRouteRequest(route.author, route.id);
                          }, // AÑADIR CIUDAD
                        ),
                      ],
                      secondaryActions: [
                        IconSlideAction(
                          caption: 'Decline',
                          color: Colors.transparent,
                          icon: Icons.clear,
                          foregroundColor: Theme.of(context).primaryColor,
                          onTap: () => db.deleteRouteRequest(
                              route.author, route.id), // AÑADIR CIUDAD
                        ),
                      ],
                      child: RouteWidget(
                        route: route,
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    'Empty requests',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
        ),
      ),
    );
  }
}
