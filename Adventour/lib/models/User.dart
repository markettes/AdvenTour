import 'package:Adventour/models/Achievement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String _id;
  String _userName;
  String _email;
 
  User(userName, email) {
    _userName = userName;
    _email = email;

  }

  User.fromFirestore(QueryDocumentSnapshot snapshot){
    _id = snapshot.id;
    Map data = snapshot.data();
    _userName = data['userName'];
    _email = data['email'];
  }

  Map<String, dynamic> toFirestore() => {
        'userName': _userName,
        'email': _email,        
      };

  get id => _id;
  
  get userName => _userName;

  get email => _email;
}
