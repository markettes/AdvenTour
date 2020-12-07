import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/models/User.dart';
import 'package:adventour_admin/controllers/db.dart';
import 'package:adventour_admin/widgets/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/widgets/route_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: auth.signOut,
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
                stream: db.getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  List<User> users = snapshot.data;
                  if (users.isEmpty)
                    return Center(
                      child: Text(
                        'Empty requests',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    );
                  return ListView.separated(
                    itemCount: users.length,
                    separatorBuilder: (context, index) => SizedBox(height: 5),
                    itemBuilder: (context, index) {
                      User user = users[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: UserWidget(
                          user: user,
                        ),
                      );
                    },
                  );
                })),
      ),
    );
  }
}
