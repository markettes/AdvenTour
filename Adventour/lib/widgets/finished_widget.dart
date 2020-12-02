import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/FinishedRoute.dart';
import 'package:Adventour/widgets/circle_icon.dart';
import 'package:flutter/material.dart';

class FinishedWidget extends StatefulWidget {
  FinishedRoute route;
  Function onTap;
  FinishedWidget({
    this.route,
    this.onTap,
  });

  @override
  _FinishedWidgetState createState() => _FinishedWidgetState();
}

class _FinishedWidgetState extends State<FinishedWidget> {
  List<String> _types = [];

  @override
  void initState() {
    _types = widget.route.types();
    super.initState();
  }

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
              backgroundImage: widget.route.images.isNotEmpty
                  ? NetworkImage(searchEngine.searchPhoto(widget.route.image))
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
                          text: widget.route.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              .copyWith(fontSize: 20),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' ' + widget.route.locationName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(fontSize: 15))
                          ]),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(formatDuration(widget.route.duration)),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.today,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(formatDate(widget.route.dateTime)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: _types.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(width: 2),
                      itemBuilder: (context, index) {
                        String type = _types[index];
                        return SizedBox(
                            width: 28,
                            child: CircleIcon(
                              type: type,
                              size: 16,
                              padding: EdgeInsets.all(4),
                            ));
                      },
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

  String formatDuration(Duration duration) {
    String hours, minutes;
    hours = duration.inHours.toString();
    if (duration.inMinutes.remainder(60) < 10)
      minutes = '0' + duration.inMinutes.remainder(60).toString();
    else
      minutes = duration.inMinutes.remainder(60).toString();
    return hours + ' h ' + minutes + ' min';
  }

  String formatDate(DateTime dateTime) {
    String day, month, year;
    day = dateTime.day.toString();
    month = dateTime.month.toString();
    year = dateTime.year.toString();
    return day + '/' + month + '/' + year.substring(2);
  }
}
