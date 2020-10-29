import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class RoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/logo_adventour.png',
                    height: 180,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/logo_adventour.png'),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Texto de ejemplo'),
                      )
                    ],
                  ),
                  PrimaryButton(
                    text: 'HIGHLIGHTS',
                    onPressed: () {
                      //Navigator.of(context).pushNamed('/xxx');
                    },
                    style: ButtonType.Normal,
                  ),
                  PrimaryButton(
                    text: 'CUSTOM',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/customRoutePage');
                    },
                    style: ButtonType.Normal,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
