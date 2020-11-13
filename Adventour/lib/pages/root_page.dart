import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/models/User.dart';
import 'package:Adventour/widgets/input_text.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Adventour/pages/init_page.dart';

import 'package:flutter/material.dart';

import 'map_page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (!snapshot.hasData) return CircularProgressIndicator();
          auth = Auth();
          db = DB();
          return StreamBuilder(
            stream: auth.authStatusChanges,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if (!snapshot.hasData) return InitPage();
              var user = snapshot.data;
              signIn(user.email, context);
              return MapPage();
            },
          );
        });
  }

  Future signIn(String email, BuildContext context) async {
    String id = await db.signIn(email);
    db.currentUserId = id;
    User user = await db.getUser(id).first;
      if (user.userName == '') {
        user.userName = await _showUserNameDialog(context);
        db.updateUser(user.id, user);
      }
  }

  Future<String> _showUserNameDialog(BuildContext context) {
    TextEditingController _userNameController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              child: Column(
                children: [
                  Text(
                    'Put a username',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontSize: 20),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        InputText(
                          icon: Icons.person,
                          labelText: 'Username',
                          controller: _userNameController,
                          validator: (value) {
                            if (value.isEmpty)
                              return 'Username can\'t be empty';
                            return null;
                          },
                        ),
                        PrimaryButton(
                          text: 'OK',
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.pop(context, _userNameController.text);
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
