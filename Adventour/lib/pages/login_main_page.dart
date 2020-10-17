import 'package:Adventour/widgets/facebook_signin_button.dart';
import 'package:Adventour/widgets/google_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/widgets/primary_button.dart';

class LoginMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/logo_adventour+titulo.png',
                height: 200,
              ),
            ),
            PrimaryButton(
              text: 'Log in',
              onPressed: () {
                Navigator.of(context).pushNamed('/loginPage');
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
              text: 'Sign up',
              onPressed: () {
                Navigator.of(context).pushNamed('/signupPage');
              },
              style: ButtonType.Normal,
            ),
            Divider(
              color: Theme.of(context).dividerColor,
              indent: 25,
              endIndent: 25,
              thickness: 1,
            ),
            FacebookSigninButton(
              onPressed: () {},
              text: 'Continue with Facebook',
            ),
            GoogleSigninButton(
              onPressed: () {},
              text: 'Continue with Google',
            )
          ],
        ),
      ),
    );
  }
}
