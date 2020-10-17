import 'package:Adventour/widgets/input_text.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:Adventour/widgets/scroll_column_expandable.dart';
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
          )),
    );
  }
}
