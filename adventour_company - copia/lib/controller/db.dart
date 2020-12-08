import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Adventour/models/Route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DB {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream<List<Route>> getRouteRequests() => _firestore
  //     .collectionGroup('Routes')
  //     .where('requested', sisEqualTo: 'true')
  //     .orderBy('creationDate')
  //     .snapshots()
  //     .map((snap) => toRoutes(snap.docs));

  Future addHighlight(String userId, String routeId) {
    _firestore.doc('Users/$userId').update({'routesHighlight': FieldValue.increment(1)});
    _firestore
      .doc('Users/$userId/Routes/$routeId')
      .update({'isHighlight': 'true'});
  } 

  Future deleteRouteRequest(String userId, String routeId) => _firestore
      .doc('Users/$userId/Routes/$routeId')
      .update({'requested': 'false'});

    Future<void> routesHighlight(String id) async {
          DocumentSnapshot querySnapshot = await _firestore.doc('Users/$id').get();
          var data = querySnapshot.data();
          var data2 = data['routesHighlight'];
          _firestore.doc('Users/$id').update({'routesHighlight': data2 + 1});
  }

}

DB db;