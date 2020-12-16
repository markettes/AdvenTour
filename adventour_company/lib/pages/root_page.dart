import 'package:adventour_company/controllers/auth.dart';
import 'package:adventour_company/controllers/db.dart';
import 'package:Adventour/widgets/input_text.dart';
import 'package:adventour_company/models/Company.dart';
import 'package:adventour_company/pages/init_page.dart';
import 'package:adventour_company/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';

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
              if (!snapshot.hasData) return InitPage();
              var user = snapshot.data;
              companySignIn(user.email, context);
              return WelcomePage();
            },
          );
        });
  }

  Future companySignIn(String email, BuildContext context) async {
    String id = await db.companySignIn(email);
    db.currentUserId = id;
  }
}
