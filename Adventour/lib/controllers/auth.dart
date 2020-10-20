import 'dart:async';
import 'package:Adventour/controllers/db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:Adventour/models/User.dart' as myuser;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleAuth = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  Stream<User> get authStatusChanges => _firebaseAuth.authStateChanges();

  get currentUser => _firebaseAuth.currentUser;

  get currentUserEmail => _firebaseAuth.currentUser.email;

  Future<String> signIn(String email, String password) async {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    User user = result.user;
    return user.uid;
  }

  Future<String> registerUser(myuser.User user, String password) async {
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email, password: password);

    User firebaseUser = result.user;
    db.addUser(user);
    signIn(user.email, password);
    return firebaseUser.uid;
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

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await _googleAuth.signIn();
    if (googleSignInAccount != null) {
      print(googleSignInAccount.email);
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential result =
          await _firebaseAuth.signInWithCredential(credential);
      User user = result.user;
      return user;
    }
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult != null) {
      final FacebookAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken.token);

      final UserCredential result = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      return result.user;
    }
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future changePassword(String newPassword) async {
    _firebaseAuth.currentUser.updatePassword(newPassword);
  }

  Future changeEmail(String newEmail) async {
    _firebaseAuth.currentUser.updateEmail(newEmail);
  }
}

String logInEmailError(FirebaseAuthException exception) {
  switch (exception.code) {
    case 'invalid-email':
      return 'Email address is not valid';
    case 'user-not-found':
      return 'User with this email doesn\'t exist';
    case 'user-disabled':
      return 'User disabled';
    case 'operation-not-allowed':
      return 'Signing in with Email and Password is not enabled';
  }
  return null;
}

String logInPasswordError(FirebaseAuthException exception) {
  if (exception.code == 'wrong-password') {
    return 'Your password is wrong';
  }
  return null;
}

String signInEmailError(FirebaseAuthException exception) {
  switch (exception.code) {
    case 'invalid-email':
      return 'Email address is not valid';
      break;
    case 'email-already-in-use':
      return 'Email already exists';
      break;
  }
  return null;
}

String signInPasswordError(FirebaseAuthException exception) {
  if (exception.code == 'weak-password') {
    return 'Your password is wrong, it should have at least 6 characters';
  }
  return null;
}

Auth auth;
