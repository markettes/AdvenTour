import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/models/User.dart';
import 'package:Adventour/widgets/route_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class HighlightPage extends StatefulWidget {
  @override
  _HighlightPageState createState() => _HighlightPageState();
}

class _HighlightPageState extends State<HighlightPage> {
  Place place;

  CarouselController _carouselController = CarouselController();

  @override
  void dispose() {
    _carouselController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    place = args['place'];
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name + ' highlights'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 5),
                FutureBuilder(
                    future: searchEngine.searchWithDetails(place.id),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print('error');
                      if (!snapshot.hasData) return CircularProgressIndicator();
                      Place place = snapshot.data;
                      return Container(
                        height: 200,
                        child: place.photos == null || place.photos.isEmpty
                            ? Center(child: Text('No available photos'))
                            : CarouselSlider.builder(
                                itemCount: place.photos.length,
                                carouselController: _carouselController,
                                options: CarouselOptions(
                                  autoPlay: true,
                                  pauseAutoPlayOnManualNavigate: true,
                                  autoPlayInterval: Duration(seconds: 10),
                                  enableInfiniteScroll: place.photos.length > 1,
                                  aspectRatio: size.width / 200,
                                  enlargeCenterPage: true,
                                ),
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        Image.network(
                                  searchEngine.searchPhoto(
                                      place.photos[index].photoReference),
                                  fit: BoxFit.cover,
                                ),
                              ),
                      );
                    }),
                SizedBox(height: 5),
                StreamBuilder(
                  stream: db.getHighlights(place.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print('error');
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    List<r.Route> routes = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: routes.isNotEmpty
                          ? ListView.separated(
                              itemCount: routes.length,
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 5),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                r.Route route = routes[index];
                                return RouteWidget(
                                  route: route,
                                  onTap: () => showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        BottomSheetHighlight(route: route),
                                  ),
                                );
                              },
                            )
                          : Text('Empty highlights'),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetHighlight extends StatelessWidget {
  const BottomSheetHighlight({
    @required this.route,
  });

  final r.Route route;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      route.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontSize: 22),
                    ),
                    Text(route.locationName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontSize: 15))
                  ],
                ),
              ],
            ),
          ),
          FlatButton.icon(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/routePage',
                  arguments: {'route': route});
            },
            icon: Icon(
              Icons.visibility,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            label: Text(
              'Show',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          FlatButton.icon(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/navigationPage',
                  arguments: {'route': route});
            },
            icon: Icon(
              Icons.flag,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            label: Text(
              'Start',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:10),
            child: StreamBuilder(
              stream: db.getUser(route.author),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());
                User user = snapshot.data;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: user.image != null
                          ? NetworkImage(user.image)
                          : AssetImage('assets/empty_photo.jpg'),
                    ),
                    SizedBox(width: 5,),
                    Text(user.userName),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
