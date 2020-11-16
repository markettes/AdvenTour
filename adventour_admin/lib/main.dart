import 'package:adventour_admin/controllers/db.dart';
import 'package:adventour_admin/pages/root_page.dart';
import 'package:adventour_admin/pages/route_request_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/main.dart';

void main() {
  runApp(AdventourAdminApp());
}

class AdventourAdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: RootPage()
    );
  }
}
