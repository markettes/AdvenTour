import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/models/Route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Adventour/models/User.dart';

class DB {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _currentUserId;

  String get currentUserId => _currentUserId;

  set currentUserId(String userId) => _currentUserId = userId;

//----------------------------USERS-----------------------------------

  Future addUser(User user) {
    _firestore.collection('Users').add(user.toJson());
  }

  Stream<User> getUser(String userId) {
    return _firestore
        .doc('Users/$userId')
        .snapshots()
        .map((doc) => User.fromFirestore(doc));
  }

  Future<String> signIn(String email) async {
    QueryDocumentSnapshot snapshot = (await _firestore
            .collection('Users')
            .where('email', isEqualTo: email)
            .get())
        .docs
        .first;
    return snapshot.id;
  }

  Future<void> updateUser(String userId, User user) {
    _firestore.doc('Users/$userId').update(user.toJson());
  }

  // Future<User> getCurrentUserName(String email) async {
  //   QueryDocumentSnapshot snapshot = (await _firestore
  //           .collection('Users')
  //           .where('email', isEqualTo: auth.currentUserEmail)
  //           .get())
  //       .docs
  //       .first;
  //   _currentUserId = snapshot.id;
  //   return User.fromFirestore(snapshot);
  // }

  Future addRoute(Route route) {
    _firestore.collection('Users/$_currentUserId/Routes').add(route.toJson());
  }
}

DB db;
