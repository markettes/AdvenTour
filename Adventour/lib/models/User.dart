import 'package:Adventour/models/Achievement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String _id;
  String _userName;
  String _email;
  String _changeLook;
 
  User(userName, email, changeUsername) {
    _userName = userName;
    _email = email;
    _changeLook = changeLook;
  }

  User.fromFirestore(QueryDocumentSnapshot snapshot){
    _id = snapshot.id;
    Map data = snapshot.data();
    _userName = data['userName'];
    _email = data['email'];
    _changeLook = data['changeLook'];
  }

  Map<String, dynamic> toFirestore() => {
        'userName': _userName,
        'email': _email,  
        '_changeLook' : changeLook,      
      };

  get id => _id;
  
  get userName => _userName;

  get email => _email;
  
  get changeLook => _changeLook;

  String getAttribute(String affected) {
    if(affected == "changeLook"){
      return _changeLook;
    }
    else return "true";
  }
}
