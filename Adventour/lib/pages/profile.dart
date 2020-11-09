import 'package:flutter/material.dart';
import 'package:Adventour/controllers/auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _passwordController = TextEditingController();
  var _newPasswordController = TextEditingController();
  var _repeatPasswordController = TextEditingController();
  bool checkCurrentPasswordValid = true;
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                                size: 50,
                                color: Theme.of(context).primaryColor,
                              ),
                              Text(
                                '${auth.currentUser.displayName}',
                                style: Theme.of(context).textTheme.bodyText1,
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
                                size: 50,
                                color: Theme.of(context).primaryColor,
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
                    Flexible(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Manage Password",
                              style: Theme.of(context).textTheme.display1,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Password",
                                errorText: checkCurrentPasswordValid
                                    ? null
                                    : "Please double check your current password",
                              ),
                              controller: _passwordController,
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(hintText: "New Password"),
                              controller: _newPasswordController,
                              obscureText: true,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Repeat Password",
                              ),
                              obscureText: true,
                              controller: _repeatPasswordController,
                              validator: (value) {
                                return _newPasswordController.text == value
                                    ? null
                                    : "Please validate your entered password";
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        var userController = auth.currentUser;
                        checkCurrentPasswordValid = await userController
                            .validateCurrentPassword(_passwordController.text);

                        setState(() {});

                        if (_formKey.currentState.validate() &&
                            checkCurrentPasswordValid) {
                          userController
                              .updateUserPassword(_newPasswordController.text);
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Save Profile"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _newPasswordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }
}
