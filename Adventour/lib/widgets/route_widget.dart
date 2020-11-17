import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/widgets/circle_icon.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';

import 'place_types_list.dart';

class RouteWidget extends StatefulWidget {
  r.Route route;
  RouteWidget(this.route);

  @override
  _RouteWidgetState createState() => _RouteWidgetState();
}

class _RouteWidgetState extends State<RouteWidget> {
  int _selectedPath = 0;

  @override
  Widget build(BuildContext context) {
    for (var place in widget.route.places) {
      print('?'+place.type.toString());
    }
    return SizedBox(
      height: 90,
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: widget.route.image != null
                ? NetworkImage(widget.route.image)
                : AssetImage('assets/interrogation.png'),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.route.name ?? 'Nombre de la ruta',
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(fontSize: 20),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      formatDuration(widget.route.paths[_selectedPath].duration(
                          widget.route.places
                              .map((place) => place.duration)
                              .reduce((value, element) => value + element))),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    // CircleIconButton(type:widget.route.paths[_selectedPath].transport , onPressed: nextTransport)
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 20,
                      ),
                      Text(widget.route.places.length.toString()),
                      SizedBox(
                        width: 5,
                      ),
                      ListView.separated(
                        itemCount: widget.route.places.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          String type = widget.route.places[index].type;
                          return SizedBox(
                            width: 30,
                            child: CircleIcon(
                              type: type,
                              size: 18,
                              padding: EdgeInsets.all(4),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );

    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: widget.route.image != null
            ? NetworkImage(widget.route.image)
            : AssetImage('assets/interrogation.png'),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.route.name ?? 'Nombre de la ruta'),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.alarm,
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text('' // formatDuration(),
                  ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 20,
              ),
              Text(widget.route.places.length.toString()),
              SizedBox(
                width: 5,
              ),
            ],
          )
        ],
      ),
    );
  }

  void nextTransport() {
    if (_selectedPath == widget.route.paths.length - 1)
      _selectedPath = 0;
    else
      _selectedPath++;
    setState(() {});
  }

  String formatDuration(Duration duration) {
    String hours, minutes;
    if (duration.inHours < 10)
      hours = '0' + duration.inHours.toString();
    else
      hours = duration.inHours.toString();
    if (duration.inMinutes.remainder(60) < 10)
      minutes = '0' + duration.inMinutes.remainder(60).toString();
    else
      minutes = duration.inMinutes.remainder(60).toString();
    return hours + ' h ' + minutes + ' min';
  }
}
