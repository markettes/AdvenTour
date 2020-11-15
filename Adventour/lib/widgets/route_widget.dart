import 'package:Adventour/models/Route.dart' as r;
import 'package:flutter/material.dart';

class RouteWidget extends StatelessWidget {
  r.Route route;
  RouteWidget(this.route);

  Duration _duration = Duration();

  @override
  Widget build(BuildContext context) {
    for (var place in route.places) {
      _duration += place.duration;
    }
    for (var path in route.paths) {
      for (var stretch in path.stretchs) {
        _duration += stretch.duration;
      }
    }

    print('hola9');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {},
        leading: Container(
          width: 60,
          decoration: BoxDecoration(
              color: Colors.teal[100],
              shape: BoxShape.circle,
              image: route.image != null
                  ? DecorationImage(
                      image: NetworkImage(route.image), fit: BoxFit.fill)
                  : DecorationImage(
                      image: AssetImage('assets/interrogation.png'),
                      fit: BoxFit.fill)),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Nombre de la ruta'),
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
                  Text(
                    formatDuration(),
                  ),
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

  String formatDuration() {
    String hours, minutes;
    if (_duration.inHours < 10)
      hours = '0' + _duration.inHours.toString();
    else
      hours = _duration.inHours.toString();
    if (_duration.inMinutes.remainder(60) < 10)
      minutes = '0' + _duration.inMinutes.remainder(60).toString();
    else
      minutes = _duration.inMinutes.remainder(60).toString();
    return hours + ' h ' + minutes + ' min';
  }
}
