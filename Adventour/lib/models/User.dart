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

  User(userName, email, [image = '']) {
    _userName = userName;
    _email = email;
    _image = image;
    _changeLook = 0;
    _completedRoutes = 0;
    _editedRoutes = 0;
    _routesHighlight = 0;
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
        'completedRoutes': _completedRoutes,
        'editedRoutes': _editedRoutes,
        "routesHighlight": _routesHighlight,
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
    switch (affected) {
      case "changeLook":
        return _changeLook;
      case "completedRoutes":
        return _completedRoutes;
      case "editedRoutes":
        return _editedRoutes;
      case "routesHighlight":
        return _routesHighlight;
      default:
        return null;
    }
  }

  @override
  String toString() {
    return """
completedRoutes = $_completedRoutes
    """;
  }
}
