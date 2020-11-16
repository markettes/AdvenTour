import 'package:Adventour/controllers/auth.dart';
import 'package:adventour_admin/controllers/db.dart';
import 'package:adventour_admin/pages/route_request_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Adventour/pages/init_page.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (!snapshot.hasData) return CircularProgressIndicator();
          auth = Auth();
          db = DB();
          return StreamBuilder(
            stream: auth.authStatusChanges,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if (!snapshot.hasData) return InitPage(allowSignUp: false,);
              var user = snapshot.data;
              return StreamBuilder(
                stream: db.getRouteRequests(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  var requests = snapshot.data;
                  return RouteRequestPage(requests: requests);
                });
            },
          );
        });
  }

}
