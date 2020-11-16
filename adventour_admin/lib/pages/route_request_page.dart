import 'package:flutter/material.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/widgets/route_widget.dart';

class RouteRequestPage extends StatelessWidget {
  RouteRequestPage({@required this.requests});
  List<r.Route> requests;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route requests'),
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
                    return RouteWidget(route);
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
