import 'package:Adventour/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Adventour/models/Route.dart';

class DB {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

Stream<List<Route>> getHighlights() => _firestore
      .collectionGroup('Routes')
      .where('isPublic', isEqualTo: 'true')
      .orderBy('likes')
      .snapshots()
      .map((snap) => toRoutes(snap.docs));

      Stream<List<User>> getUsers() => _firestore
      .collectionGroup('Users')
      .snapshots()
      .map((snap) => toUsers(snap.docs));
}

DB db = DB();
