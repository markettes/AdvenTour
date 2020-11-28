import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  MainPage({this.requests});
  List<r.Route> requests;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              text: 'ROUTES',
              style: ButtonType.Normal,
              onPressed: () {
                Navigator.of(context).pushNamed('/routeRequestPage',
                    arguments: {'requests': requests});
              },
            ),
            PrimaryButton(
              text: 'USERS',
              style: ButtonType.Normal,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
