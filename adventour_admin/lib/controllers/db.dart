import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Adventour/models/Route.dart';
import 'package:firebase_core/firebase_core.dart';

class DB {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Route>> getRouteRequests() => _firestore
      .collectionGroup('Routes')
      .where('requested', isEqualTo: 'true')
      .orderBy('creationDate')
      .snapshots()
      .map((snap) => toRoutes(snap.docs));

  Future addHighlight(String userId, String routeId) => _firestore
      .doc('Users/$userId/Routes/$routeId')
      .update({'isHighlight': 'true'});

  Future deleteRouteRequest(String userId, String routeId) => _firestore
      .doc('Users/$userId/Routes/$routeId')
      .update({'requested': 'false'});
}

DB db;
