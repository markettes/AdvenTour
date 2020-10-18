import 'package:Adventour/widgets/facebook_button.dart';
import 'package:Adventour/widgets/google_button.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/widgets/primary_button.dart';

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/logo_adventour+titulo.png',
                    height: 180,
                  ),
                  PrimaryButton(
                    text: 'LOG IN',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/logInPage');
                    },
                    style: ButtonType.Normal,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Don't you have account?",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  PrimaryButton(
                    text: 'SIGN UP',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/signUpPage');
                    },
                    style: ButtonType.Void,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Divider(
                    color: Theme.of(context).dividerColor,
                    indent: 25,
                    endIndent: 25,
                    thickness: 1,
                  ),
                  FacebookButton(),
                  GoogleButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
