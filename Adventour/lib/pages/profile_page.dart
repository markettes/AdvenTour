import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/models/User.dart';
import 'package:Adventour/widgets/input_text.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/controllers/auth.dart';
import 'package:toast/toast.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _passwordController = TextEditingController();
  var _userNameController = TextEditingController();
  var _emailController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String _emailError;

  bool _isAdventureAccount = false;

  @override
  void initState() {
    // TODO: implement initState
    Future<User> user = db.getCurrentUserName(auth.currentUserEmail);
    user.then((value) {
      _userNameController.text = value.userName;
    });
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    auth.currentUser.providerData.forEach((profile) {
      if (profile.providerId == 'password') _isAdventureAccount = true;
    });

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: StreamBuilder(
          stream: db.getUser(db.currentUserId),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            User user = snapshot.data;
            _userNameController.text = user.userName;
            _emailController.text = user.email;
            return Column(
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
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: user.image != ''
                                  ? NetworkImage(user.image)
                                  : AssetImage("assets/empty_photo.jpg"),
                              fit: BoxFit.contain,
                            ),
                            shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            InputText(
                              controller: _userNameController,
                              icon: Icons.person,
                              labelText: 'Username',
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'Username can\'t be empty';
                                return null;
                              },
                            ),
                            InputText(
                              controller: _emailController,
                              icon: Icons.email,
                              labelText: 'Email',
                              errorText: _emailError,
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'Email can\'t be empty';
                                return null;
                              },
                            ),
                            SizedBox(height: 5),
                            PrimaryButton(
                              text: 'EDIT',
                              icon: Icons.edit,
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  user.userName = _userNameController.text;
                                  await db.updateUser(user.id, user);
                                  db.changeLook(user);
                                }
                              },
                            ),
                            if (_isAdventureAccount)
                              Divider(
                                thickness: 2,
                                color: Theme.of(context).primaryColor,
                                indent: 50,
                                endIndent: 50,
                                height: 30,
                              ),
                            if (_isAdventureAccount)
                              FlatButton(
                                onPressed: showPasswordDialog,
                                child: Text(
                                  'Change password',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(fontSize: 20),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  Future showPasswordDialog() => showDialog(
        context: context,
        builder: (context) {
          TextEditingController _passwordController = TextEditingController();
          TextEditingController _newPasswordController =
              TextEditingController();
          final _formKey = GlobalKey<FormState>();
          String _passwordError;
          String _newPasswordError;

          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 300,
                    child: Column(
                      children: [
                        Text(
                          'Put a new password',
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              .copyWith(fontSize: 20),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                child: InputText(
                                  icon: Icons.lock,
                                  labelText: 'Password',
                                  errorText: _passwordError,
                                  controller: _passwordController,
                                  obscured: true,
                                  validator: (value) {
                                    if (value.isEmpty)
                                      return 'Password can\'t be empty';
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                height: 100,
                                child: InputText(
                                  icon: Icons.lock,
                                  labelText: 'New password',
                                  errorText: _newPasswordError,
                                  controller: _newPasswordController,
                                  obscured: true,
                                  validator: (value) {
                                    if (value.isEmpty)
                                      return 'New password can\'t be empty';
                                    return null;
                                  },
                                ),
                              ),
                              PrimaryButton(
                                text: 'OK',
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    try {
                                      auth.changePassword(
                                          _passwordController.text,
                                          _newPasswordController.text);
                                      Navigator.pop(context);
                                      Toast.show('Password changed', context,
                                          duration: 3);
                                    } catch (e) {
                                      print('?' + e.code);
                                      setState(() {
                                        _passwordError = changePasswordError(e);
                                      });
                                    }
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
        },
      );
}

// Row(
//   children: [
//     Expanded(
//       child: Row(
//         children: [
//           Icon(
//             Icons.person,
//             size: 30,
//             color: Theme.of(context).primaryColor,
//           ),
//           SizedBox(
//             width: 5,
//           ),
//           Flexible(
//             child: Padding(
//               padding: const EdgeInsets.only(
//                   right: 30, bottom: 15),
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.only(
//                     top: 14,
//                   ),
//                   hintText: "Username",
//                 ),
//                 controller: _usernameController,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ],
// ),
// Row(
//   children: [
//     Expanded(
//       child: Row(
//         children: [
//           Icon(
//             Icons.email,
//             size: 30,
//             color: Theme.of(context).primaryColor,
//           ),
//           SizedBox(
//             width: 5,
//           ),
//           Text(
//             '${auth.currentUser.email}',
//             style: Theme.of(context).textTheme.bodyText1,
//           ),
//         ],
//       ),
//     ),
//   ],
// ),
// SizedBox(
//   height: 10,
// ),

// !googleAccount
//     ? Flexible(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               Text(
//                 "Manage Password",
//                 style:
//                     Theme.of(context).textTheme.headline2,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     right: 30, left: 30),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Actual password",
//                     errorText: checkCurrentPasswordValid
//                         ? null
//                         : "$_passwordError",
//                   ),
//                   controller: _passwordController,
//                   obscureText: true,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     right: 30, left: 30),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                       hintText: "New Password"),
//                   controller: _newPasswordController,
//                   obscureText: true,
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Password can\'t be empty';
//                     }
//                     return _newPasswordController.text ==
//                             value
//                         ? null
//                         : "Please validate your entered password";
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     right: 30, left: 30),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Repeat Password",
//                   ),
//                   obscureText: true,
//                   controller: _repeatPasswordController,
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Password can\'t be empty';
//                     }
//                     return _newPasswordController.text ==
//                             value
//                         ? null
//                         : "Please validate your entered password";
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       )
//     : SizedBox(),
// !googleAccount
//     ? PrimaryButton(
//         text: 'SAVE PROFILE',
//         onPressed: () async {
//           if (_newPasswordController.text != "" ||
//               _passwordController.text != "" ||
//               _repeatPasswordController.text != "") {
//             try {
//               await auth.signIn(auth.currentUser.email,
//                   _passwordController.text);
//               setState(() {
//                 checkCurrentPasswordValid = true;
//               });
//             } catch (e) {
//               checkCurrentPasswordValid = false;
//               _showError(e);
//               setState(() {});
//             }
//             if (_formKey.currentState.validate() &&
//                 checkCurrentPasswordValid) {
//               auth.currentUser.updatePassword(
//                   _newPasswordController.text);
//               db.updateUser(
//                   actualUser, _usernameController.text);
//               Navigator.pop(context);
//             }
//             db.updateUser(
//                 actualUser, _usernameController.text);
//           } else {
//             db.updateUser(
//                 actualUser, _usernameController.text);
//             Navigator.pop(context);
//           }
//         },
//       )
//     : PrimaryButton(
//         text: 'SAVE PROFILE',
//         onPressed: () async {
//           db.updateUser(
//               actualUser, _usernameController.text);
//           Navigator.pop(context);
//         })
