import 'package:Adventour/models/Achievement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String _id;
  String _userName;
  String _email;
  String _image;
  String _changeLook;

  User(userName, email, [image = '', changeLook]) {
    _userName = userName;
    _email = email;
    _image = image;
    _changeLook = changeLook;
  }

  User.fromFirestore(DocumentSnapshot snapshot) {
    _id = snapshot.id;
    Map data = snapshot.data();
    _userName = data['userName'];
    _email = data['email'];
    _image = data['image'];
    _changeLook = data['changeLook'];
  }

  Map<String, dynamic> toJson() => {
        'userName': _userName,
        'email': _email,
        'image': _image,
        'changeLook': _changeLook,
      };

  get id => _id;

  get userName => _userName;

  set userName(userName) => _userName = userName;

  get email => _email;

  get image => _image;

  get changeLook => _changeLook;

  String getAttribute(String affected) {
    if (affected == "changeLook") {
      return _changeLook;
    } else
      return "true";
  }
}
