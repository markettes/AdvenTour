import 'package:Adventour/widgets/input_text.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:Adventour/widgets/scroll_column_expandable.dart';
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
      appBar: AppBar(
        title: Text('Put your credentials'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ScrollColumnExpandable(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/logo_adventour+titulo.png',
              height: 180,
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
              keyboardType: TextInputType.emailAddress,
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
