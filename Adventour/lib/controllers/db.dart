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

  Stream<User> getUser(String userId) => _firestore
      .doc('Users/$userId')
      .snapshots()
      .map((doc) => User.fromFirestore(doc));

  Stream<List<User>> getUsers() => _firestore
      .collectionGroup('Users')
      .snapshots()
      .map((snap) => toUsers(snap.docs));

  Future<String> signIn(String email) async {
    QueryDocumentSnapshot snapshot = (await _firestore
            .collection('Users')
            .where('email', isEqualTo: email)
            .get())
        .docs
        .first;
    return snapshot.id;
  }

  Future updateUser(User user) =>
      _firestore.doc('Users/${user.id}').update(user.toJson());

  Future<void> changeLook(String userId) {
    _firestore
        .doc('Users/$userId')
        .update({'changeLook': FieldValue.increment(1)});
  }

  Future<void> completeRoute(String userId) {
    _firestore
        .doc('Users/$userId')
        .update({'completedRoutes': FieldValue.increment(1)});
  }

  Future<void> editeRoute(String userId) {
    _firestore
        .doc('Users/$userId')
        .update({'editedRoutes': FieldValue.increment(1)});
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

  Future updateRoute(Route route) => _firestore
      .doc('Users/${route.author}/Routes/${route.id}')
      .update(route.toJson());


  Stream<List<Route>> getHighlights(String locationId) => _firestore
      .collectionGroup('Routes')
      .where('locationId', isEqualTo: locationId)
      .where('isPublic', isEqualTo: 'true')
      .orderBy('likes')
      .snapshots()
      .map((snap) => toRoutes(snap.docs));

  Future addFinishedRoute(String userId, FinishedRoute route) =>
      _firestore.collection('Users/$userId/RouteHistory').add(route.toJson());

  Stream<List<FinishedRoute>> getUserHistory(
          String userId, DateTime initialDateTime, DateTime finishDateTime) =>
      _firestore
          .collection('Users/$userId/RouteHistory')
          .orderBy('dateTime')
          .where('dateTime', isGreaterThanOrEqualTo: initialDateTime)
          .where('dateTime', isLessThanOrEqualTo: finishDateTime)
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

  Stream<List<Achievement>> getAchievements() => _firestore
      .collection('Achievements')
      .snapshots()
      .map((snap) => toAchievements(snap.docs));

  // Future<void> changeLook(String userId) {
  //   _firestore.doc('Users/$userId').update({'changeLook': 1});
  // }

  // Future<void> completedRoutes(User user) {
  //   var completedRoutes = user.completedRoutes + 1;
  //   _firestore
  //       .doc('Users/${user.id}')
  //       .update({'completedRoutes': completedRoutes});
  // }

  // Future<void> editedRoutes(User user) {
  //   var editedRoutes = user.editedRoutes + 1;
  //   _firestore.doc('Users/${user.id}').update({'editedRoutes': editedRoutes});
  // }
}

DB db;
