import 'package:Adventour/controllers/geocoding.dart';
import 'package:Adventour/controllers/map_controller.dart';
import 'package:Adventour/controllers/route_engine.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/models/Path.dart' as p;
import 'package:Adventour/widgets/primary_button.dart';
import 'package:Adventour/widgets/square_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  r.Route route;

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
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SquareIconButton(
                        icon: Icons.map,
                        onPressed: () => _tabController.animateTo(0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
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
                        ],
                      ),
                    )
                  ],
                )
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
                      ),
                    ),
                elevation: 20,
                backgroundColor: Theme.of(context).backgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))));
          },
          consumeTapEvents: true,
          width: 10);
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
