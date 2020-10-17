import 'package:Adventour/widgets/input_text.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPage createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  TextEditingController usernameController;
  TextEditingController passwordController;
  TextEditingController emailController;

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
            InputText(
              obscured: false,
              icon: Icons.email,
              labelText: 'Email',
              controller: emailController,
            ),
            PrimaryButton(
              text: 'Sign up',
              onPressed: () {},
              style: ButtonType.Normal,
            ),
          ],
        ),
      ),
    );
  }
}
