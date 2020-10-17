import 'package:Adventour/widgets/input_text.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController usernameController;
  TextEditingController passwordController;

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
            InputText(
              obscured: false,
              icon: Icons.person,
              labelText: 'Username',
              controller: usernameController,
            ),
            InputText(
              obscured: true,
              icon: Icons.lock,
              labelText: 'Password',
              controller: passwordController,
            ),
            Text(
              'Forgot password?',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            PrimaryButton(
              text: 'Log in',
              onPressed: () {},
              style: ButtonType.Normal,
            ),
          ],
        ),
      ),
    );
  }
}
