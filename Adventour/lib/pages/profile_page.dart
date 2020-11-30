import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/controllers/storage.dart';
import 'package:Adventour/models/User.dart';
import 'package:Adventour/widgets/input_text.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/controllers/auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

import '../app_localizations.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _userNameController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String _email;
  User _user;

  bool _isAdventureAccount = false;

  @override
  void initState() {
    auth.currentUser.providerData.forEach((profile) {
      if (profile.providerId == 'password') _isAdventureAccount = true;
    });
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('Profile')),
      ),
      body: StreamBuilder(
          stream: db.getUser(db.currentUserId),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            _user = snapshot.data;
            _userNameController.text = _user.userName;
            _email = _user.email;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/drawer_background.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: _user.image != ''
                                    ? NetworkImage(_user.image)
                                    : AssetImage("assets/empty_photo.jpg"),
                                fit: BoxFit.contain,
                              ),
                              shape: BoxShape.circle),
                        ),
                        onTap: () async {
                          PickedFile pickedFile = await ImagePicker()
                              .getImage(source: ImageSource.gallery);
                          String url = await storage.uploadAvatar(
                              db.currentUserId, await pickedFile.readAsBytes());
                          _user.image = url;
                          db.updateUser(_user);
                          db.changeLook(_user.id);
                        },
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: InputText(
                                controller: _userNameController,
                                icon: Icons.person,
                                labelText: AppLocalizations.of(context).translate('username') ,
                                validator: (value) {
                                  if (value.isEmpty)
                                    return AppLocalizations.of(context).translate('username_cannot') ;
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            PrimaryButton(
                              text: AppLocalizations.of(context).translate('edit') ,
                              icon: Icons.edit,
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  _user.userName = _userNameController.text;
                                  db.updateUser(_user);
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
                                onPressed: showEmailDialog,
                                child: Text(
                                  AppLocalizations.of(context).translate('change_email') ,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(fontSize: 20),
                                ),
                              ),
                            if (_isAdventureAccount)
                              FlatButton(
                                onPressed: showPasswordDialog,
                                child: Text(
                                  AppLocalizations.of(context).translate('change_password') ,
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
                          AppLocalizations.of(context).translate('put_password') ,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              .copyWith(fontSize: 20),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  height: 100,
                                  child: InputText(
                                    icon: Icons.lock,
                                    labelText: AppLocalizations.of(context).translate('password') ,
                                    errorText: _passwordError,
                                    controller: _passwordController,
                                    obscured: true,
                                    validator: (value) {
                                      if (value.isEmpty)
                                        return AppLocalizations.of(context).translate('password_cannot') ;
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  height: 100,
                                  child: InputText(
                                    icon: Icons.lock,
                                    labelText: AppLocalizations.of(context).translate('new_password') ,
                                    errorText: _newPasswordError,
                                    controller: _newPasswordController,
                                    obscured: true,
                                    validator: (value) {
                                      if (value.isEmpty)
                                        return AppLocalizations.of(context).translate('new_password_cannot') ;
                                      print('?' +
                                          value +
                                          ' ' +
                                          _passwordController.text);
                                      if (value == _passwordController.text)
                                        return AppLocalizations.of(context).translate('new_password_same') ;
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              PrimaryButton(
                                text: 'OK',
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    try {
                                      await auth.reauthCurrentUser(
                                          _passwordController.text);
                                      await auth.changePassword(
                                          _newPasswordController.text);
                                      Navigator.pop(context);
                                      Toast.show(AppLocalizations.of(context).translate('password_change') , context,
                                          duration: 3);
                                    } catch (e) {
                                      print('?error');
                                      print('?' + e.code);
                                      setState(() {
                                        _passwordError = passwordError(e);
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

  Future showEmailDialog() => showDialog(
        context: context,
        builder: (context) {
          TextEditingController _passwordController = TextEditingController();
          TextEditingController _emailController =
              TextEditingController(text: _email);
          final _formKey = GlobalKey<FormState>();
          String _passwordError;
          String _emailError;

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
                          AppLocalizations.of(context).translate('new_email') ,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              .copyWith(fontSize: 20),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  height: 100,
                                  child: InputText(
                                    icon: Icons.lock,
                                    labelText: AppLocalizations.of(context).translate('password') ,
                                    errorText: _passwordError,
                                    controller: _passwordController,
                                    obscured: true,
                                    validator: (value) {
                                      if (value.isEmpty)
                                        return AppLocalizations.of(context).translate('password_cannot') ;
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  height: 100,
                                  child: InputText(
                                    icon: Icons.email,
                                    labelText: AppLocalizations.of(context).translate('new_email') ,
                                    errorText: _emailError,
                                    controller: _emailController,
                                    obscured: false,
                                    validator: (value) {
                                      if (value.isEmpty)
                                        return AppLocalizations.of(context).translate('new_email_cannot') ;
                                      if (value == _email)
                                        return AppLocalizations.of(context).translate('new_email_same') ;
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              PrimaryButton(
                                text: 'OK',
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    try {
                                      await auth.reauthCurrentUser(
                                          _passwordController.text);
                                      await auth.changeEmail(
                                        _emailController.text,
                                      );
                                      _user.email = _emailController.text;
                                      db.updateUser(_user);
                                      Navigator.pop(context);
                                      Toast.show(AppLocalizations.of(context).translate('mail_changed') , context,
                                          duration: 3);
                                    } catch (e) {
                                      print('?' + e.code);
                                      setState(() {
                                        _emailError = emailError(e);
                                        _passwordError = passwordError(e);
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
