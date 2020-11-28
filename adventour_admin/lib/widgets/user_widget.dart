import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/models/User.dart';
import 'package:Adventour/widgets/circle_icon.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/controllers/route_engine.dart';
import 'package:toast/toast.dart';

class UserWidget extends StatefulWidget {
  User user;
  Function onTap;
  UserWidget({
    this.user,
    this.onTap,
  });

  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        height: 75,
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: widget.user.image.isNotEmpty
                  ? NetworkImage(widget.user.image)
                  : null,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: widget.user.userName,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(fontSize: 20),
                        // children: <TextSpan>[
                        //   TextSpan(
                        //       text: ' ' + widget.route.locationName,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .bodyText2
                        //           .copyWith(fontSize: 15))
                        // ]
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.user.email,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        // CircleIconButton(type:widget.route.paths[_selectedPath].transport , onPressed: nextTransport)
                      ],
                    ),
                  ),
                  // Expanded(
                  //   child: ListView.separated(
                  //     itemCount: _types.length,
                  //     scrollDirection: Axis.horizontal,
                  //     shrinkWrap: true,
                  //     separatorBuilder: (context, index) => SizedBox(width: 2),
                  //     itemBuilder: (context, index) {
                  //       String type = _types[index];
                  //       return SizedBox(
                  //           width: 28,
                  //           child: CircleIcon(
                  //             type: type,
                  //             size: 16,
                  //             padding: EdgeInsets.all(4),
                  //           ));
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
            // if (widget.route.isRequested)
            //   IconButton(
            //     icon: Icon(Icons.upload_file),
            //     onPressed: () => Toast.show('Waiting for acceptance', context),
            //   ),
            // if (widget.route.isHighlight)
            //   Row(
            //     children: [
            //       Text(widget.route.likes.toString()),
            //       SizedBox(
            //         width: 5,
            //       ),
            //       Icon(Icons.favorite)
            //     ],
            //   ),
          ],
        ),
      ),
    );
  }

  // void nextTransport() {
  //   if (_selectedPath == widget.route.paths.length - 1)
  //     _selectedPath = 0;
  //   else
  //     _selectedPath++;
  //   setState(() {});
  // }

  // String formatDuration(Duration duration) {
  //   String hours, minutes;
  //   if (duration.inHours < 10)
  //     hours = '0' + duration.inHours.toString();
  //   else
  //     hours = duration.inHours.toString();
  //   if (duration.inMinutes.remainder(60) < 10)
  //     minutes = '0' + duration.inMinutes.remainder(60).toString();
  //   else
  //     minutes = duration.inMinutes.remainder(60).toString();
  //   return hours + ' h ' + minutes + ' min';
  // }
}
