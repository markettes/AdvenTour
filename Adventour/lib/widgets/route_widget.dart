import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/widgets/circle_icon.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/controllers/route_engine.dart';
import 'package:toast/toast.dart';

import 'place_types_list.dart';

class RouteWidget extends StatelessWidget {
  r.Route route;
  Function onTap;
  bool showCity;
  RouteWidget({
    this.route,
    this.onTap,
    this.showCity = true
  });

  int _selectedPath = 0;
  List<String> _types = [];



  @override
  Widget build(BuildContext context) {
    _types = route.types();
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 75,
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: route.images.isNotEmpty
                  ? NetworkImage(searchEngine.searchPhoto(route.image))
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
                          text: route.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              .copyWith(fontSize: 20),
                          children: <TextSpan>[
                            if(showCity)
                            TextSpan(
                                text: ' ' + route.locationName,
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
                        Text(
                          formatDuration(route.paths[_selectedPath]
                              .duration(route.places
                                  .map((place) => place.duration)
                                  .reduce(
                                      (value, element) => value + element))),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        // CircleIconButton(type:route.paths[_selectedPath].transport , onPressed: nextTransport)
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
            if (route.isPublic)
              Padding(
                padding: const EdgeInsets.only(right:8),
                child: Row(
                  children: [
                    Text(route.likes.length.toString(),style:Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 16)),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: 30,
                      child: IconButton(
                          icon: Icon(
                            route.author == db.currentUserId ||
                                    route.likes.contains(db.currentUserId)
                                ? Icons.favorite
                                : Icons.favorite_border,
                                size: 30,
                          ),
                          disabledColor: Theme.of(context).primaryColor,
                          onPressed: route.author == db.currentUserId
                              ? null
                              : () {
                                  bool contains = route.likes
                                      .contains(db.currentUserId);
                                      if(contains){
                                        route.likes
                                          .remove(db.currentUserId);
                                          db.unlikeRoute(route.author);
                                      } else {
                                        route.likes.add(db.currentUserId);
                                        db.likeRoute(route.author);
                                      } 
                                  db.updateRoute(route);
                                }),
                    )
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
