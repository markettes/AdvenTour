import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/models/User.dart';
import 'package:adventour_admin/pages/highlights_page.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:adventour_admin/pages/users_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: TabBarView(
          children: [
            HighlightsPage(),
            UsersPage()
          ],
        ),
      )
    );
  }
}
