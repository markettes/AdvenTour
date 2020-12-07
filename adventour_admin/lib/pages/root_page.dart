import 'package:Adventour/controllers/auth.dart';
import 'package:adventour_admin/pages/main_page.dart';
import 'package:adventour_admin/pages/log_in_page.dart';
import 'package:adventour_admin/pages/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
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

          return MainPage();
        });
  }
}
