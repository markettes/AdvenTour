import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/models/Achievement.dart';
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

//----------------------------------------Achievements-----------------------------
  Future<List<Achievement>> toAchievements() async {
    List<Achievement> achievements = List<Achievement>();
    Achievement aux;
    QuerySnapshot querySnapshot =
        await _firestore.collection("Achievements").get();
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      var data = querySnapshot.docs[i].data();
      aux = new Achievement(data['name'], data['description'], data['affected'], data['objective']);
      achievements.add(aux);
    }
    
    return achievements;
  }
}

DB db;
