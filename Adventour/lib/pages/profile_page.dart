import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/models/User.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/controllers/auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _passwordController = TextEditingController();
  var _newPasswordController = TextEditingController();
  var _repeatPasswordController = TextEditingController();
  var _usernameController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String _passwordError;
  bool checkCurrentPasswordValid = true;
  bool googleAccount;
  String userName;
  User actualUser;

  @override
  void initState() {
    Future<User> user = db.getCurrentUserName(auth.currentUserEmail);
    user.then((value) {
      _usernameController.text = value.userName;
      actualUser = value;
    });
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userController = auth.currentUser;
    if (userController != null) {
      userController.providerData.forEach((profile) {
        googleAccount = profile.providerId == "google.com";
      });
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                image: DecorationImage(
                  image: AssetImage('assets/drawer_background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: auth.currentUser.photoUrl != null
                              ? NetworkImage('${auth.currentUser.photoUrl}')
                              : AssetImage("assets/empty_photo.jpg"),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 30,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 30, bottom: 15),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                        top: 14,
                                      ),
                                      hintText: "Username",
                                    ),
                                    controller: _usernameController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.email,
                                size: 30,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${auth.currentUser.email}',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    !googleAccount
                        ? Flexible(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Manage Password",
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 30, left: 30),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "Actual password",
                                        errorText: checkCurrentPasswordValid
                                            ? null
                                            : "$_passwordError",
                                      ),
                                      controller: _passwordController,
                                      obscureText: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 30, left: 30),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          hintText: "New Password"),
                                      controller: _newPasswordController,
                                      obscureText: true,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Password can\'t be empty';
                                        }
                                        return _newPasswordController.text ==
                                                value
                                            ? null
                                            : "Please validate your entered password";
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 30, left: 30),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "Repeat Password",
                                      ),
                                      obscureText: true,
                                      controller: _repeatPasswordController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Password can\'t be empty';
                                        }
                                        return _newPasswordController.text ==
                                                value
                                            ? null
                                            : "Please validate your entered password";
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : SizedBox(),
                    !googleAccount
                        ? PrimaryButton(
                            text: 'SAVE PROFILE',
                            onPressed: () async {
                              if (_newPasswordController.text != "" ||
                                  _passwordController.text != "" ||
                                  _repeatPasswordController.text != "") {
                                try {
                                  await auth.signIn(auth.currentUser.email,
                                      _passwordController.text);
                                  setState(() {
                                    checkCurrentPasswordValid = true;
                                  });
                                } catch (e) {
                                  checkCurrentPasswordValid = false;
                                  _showError(e);
                                  setState(() {});
                                }
                                if (_formKey.currentState.validate() &&
                                    checkCurrentPasswordValid) {
                                  auth.currentUser.updatePassword(
                                      _newPasswordController.text);
                                  db.changeUserName(
                                      actualUser, _usernameController.text);
                                  //Achievement ChangeLook
                                  db.changeLook(actualUser);
                                  Navigator.pop(context);
                                }
                                db.changeUserName(
                                    actualUser, _usernameController.text);
                                //Achievement ChangeLook
                                db.changeLook(actualUser);
                              } else {
                                db.changeUserName(
                                    actualUser, _usernameController.text);
                                //Achievement ChangeLook
                                db.changeLook(actualUser);
                                Navigator.pop(context);
                              }
                            },
                          )
                        : PrimaryButton(
                            text: 'SAVE PROFILE',
                            onPressed: () async {
                              db.changeUserName(
                                  actualUser, _usernameController.text);
                              //Achievement ChangeLook
                              db.changeLook(actualUser);
                              Navigator.pop(context);
                            })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showError(e) {
    setState(() {
      _passwordError = logInPasswordError(e);
    });
  }
}
