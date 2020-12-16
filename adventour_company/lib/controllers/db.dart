import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/models/FinishedRoute.dart';
import 'package:Adventour/models/Route.dart';
import 'package:Adventour/models/Achievement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Adventour/models/User.dart';
import 'package:adventour_company/models/Company.dart';

class DB {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _currentUserId;

  String get currentUserId => _currentUserId;

  set currentUserId(String userId) => _currentUserId = userId;


//----------------------------COMPANYS--------------------------------
  Future addCompany(Company company){
    _firestore.collection('Companys').add(company.toJson());
  }

    Stream<Company> getCompany(String companyId) => _firestore
      .doc('Companys/$companyId')
      .snapshots()
      .map((doc) => Company.fromFirestore(doc));

    Future<String> companySignIn(String email) async {
    QueryDocumentSnapshot snapshot = (await _firestore
            .collection('Companys')
            .where('email', isEqualTo: email)
            .get())
        .docs
        .first;
    return snapshot.id;
  }    

//----------------------------USERS-----------------------------------

  Future addUser(User user) {
    _firestore.collection('Users').add(user.toJson());
  }

  Stream<User> getUser(String userId) => _firestore
      .doc('Users/$userId')
      .snapshots()
      .map((doc) => User.fromFirestore(doc));

  Future<String> UserSignIn(String email) async {
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

}

DB db;
