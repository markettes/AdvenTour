import 'package:flutter/material.dart';
import 'package:Adventour/widgets/primary_button.dart';

class LoginMainPage extends StatefulWidget {
  @override
  _LoginMainPageState createState() => _LoginMainPageState();
}

class _LoginMainPageState extends State<LoginMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/logo_adventour+titulo.png',
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: PrimaryButton(
                text: 'Log in',
                onPressed: () {},
                style: ButtonType.Normal,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Don't you have account?",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
