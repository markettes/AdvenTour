import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/models/Achievement.dart';
import 'package:Adventour/models/User.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:Adventour/widgets/scroll_column_expandable.dart';
import 'package:flutter/material.dart';

class AchievementsPage extends StatefulWidget {
  @override
  _AchievementsPageState createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  // List<Achievement> _achievements = List<Achievement>();
  // User actualUser;

  // @override
  // void initState() {
  //   Future<User> user = db.getCurrentUserName(auth.currentUserEmail);
  //   user.then((value) {
  //     actualUser = value;
  //   });
  //   Future<List<Achievement>> achievementss = db.getAchievements();
  //   achievementss.then((value) => _achievements = value);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Achievements"),
      ),
      // body: ScrollColumnExpandable(
      //   children: [
      //     for (int i = 0; i < _achievements.length; i++)
      //       InfAchievement(
      //         achievement: _achievements[i],
      //         actualUser: actualUser,
      //       ),
      //   ],
      // ),
      body: StreamBuilder(
          stream: db.getUser(db.currentUserId),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            if (!snapshot.hasData)
              Center(child: CircularProgressIndicator());
            User user = snapshot.data;
            return StreamBuilder(
                stream: db.getAchievements(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  List<Achievement> achievements = 
                      sortByCompleted(user, snapshot.data);
                  return ListView.separated(
                    itemCount: achievements.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 5),
                    itemBuilder: (context, index) {
                      Achievement achievement = achievements[index];

                      return AchievementWidget(
                          achievement: achievement, user: user);
                    },
                  );
                });
          }),
    );
  }
}

class AchievementWidget extends StatelessWidget {
  Achievement achievement;
  User user;
  AchievementWidget({
    @required this.achievement,
    @required this.user,
  });

  @override
  Widget build(BuildContext context) {
    int attribute = user.getAttribute(achievement.affected) ?? 0;
    bool isCompleted = attribute >= achievement.objective;
    print('?' + isCompleted.toString());
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Opacity(
        opacity: isCompleted ? 1 : 0.75,
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      achievement.icon,
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
                          achievement.description,
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
                        child: Column(
                          children: [
                            isCompleted?Icon(Icons.emoji_events,size: 40,): CircularProgressIndicator(
                              value: attribute / achievement.objective,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).primaryColor),
                              backgroundColor: Theme.of(context).accentColor,
                            ),
                            attribute < achievement.objective
                                ? Text(attribute.toString() +
                                    "/" +
                                    achievement.objective.toString())
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
