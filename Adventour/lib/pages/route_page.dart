import 'package:Adventour/controllers/geocoding.dart';
import 'package:Adventour/controllers/map_controller.dart';
import 'package:Adventour/controllers/route_engine.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/widgets/circle_icon.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:Adventour/widgets/square_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;
import 'package:flutter_slidable/flutter_slidable.dart';

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  r.Route route;
  Duration duration;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    route = arguments['route'];
    duration = route.duration(0);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Custom route'),
      ),
      body: route.paths.isEmpty
          ? NotRouteAvailable()
          : TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                MapView(
                    route: route,
                    tabController: _tabController,
                    scaffoldKey: _scaffoldKey),
                MapListView(
                    duration: duration,
                    route: route,
                    tabController: _tabController)
              ],
            ),
    );
  }
}

class MapView extends StatefulWidget {
  MapView(
      {@required this.route, @required this.tabController, this.scaffoldKey});

  r.Route route;
  TabController tabController;
  GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with AutomaticKeepAliveClientMixin {
  MapController mapController = MapController();

  bool _listVisible = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.route.places.first.latitude,
                widget.route.places.first.longitude),
            zoom: 12.5,
          ),
          markers: Set<Marker>.of(mapController.markers.values),
          polylines: Set<Polyline>.of(mapController.polylines.values),
          onMapCreated: (googleMapController) =>
              mapController.onMapCreated(googleMapController, () async {
            drawRoute(widget.route);
          }),
          onCameraMoveStarted: () {
            _listVisible = false;
            setState(() {});
          },
          onCameraIdle: () {
            _listVisible = true;
            setState(() {});
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
        ),
        AnimatedOpacity(
          // If the widget is visible, animate to 0.0 (invisible).
          // If the widget is hidden, animate to 1.0 (fully visible).
          opacity: _listVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 600),
          curve: Curves.fastOutSlowIn,
          // The green box must be a child of the AnimatedOpacity widget.
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SquareIconButton(
              icon: Icons.list,
              onPressed: () => widget.tabController.animateTo(1),
            ),
          ),
        ),
      ],
    );
  }

  void drawRoute(r.Route route) {
    for (var stretch in route.paths.first.stretchs) {
      Polyline polyline = Polyline(
          polylineId: PolylineId(stretch.id),
          points: stretch.points,
          color: Colors.blue,
          onTap: () {
            widget.scaffoldKey.currentState.showBottomSheet(
              (context) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  child: Text(stretch.duration.inMinutes.toString()),
                ),
              ),
              elevation: 20,
              backgroundColor: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            );
          },
          consumeTapEvents: true,
          width: 4);
      mapController.drawPolyline(polyline);
    }

    for (var place in route.places) {
      mapController.addMarker(place, context);
    }

    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;
}

class NotRouteAvailable extends StatelessWidget {
  const NotRouteAvailable({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Image.asset(
              'assets/logo_adventour.png',
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Text(
                'There is not route available',
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              PrimaryButton(
                text: 'EDIT LOCATION',
                icon: Icons.edit,
                style: ButtonType.Normal,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MapListView extends StatelessWidget {
  const MapListView({
    @required this.duration,
    @required this.route,
    @required TabController tabController,
  }) : _tabController = tabController;

  final Duration duration;
  final r.Route route;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Column(
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 70,
                          ),
                          Text(
                        duration.inHours.toString() +
                            ':' +
                            duration.inMinutes.remainder(60).toString(),
                        style: Theme.of(context).textTheme.headline2,
                      ),
                        ],
                      ),
                    
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.flag,size: 50,),
                        Text(
                          'Start',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    ListView.separated(
                      itemCount: route.paths.first.stretchs.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => SizedBox(height: 5),
                      itemBuilder: (context, index) {
                        var stretch = route.paths.first.stretchs[index];
                        var place = route.places[index];
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_downward, size: 40),
                                Text(stretch.duration.inMinutes.toString() +
                                    ' min'),
                              ],
                            ),
                            Slidable(
                              actionPane: SlidableDrawerActionPane(),
                              actionExtentRatio: 0.25,
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: 50,
                                      child:
                                          CircleIcon(image: place.icon)),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        place.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      Row(
                                        children: [
                                          Text(place.duration.inMinutes
                                                  .toString() +
                                              ' min'),
                                          SizedBox(width: 5),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              actions: <Widget>[
                                IconSlideAction(
                                  caption: 'Delete',
                                  color: Colors.transparent,
                                  icon: Icons.delete,
                                  foregroundColor: Theme.of(context).primaryColor,
                                  onTap: () => {},
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SquareIconButton(
              icon: Icons.map,
              onPressed: () => _tabController.animateTo(0),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/addPlacesPage');
              },
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(
                Icons.add,
                color: Theme.of(context).buttonColor,
                size: 30,
              ),
            ),
          ),
        )
      ],
    );
  }
}
