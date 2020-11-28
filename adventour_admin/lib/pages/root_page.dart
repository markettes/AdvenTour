import 'package:Adventour/controllers/auth.dart';
import 'package:adventour_admin/controllers/db.dart' as adminDB;
import 'package:adventour_admin/main.dart';
import 'package:adventour_admin/pages/log_in_page.dart';
import 'package:adventour_admin/pages/main_page.dart';
import 'package:adventour_admin/pages/route_request_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Adventour/pages/init_page.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/controllers/db.dart' as mainDB;

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (!snapshot.hasData) return CircularProgressIndicator();
          auth = Auth();
          adminDB.db = adminDB.DB();
          mainDB.db = mainDB.DB();
          return StreamBuilder(
            stream: auth.authStatusChanges,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if (!snapshot.hasData) return LogInPage();
              var user = snapshot.data;
              return StreamBuilder(
                  stream: adminDB.db.getRouteRequests(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    var requests = snapshot.data;
                    print(requests);
                    // print(mainDB.db.toString());
                    return StreamBuilder(
                      stream: mainDB.db.getUsers(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        }
                        var users = snapshot.data;
                        print(users);
                        return MainPage(requests: requests, users: users);
                      },
                    );
                  });
            },
          );
        });
  }
}
