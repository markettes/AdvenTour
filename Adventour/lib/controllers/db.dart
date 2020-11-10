import 'package:Adventour/controllers/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Adventour/models/User.dart';

class DB {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _currentUserId;

  get currentUserId => _currentUserId;

//----------------------------USERS-----------------------------------

  Future addUser(User user) {
    print(user.userName);
    _firestore.collection('Users').add(user.toFirestore());
  }

  Future<User> signIn(String email) async {
    QueryDocumentSnapshot snapshot = (await _firestore
            .collection('Users')
            .where('email', isEqualTo: email)
            .get())
        .docs
        .first;
    _currentUserId = snapshot.id;
    return User.fromFirestore(snapshot);
  }

  Future<void> changeUserName(User user, String newName) {
    _firestore.doc('Users/${user.id}').update({'userName': newName});
  }

  Future<User> getCurrentUserName(String email) async {
    QueryDocumentSnapshot snapshot = (await _firestore
            .collection('Users')
            .where('email', isEqualTo: auth.currentUserEmail)
            .get())
        .docs
        .first;
    _currentUserId = snapshot.id;
    return User.fromFirestore(snapshot);
  }
}

DB db;
