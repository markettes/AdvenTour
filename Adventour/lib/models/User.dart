import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String _id;
  String _userName;
  String _email;
  String _image;

  User(userName, email, [image = '']) {
    _userName = userName;
    _email = email;
    _image = image;
  }

  User.fromFirestore(DocumentSnapshot snapshot){
    _id = snapshot.id;
    Map data = snapshot.data();
    _userName = data['userName'];
    _email = data['email'];
    _image = data['image'];
  }

  Map<String, dynamic> toJson() => {
        'userName': _userName,
        'email': _email,
        'image':_image
      };

  get id => _id;
  
  get userName => _userName;

  set userName(userName) => _userName = userName;

  get email => _email;

  get image => _image;
}
