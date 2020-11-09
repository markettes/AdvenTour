import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/widgets/square_icon_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/libraries/place.dart';
import 'package:Adventour/pages/map_page.dart';

class PlacePage extends StatelessWidget {
  Place place;
  Function tapMap;

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    place = args['place'];
    tapMap = args['tapMap'];

    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
        actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
      ),
      body: place.detailed
          ? PlaceBodyInfo(place: place, tapMap: tapMap)
          : FutureBuilder(
              future: searchEngine.searchWithDetails(place.id),
              builder: (context, snapshot) {
                if (snapshot.hasError) print('error');
                if (!snapshot.hasData) return CircularProgressIndicator();
                Place place = snapshot.data;
                return PlaceBodyInfo(
                  place: place,
                  tapMap: tapMap,
                );
              },
            ),
    );
  }
}

class PlaceBodyInfo extends StatelessWidget {
  PlaceBodyInfo({@required this.place, @required this.tapMap});

  Place place;
  Function tapMap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
          child: Column(
        children: <Widget>[
          SizedBox(height: 5),
          Container(
              height: 200,
              child: place.photos == null || place.photos.isEmpty
                  ? Center(child: Text('No available photos'))
                  : CarouselSlider.builder(
                      itemCount: place.photos.length,
                      options: CarouselOptions(
                        autoPlay: true,
                        pauseAutoPlayOnManualNavigate: true,
                        autoPlayInterval: Duration(seconds: 10),
                        enableInfiniteScroll: place.photos.length > 1,
                        aspectRatio: size.width / 200,
                        enlargeCenterPage: true,
                      ),
                      itemBuilder: (BuildContext context, int index) =>
                          Image.network(
                        searchEngine
                            .searchPhoto(place.photos[index].photoReference),
                        fit: BoxFit.cover,
                      ),
                    )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              InfoMiddle(place: place, tapMap: tapMap),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    if (place.adress != null)
                      InfoBut(
                        icon: Icons.gps_fixed,
                        text: place.adress,
                      ),
                    if (place.telephone != null) SizedBox(height: 5),
                    if (place.telephone != null)
                      InfoBut(icon: Icons.local_phone, text: place.telephone),
                    if (place.openingHours != null) SizedBox(height: 5),
                    if (place.openingHours != null)
                      InfoBut(
                          icon: Icons.access_alarm_outlined,
                          text:
                              place.openingHours.openNow ? 'Opened' : 'Closed'),
                    if (place.openingHours != null) SizedBox(height: 5),
                    if (place.openingHours != null)
                      InfoBut(
                        icon: Icons.calendar_today,
                        text: openAndClose(),
                      ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Theme.of(context).primaryColor,
                indent: 50,
                endIndent: 50,
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Text(
                    (place.reviews != null
                            ? place.reviews.length.toString()
                            : '0') +
                        " opinions",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  
                  // Expanded(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       IconButton(
                  //         icon: Icon(
                  //           Icons.add_comment,
                  //           size: 35,
                  //         ),
                  //         onPressed: () {},
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 5),
              if (place.reviews != null) SizedBox(height: 5),
              if (place.reviews != null)
                ListView.separated(
                  itemCount: place.reviews.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 12,
                  ),
                  itemBuilder: (_, int index) {
                    Review review = place.reviews[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              child: Image.network(review.profilePhotoUrl),
                            ),
                            Row(
                              children: [
                                Text(review.rating.toString()),
                                Icon(
                                  Icons.star,
                                  color: Theme.of(context).primaryColor,
                                  size: 20,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(review.text),
                              SizedBox(
                                height: 3,
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(review.relativeTimeDescription)),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              SizedBox(height: 5)
            ]),
          ),
        ],
      ))
    ]);
  }

  String openAndClose() {
    int dia;
    if (DateTime.now().weekday == 7) {
      dia = 0;
    } else {
      dia = DateTime.now().weekday;
    }
    if (place.openingHours.periods[dia].open.time.isEmpty) {
      return "null";
    } else {
      String numHorasAbierto = "${place.openingHours.periods[dia].open.time}";
      String horasAbierto = numHorasAbierto.substring(0, 2) +
          ":" +
          numHorasAbierto.substring(2, 4);
      String numHorasCerrado = "${place.openingHours.periods[dia].close.time}";
      String horasCerrado = numHorasCerrado.substring(0, 2) +
          ":" +
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
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: 35,
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            this.text,
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

class InfoMiddle extends StatelessWidget {
  Place place;
  Function tapMap;

  InfoMiddle({
    this.place,
    this.tapMap,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (place.icon != null)
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Theme.of(context).primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.network(
                place.icon,
                color: Colors.white,
                fit: BoxFit.contain,
              ),
            ),
          ),
        if (place.rating != null)
          SizedBox(
            width: 15,
          ),
        if (place.rating != null)
          Icon(
            Icons.star,
            color: Theme.of(context).primaryColor,
            size: 45,
          ),
        if (place.rating != null)
          Text(
            place.rating.toString(),
            style: Theme.of(context).textTheme.bodyText1,
          ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SquareIconButton(
              icon: Icons.map,
              onPressed: () {
                Navigator.pop(context);
                tapMap();
              },
            ),
          ],
        )),
      ],
    );
  }
}
