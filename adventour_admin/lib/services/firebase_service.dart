import 'dart:async';

import 'package:adventour_admin/models/stats.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final StreamController<Stats> _statsController = StreamController<Stats>();

  FirebaseService() {
    FirebaseFirestore.instance
        .collection('Informations')
        .doc('Stats')
        .snapshots()
        .listen((_statsUpdated));
  }

  Stream<Stats> get appStats => _statsController.stream;

  void _statsUpdated(DocumentSnapshot snapshot) {
    _statsController.add(Stats.fromSnapshot(snapshot));
  }
}
