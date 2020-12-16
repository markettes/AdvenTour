import 'package:adventour_company/controllers/auth.dart';
import 'package:adventour_company/widgets/google_button.dart';
import 'package:adventour_company/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({this.allowSignUp = true});
  bool allowSignUp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
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
                    'assets/logo_adventour+titulo.png',
                    height: 180,
                  ),
                  PrimaryButton(
                    text: 'Add promotion',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/addPromotionPage');
                    },
                    icon: Icons.add_outlined,
                    style: ButtonType.Normal,
                  ),
                  if (allowSignUp)
                    PrimaryButton(
                      text: 'Stats',
                      onPressed: () {
                        Navigator.of(context).pushNamed('/statsPage');
                      },
                      icon: Icons.bar_chart,
                      style: ButtonType.Normal,
                    ),
                  FloatingActionButton(
                      onPressed: () {
                        auth.signOut();
                      },
                      child: Icon(
                        Icons.logout,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
