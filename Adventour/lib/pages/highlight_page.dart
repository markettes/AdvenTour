import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart';
import 'package:Adventour/widgets/route_tile.dart';
import 'package:flutter/material.dart';

class HighlightPage extends StatefulWidget {
  @override
  _HighlightPageState createState() => _HighlightPageState();
}

class _HighlightPageState extends State<HighlightPage> {
  TextEditingController _locationController = TextEditingController();
  Place place;
  String photo;

  @override
  Widget build(BuildContext context) {
    print('hola1');
    Map args = ModalRoute.of(context).settings.arguments;
    place = args['place'];
    photo = args['photo'];
    print('hola2');

    return Scaffold(
      appBar: AppBar(
        title: Text(place.name + ' highlights'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Image.network(
                photo,
              ),
            ),
            // RouteTile(exampleRoute),
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
                          Text('4h 31min'),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.directions_walk,
                            size: 20,
                          )
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
                          Text('5h 01min'),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.directions_car,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.directions_walk,
                            size: 20,
                          )
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
