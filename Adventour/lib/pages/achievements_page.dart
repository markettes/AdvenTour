import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/models/Achievement.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:Adventour/widgets/scroll_column_expandable.dart';
import 'package:flutter/material.dart';

class AchievementsPage extends StatefulWidget {
  @override
  _AchievementsPageState createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  Achievement achievement;
  List<Achievement> achievements;
  @override
  initState()  {
    db.toAchievements().then((value) => achievements = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Achievements"),
      ),
      body: ScrollColumnExpandable(
        children: [
          for(int i=0; i<achievements.length; i++) InfAchievement(achievement: achievements[i]),
          PrimaryButton(
              text: 'RETURN',
              onPressed: () async {

                print(achievements[0].name);
                //Navigator.pop(context);
              })
        ],
      ),
    );
  }
}

class InfAchievement extends StatelessWidget {
  Achievement achievement;
  InfAchievement({
    this.achievement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.emoji_events,
                    size: 50,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        this.achievement.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        this.achievement.description,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.5,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: this.achievement.affected == this.achievement.objective
                            ? Center(
                                child: Text(
                                  "X",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 2,
              color: Theme.of(context).primaryColor,
              indent: 10,
              endIndent: 10,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
