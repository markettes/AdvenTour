import 'package:cloud_firestore/cloud_firestore.dart';

class Achievement {
  String _name;
  String _description;
  String _affected;
  int _objective;

  String _id;

  Achievement(name, description, affected, objective) {
    _name = name;
    _description = description;
    _affected = affected;
    _objective = objective;
  }

  /*Achievement.fromFirestore(QuerySnapshot snapshot){
    Map data = snapshot.data();
    _name = data['name'];
    _description = data['description'];
    _affected = data['affected'];
    _objective = data['objective'];
  }

  Map<String, dynamic> toFirestore() => {
        'name': _name,
        'description': _description,
        'affected' : _affected,
        'objective' : _objective,
      }
*/

  List<Achievement> toAchievements(List docs) =>
    docs.map((doc) => Achievement.fromJson(doc)).toList();

  Achievement.fromJson(DocumentSnapshot doc) {
    _id = doc.id;
    var data = doc.data();
    _name = data['name'];
    _description = data['description'];
    _affected = data['affected'];
    _objective = data['objective'];
  }
  get name => _name;
  get description => _description;
  get affected => _affected;
  get objective => _objective;
}
