import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/models/User.dart';
import 'package:Adventour/widgets/circle_icon.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/controllers/route_engine.dart';
import 'package:toast/toast.dart';

class UserWidget extends StatelessWidget {
  User user;
  Function onTap;
  UserWidget({
    this.user,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 75,
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage:
                  user.image.isNotEmpty ? NetworkImage(user.image) : null,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      user.userName,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontSize: 20),
                    ),
                  ),
                  Expanded(child: Row(
                    children: [
                      Text(user.likes.toString()),
                      SizedBox(width: 5,),
                      Icon(Icons.favorite)
                    ],
                  )),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          user.email,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
