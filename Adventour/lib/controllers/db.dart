import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/models/FinishedRoute.dart';
import 'package:Adventour/models/Route.dart';
import 'package:Adventour/models/Achievement.dart';
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

//----------------------------ROUTES-----------------------------------

  Stream<List<Route>> getRoutes(String userId) => _firestore
      .collection('Users/$userId/Routes')
      .snapshots()
      .map((snap) => toRoutes(snap.docs));

  Future addRoute(Route route) =>
      _firestore.collection('Users/$_currentUserId/Routes').add(route.toJson());

  Future deleteRoute(String userId, String routeId) =>
      _firestore.doc('Users/$userId/Routes/$routeId').delete();

  Future requestRoute(String userId, String routeId) => _firestore
      .doc('Users/$userId/Routes/$routeId')
      .update({'requested': 'true'});

  Stream<List<Route>> getHighlights(String locationId) => _firestore
      .collectionGroup('Routes')
      .where('locationId', isEqualTo: locationId)
      .where('isHighlight', isEqualTo: 'true')
      .orderBy('likes')
      .snapshots()
      .map((snap) => toRoutes(snap.docs));

  Future addFinishedRoute(String userId, FinishedRoute route) =>
      _firestore.collection('Users/$userId/RouteHistory').add(route.toJson());

  Stream<List<FinishedRoute>> getUserHistory(String userId) => _firestore
      .collection('Users/$userId/RouteHistory')
      .snapshots()
      .map((snap) => toFinisedRoutes(snap.docs));
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
  Future<List<Achievement>> getAchievements() async {
    List<Achievement> achievements = List<Achievement>();
    Achievement aux;
    QuerySnapshot querySnapshot =
        await _firestore.collection("Achievements").get();
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      var data = querySnapshot.docs[i].data();
      aux = new Achievement(data['name'], data['description'], data['affected'],
          data['objective']);
      achievements.add(aux);
    }

    return achievements;
  }

  Future<void> changeLook(User user) {
    _firestore.doc('Users/${user.id}').update({'changeLook': 1});
  }

    Future<void> completedRoutes(User user) {
    var completedRoutes = user.completedRoutes + 1;
    _firestore.doc('Users/${user.id}').update({'completedRoutes': completedRoutes});
  }
}

DB db;
