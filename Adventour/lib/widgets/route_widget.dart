import 'package:Adventour/models/Route.dart' as r;
import 'package:flutter/material.dart';

class RouteWidget extends StatelessWidget {
  final r.Route route;
  const RouteWidget(this.route);

  @override
  Widget build(BuildContext context) {
    print('hola3');
    print('hola4');
    int time = 0;
    print(route);
    for (var place in route.places) {
      print('hola5');
      time += place.duration.inHours;
    }
    for (var path in route.paths) {
      for (var stretch in path.stretchs) {
        time += stretch.duration.inHours;
      }
    }

    print(time);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {},
        leading: Container(
          width: 60,
          decoration: BoxDecoration(
            color: Colors.teal[100],
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(route.image), fit: BoxFit.fill),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(route.name),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.alarm,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  // Text(route.duration(0).inHours.toString() +
                  //     ' h' +
                  //     ' ' +
                  //     route.duration(0).toString().substring(2, 4) +
                  //     ' min'),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 20,
                ),
                Text(route.places.length.toString()),
                SizedBox(
                  width: 5,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
