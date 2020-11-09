import 'package:Adventour/models/Place.dart';
import 'package:Adventour/pages/creating_route_page.dart';
import 'package:Adventour/pages/search_page.dart';
import 'package:Adventour/widgets/scroll_column_expandable.dart';
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
    Map args = ModalRoute.of(context).settings.arguments;
    place = args['place'];
    photo = args['photo'];

    return Scaffold(
      appBar: AppBar(
        title: Text(place.name + ' highlights'),
      ),
      body: SafeArea(
        child: ScrollColumnExpandable(
          children: [
            Container(
              child: Image.network(
                photo,
              ),
            )
          ],
        ),
      ),
    );
  }
}
