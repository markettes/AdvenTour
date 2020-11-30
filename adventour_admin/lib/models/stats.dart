import 'package:cloud_firestore/cloud_firestore.dart';

class Stats {
  final int userCount;
  final int appCount;
  final int errorCount;

  Stats({this.userCount, this.appCount, this.errorCount});

  Stats.fromSnapshot(DocumentSnapshot snapshot)
      : appCount = snapshot['appCount'] ?? 0,
        userCount = snapshot['userCount'] ?? 0,
        errorCount = snapshot['errorCount'] ?? 0;
}
