import 'package:Adventour/controllers/auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Sign out'),
          onPressed: auth.signOut,
        ),
      ),
    );
  }
}
