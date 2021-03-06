import 'package:adventour_company/controllers/auth.dart';
import 'package:adventour_company/controllers/db.dart';
import 'package:adventour_company/widgets/google_button.dart';
import 'package:adventour_company/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  InitPage({this.allowSignUp = true});
  bool allowSignUp;

  @override
  Widget build(BuildContext context) {
    auth = Auth();
    db = DB();
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
                  if (allowSignUp)
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "¿Don't you have an account?",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  if (allowSignUp)
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
          ],
        ),
      ),
    );
  }
}
