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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            "Manage Password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          )),
                        ],
                      ),
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
          ),
        ],
      ),
    );
  }
}
