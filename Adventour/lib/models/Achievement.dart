import 'package:Adventour/models/User.dart';
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

  Achievement.fromJson(DocumentSnapshot doc) {
    _id = doc.id;
    var data = doc.data();
    _name = data['name'];
    _description = data['description'];
    _affected = data['affected'];
    _objective = data['objective'];
  }
  get name => _name;
  String get description => _description;
  String get affected => _affected;
  int get objective => _objective;
}

List<Achievement> toAchievements(List docs) =>
    docs.map((doc) => Achievement.fromJson(doc)).toList();

List<Achievement> sortByCompleted(User user, List<Achievement> achievements) {
  List<Achievement> completed = [];
  List<Achievement> notCompleted = [];
  for (var achievement in achievements) {
    if (user.getAttribute(achievement.affected) != null) {
      if (user.getAttribute(achievement.affected) >= achievement.objective)
        completed.add(achievement);
      else
        notCompleted.add(achievement);
    }
  }
  return completed + notCompleted;
}
