import 'package:Adventour/controllers/auth.dart';
import 'package:adventour_admin/widgets/route_widget.dart';
import 'package:adventour_admin/controllers/db.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/models/Route.dart' as r;


class HighlightsPage extends StatefulWidget {
  @override
  _HighlightsPageState createState() => _HighlightsPageState();
}

class _HighlightsPageState extends State<HighlightsPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Highlights'),
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
          child:  StreamBuilder(
                stream: db.getHighlights(),
                builder: (context, snapshot) {
                  if(snapshot.hasError) print(snapshot.error);
                  if(!snapshot.hasData) return CircularProgressIndicator();
                  List<r.Route> highlights = snapshot.data;
                  if(highlights.isEmpty)
                  return Center(
                      child: Text(
                        'There are not highlights',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    );
                  return ListView.separated(
                      itemCount: highlights.length,
                      separatorBuilder: (context, index) => SizedBox(height: 5),
                      itemBuilder: (context, index) {
                        r.Route route = highlights[index];
                        return RouteWidget(route:route);
                      },
                    );
                }
              )
            
        ),
      ),
    );
  }
}
