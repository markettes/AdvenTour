import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Adventour/models/Route.dart';
import 'package:firebase_core/firebase_core.dart';

class DB {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Route>> getRouteRequests() => _firestore
      .collectionGroup('Routes')
      .where('name', isEqualTo: 'a')
      .orderBy('latitude')
      .snapshots()
      .map((snap) => toRoutes(snap.docs));

  Future addRouteHighlight(Route route, String highlightId) => _firestore
      .collection('Highligths/$highlightId/Routes')
      .add(route.toJson());

  Future deleteRouteRequest(String requestId) =>
      _firestore.doc('RouteRequests/$requestId').delete();
}

DB db;
