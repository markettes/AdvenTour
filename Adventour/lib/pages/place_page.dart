import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:Adventour/widgets/square_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/models/Place.dart';
import "package:google_maps_webservice/places.dart";

int numeroComentarios = 0;

class PlacePage extends StatelessWidget {
  Place place;

  @override
  Widget build(BuildContext context) {
    place = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: place.photos == null || place.photos.isEmpty
                ? Center(child: Text('Unknown'))
                : Image.network(
                    searchEngine.searchPhoto(place.photos.first.photoReference),
                    fit: BoxFit.cover,
                  ),
          ),
          InfoMiddle(place: place,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                place.adress != null
                    ? InfoBut(
                        icon: Icons.gps_fixed,
                        text: "${place.adress}")
                    : SizedBox(),
                place.telephone != null
                    ? InfoBut(
                        icon: Icons.local_phone,
                        text: "${place.telephone}")
                    : SizedBox(),
                place.openingHours != null
                    ? InfoBut(
                        icon: Icons.access_alarm_outlined,
                        text: "${itsOpen(place.openingHours.openNow)}")
                    : SizedBox(),
                place.openingHours != null
                    ? InfoBut(icon: Icons.calendar_today, text: openAndClose())
                    : SizedBox(),
                Divider(
                  thickness: 5,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
          InfoBottom(),
          CommentsBar(),
        ],
      ),
    );
  }

  bool itsDefined(String text) {
    if (text == null) {
      return false;
    } else {
      return true;
    }
  }

  String itsOpen(bool open) {
    if (open) {
      return "Open";
    } else {
      return "Closed";
    }
  }

  String openAndClose() {
    int dia;
    if (DateTime.now().weekday == 6) {
      dia = 0;
    } else {
      dia = DateTime.now().weekday;
    }
    if (place.openingHours.periods[dia].open.time.isEmpty) {
      return "null";
    } else {
      String numHorasAbierto =
          "${place.openingHours.periods[dia].open.time}";
      String horasAbierto = numHorasAbierto.substring(0, 2) +
          " : " +
          numHorasAbierto.substring(2, 4);
      String numHorasCerrado = "${place.openingHours.periods[dia].close.time}";
      String horasCerrado = numHorasCerrado.substring(0, 2) +
          " : " +
          numHorasCerrado.substring(2, 4);
      return horasAbierto + " - " + horasCerrado;
    }
  }
}

class InfoBut extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoBut({
    @required this.icon,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    if (this.text == null) {
      return Container(
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 35,
            ),
            Expanded(
              child: Text(
                "${this.text}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 35,
            ),
            Expanded(
              child: Text(
                "${this.text}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

class InfoMiddle extends StatelessWidget {
  Place place;
  InfoMiddle({this.place});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Theme.of(context).primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network(
                        place.icon,
                        color: Colors.white,
                        fit: BoxFit.contain,
                      ),
            ),
          ),
          Text(
            "4",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Icon(
            Icons.star,
            color: Theme.of(context).primaryColor,
            size: 45,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SquareIconButton(icon: Icons.map, onPressed: null),
            ],
          )),
        ],
      ),
    );
  }
}

class InfoSuper extends StatelessWidget {
  final PlaceDetails place;
  const InfoSuper({
    @required this.place,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      /*child: Image.network(
            "https://maps.googleapis.com/maps/api/place/photo?" + "${this.place.photos[0].photoReference}",
            fit: BoxFit.cover,
            ),*/
      //No consigue insertar la imagen.
    );
  }
}

class InfoBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        children: <Widget>[
          Text(
            numeroComentarios.toString() + " opiniones",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SquareIconButton(icon: Icons.add_comment, onPressed: () {}),
            ],
          )),
        ],
      ),
    );
  }
}

class CommentsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        itemCount: 1000,
        itemBuilder: (_, int index) => Text('hola'),
      ),
    );
  }
}
