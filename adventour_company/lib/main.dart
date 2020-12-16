import 'package:Adventour/main.dart';
import 'package:adventour_company/controllers/db.dart';
import 'package:adventour_company/pages/init_page.dart';
import 'package:adventour_company/pages/log_in_page.dart';
import 'package:adventour_company/pages/root_page.dart';
import 'package:adventour_company/pages/sign_up_page.dart';
import 'package:adventour_company/pages/welcome_page.dart';
import 'package:adventour_company/pages/stats_page.dart';
import 'package:adventour_company/pages/add_promotion_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AdventourAdminApp());
}

class AdventourAdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: '/',
      routes: {
        '/': (_) => RootPage(),
        '/initPage': (_) => InitPage(),
        '/logInPage': (_) => LogInPage(),
        '/signUpPage': (_) => SignUpPage(),
        '/welcomePage': (_) => WelcomePage(),
        '/addPromotionPage': (_) => AddPromotionPage(),
        '/statsPage': (_) => StatsPage(),
      },
    );
  }
}
