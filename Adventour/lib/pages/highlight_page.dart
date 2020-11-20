import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/widgets/route_widget.dart';
import 'package:flutter/material.dart';

class HighlightPage extends StatelessWidget {
  Place place;

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    place = args['place'];
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name + ' highlights'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {},
                leading: Container(
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      shape: BoxShape.circle,
                    )),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Barrio del Carmen')],
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
                          Text('4 h 31 min'),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 20,
                        ),
                        Text('5'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.house_outlined,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.sports_bar,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.camera_alt,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.local_cafe,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.gavel,
                          size: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {},
                leading: Container(
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      shape: BoxShape.circle,
                    )),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Valencia beach'),
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
                          Text('5 h 01 min'),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 20,
                        ),
                        Text('7'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.local_library,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.location_city,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.theater_comedy,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.sports,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.museum,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.nightlife,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.local_mall,
                          size: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
