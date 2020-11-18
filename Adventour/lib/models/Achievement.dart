import 'package:cloud_firestore/cloud_firestore.dart';

class Achievement {
  String _name;
  String _description;
  bool _completed;

  Achievement(name, description, completed) {
    _name = name;
    _description = description;
    _completed = completed;
  }

  Achievement.fromFirestore(QueryDocumentSnapshot snapshot){
    Map data = snapshot.data();
    _name = data['name'];
    _description = data['description'];
    _completed = data['completed'];
  }

  Map<String, dynamic> toFirestore() => {
        'name': _name,
        'description': _description,
        'completed' : _completed,
      };

  get name => _name;  
  get description => _description;
  get completed => _completed;
}