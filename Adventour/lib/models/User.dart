import 'package:Adventour/models/Achievement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String _id;
  String _userName;
  String _email;
  String _image;
  int _changeLook;
  int _completedRoutes;
  int _editedRoutes;
  int _routesHighlight;

  User(userName, email, changeLook, completedRoutes, editedRoutes, routesHighlight, [image = '']) {
    _userName = userName;
    _email = email;
    _image = image;
    _changeLook = changeLook;
    _completedRoutes = completedRoutes;
    _editedRoutes = editedRoutes;
    _routesHighlight = routesHighlight;
  }

  User.fromFirestore(DocumentSnapshot snapshot) {
    _id = snapshot.id;
    Map data = snapshot.data();
    _userName = data['userName'];
    _email = data['email'];
    _image = data['image'];
    _changeLook = data['changeLook'];
    _completedRoutes = data['completedRoutes'];
    _editedRoutes = data['editedRoutes'];
    _routesHighlight = data['routesHighlight'];
  }

  Map<String, dynamic> toJson() => {
        'userName': _userName,
        'email': _email,
        'image': _image,
        'changeLook': _changeLook,
        'completedRoutes' : _completedRoutes,
        'editedRoutes' : _editedRoutes,
        "routesHighlight" : _routesHighlight,
      };

  get id => _id;

  get userName => _userName;

  set userName(userName) => _userName = userName;

  get email => _email;

  get image => _image;

  get changeLook => _changeLook;

  get completedRoutes => _completedRoutes;

  get editedRoutes => _editedRoutes;

  get routesHighlight => _routesHighlight;

  int getAttribute(String affected) {
    if (affected == "changeLook") return _changeLook;
    else if (affected == "completedRoutes") return _completedRoutes;
    else if (affected == "editedRoutes") return _editedRoutes;
    else if (affected == "routesHighlight") return _routesHighlight;
    else return 0;
  }
}
