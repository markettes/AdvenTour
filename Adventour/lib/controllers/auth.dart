import 'dart:async';
import 'package:Adventour/controllers/db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:Adventour/models/User.dart' as myuser;

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Stream<User> get authStatusChanges => _firebaseAuth.authStateChanges();

  get currentUser =>_firebaseAuth.currentUser;

  get currentUserEmail =>_firebaseAuth.currentUser.email;

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
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
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

Auth auth;
