import 'dart:async';
//import 'package:Adventour/controllers/db.dart';
import 'package:adventour_company/controllers/db.dart';
import 'package:Adventour/widgets/input_text.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:Adventour/models/User.dart' as myuser;
import 'package:adventour_company/models/Company.dart' as mycompany;

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleAuth = GoogleSignIn();

  Future<String> companySignIn(String email, String password) async {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    User user = result.user;
    return user.uid;
  }

  Future<UserCredential> registerCompany(mycompany.Company company, String password) async {
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: company.email, password: password);

    db.addCompany(company);
    //userSignIn(company.email, password);
    return result;
  }
 
 
 //---------------------------USER------------------------------------------

  Stream<User> get authStatusChanges => _firebaseAuth.authStateChanges();

  User get currentUser => _firebaseAuth.currentUser;

  get currentUserEmail => _firebaseAuth.currentUser.email;

  Future<String> userSignIn(String email, String password) async {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    User user = result.user;
    return user.uid;
  }

  Future<UserCredential> registerUser(myuser.User user, String password) async {
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email, password: password);

    db.addUser(user);
    userSignIn(user.email, password);
    return result;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<User> reauthCurrentUser(String password) async {
    User user = _firebaseAuth.currentUser;
    AuthCredential credential =
        EmailAuthProvider.credential(email: user.email, password: password);

    return (await user.reauthenticateWithCredential(credential)).user;
  }

  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount googleSignInAccount = await _googleAuth.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential result =
          await _firebaseAuth.signInWithCredential(credential);

      if (result.additionalUserInfo.isNewUser) {
        myuser.User user =
            myuser.User('', result.user.email, result.user.photoURL);
            print('?'+ user.image);
        db.addUser(user);
      }

      return result;
    }
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future changePassword(String newPassword) =>
      _firebaseAuth.currentUser.updatePassword(newPassword);

  Future changeEmail(String newEmail) =>
      _firebaseAuth.currentUser.updateEmail(newEmail);
}

String emailError(FirebaseAuthException exception) {
  switch (exception.code) {
    case 'invalid-email':
      return 'Email address is not valid';
    case 'user-not-found':
      return 'User with this email doesn\'t exist';
    case 'user-disabled':
      return 'User disabled';
    case 'operation-not-allowed':
      return 'Signing in with Email and Password is not enabled';
    case 'email-already-in-use':
      return 'Email already exists';
    case 'requires-recent-login':
      return 'Try it later';
    case 'user-mismatch':
      return 'the credential not correspond to the user';
    case 'invalid-credential':
      return 'invalid credentials';
    default:
      return null;
  }
}

String passwordError(FirebaseAuthException exception) {
  switch (exception.code) {
    case 'wrong-password':
      return 'Your password is wrong';
    case 'weak-password':
      return 'It should have at least 6 characters';
    case 'requires-recent-login':
      return 'Try it later';
    case 'user-mismatch':
      return 'the credential not correspond to the user';
    case 'invalid-credential':
      return 'invalid credentials';
    default:
      return null;
  }
}

Auth auth;
