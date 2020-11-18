import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/controllers/geocoding.dart';
import 'package:Adventour/controllers/map_controller.dart';
import 'package:Adventour/controllers/route_engine.dart';
import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/models/Route.dart';
import 'package:Adventour/pages/search_page.dart';
import 'package:Adventour/widgets/circle_icon.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:Adventour/widgets/input_text.dart';
import 'package:Adventour/widgets/place_widget.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:Adventour/widgets/square_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:toast/toast.dart';

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  RouteEngineResponse routeEngineResponse;
  List<Place> recommendations;

  r.Route route;
  GlobalKey<ScaffoldState> _scaffoldKey;
  int _selectedPath = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    _scaffoldKey = GlobalKey<ScaffoldState>();

    if (arguments.length == 1) {
      routeEngineResponse = arguments['routeEngineResponse'];
      route = routeEngineResponse.route;
      recommendations = routeEngineResponse.recommendations;
    } else {
      route = arguments['myRoute'];
      routeEngineResponse = arguments['routeEngineResponse'];
      recommendations = routeEngineResponse.recommendations;
    }

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Custom route'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () => showDialog(
                context: context,
                builder: (context) {
                  TextEditingController _routeNameController =
                      TextEditingController();
                  final _formKey = GlobalKey<FormState>();
                  return Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        child: Column(
                          children: [
                            Text(
                              'Put a name to your route',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(fontSize: 20),
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    child: InputText(
                                      icon: Icons.flag,
                                      labelText: 'Route name',
                                      controller: _routeNameController,
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return 'Route name can\'t be empty';
                                        return null;
                                      },
                                    ),
                                  ),
                                  PrimaryButton(
                                    text: 'SAVE',
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        route.name = _routeNameController.text;
                                        route.author = db.currentUserId;
                                        route.images = route.places.map((place) => place.photos[0].photoReference).toList();
                                        db.addRoute(route);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            )
                            // PrimaryButton(
                            //   text: 'SAVE',
                            //   onPressed: () => Navigator.pop(context),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
        body: route.paths.isEmpty
            ? NotRouteAvailable()
            : TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  MapView(
                    places: route.places,
                    tabController: _tabController,
                    selectedPath: route.paths[_selectedPath],
                    nextTransport: nextTransport,
                  ),
                  MapListView(
                    path: route.paths[_selectedPath],
                    places: route.places,
                    tabController: _tabController,
                    onPressedAdd: _onPressedAdd,
                    removePlace: _removePlace,
                  )
                ],
              ));
  }

  Future _removePlace(Place place) async {
    if (route.places.length > 3) {
      route.removePlace(place);
      List<Path> paths = [];
      for (var transport in transports) {
        paths.add(await directionsEngine.makePath(
            route.start, route.places, transport));
      }
      route.paths = paths;
      _tabController.animateTo(0);
      setState(() {});
    } else
      Toast.show('The route needs at least 3 places', context, duration: 3);
  }

  Future _onTapPrediction(Prediction prediction) async {
    if (!route.places
        .map((place) => place.id)
        .toList()
        .contains(prediction.placeId)) {
      Place place = await searchEngine.searchWithDetails(prediction.placeId);
      await _addPlace(place);
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
      Toast.show('This place is already on the route', context, duration: 3);
    }
  }

  Future _addPlace(Place place) async {
    route.addPlace(place);
    List<Path> paths = [];
    for (var transport in transports) {
      paths.add(await directionsEngine.makePath(
          route.start, route.places, transport));
    }
    route.paths = paths;
    Navigator.pop(context);
    _tabController.animateTo(0);
    setState(() {});
  }

  Future _onPressedAdd() async {
    if (route.places.length < 8)
      await PlacesAutocomplete.show(
          context: context,
          onTapPrediction: _onTapPrediction,
          onSubmitted: (value) {},
          placeholder: ListView.separated(
            itemCount: recommendations.length,
            padding: EdgeInsets.only(top: 8),
            separatorBuilder: (context, index) => SizedBox(height: 8),
            itemBuilder: (context, index) {
              Place place = recommendations[index];
              Widget placeWidget = PlaceWidget(
                place: place,
                onTap: () async {
                  recommendations.remove(place);
                  _addPlace(place);
                },
              );
              if (index == 0)
                return Column(
                  children: [
                    Text(
                      'Maybe...',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(height: 8),
                    placeWidget
                  ],
                );
              return placeWidget;
            },
          ));
    else
      Toast.show('The route has at most 8 places', context, duration: 3);
  }

  void nextTransport() {
    if (_selectedPath == route.paths.length - 1)
      _selectedPath = 0;
    else
      _selectedPath++;
    setState(() {});
  }
}

class MapView extends StatefulWidget {
  MapView({
    @required this.places,
    this.selectedPath,
    this.nextTransport,
    @required TabController tabController,
  }) : tabController = tabController;

  List<Place> places;
  TabController tabController;
  r.Path selectedPath;
  Function nextTransport;

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with AutomaticKeepAliveClientMixin {
  MapController mapController = MapController();

  bool _listVisible = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
                widget.places.first.latitude, widget.places.first.longitude),
            zoom: 12.5,
          ),
          markers: Set<Marker>.of(mapController.markers.values),
          polylines: Set<Polyline>.of(mapController.polylines.values),
          onMapCreated: (googleMapController) =>
              mapController.onMapCreated(googleMapController, () async {
            drawPath(widget.selectedPath);
            for (var place in widget.places) {
              mapController.addMarker(place, context);
            }
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
        Align(
          alignment: Alignment.bottomRight,
          child: AnimatedOpacity(
            opacity: _listVisible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 600),
            curve: Curves.fastOutSlowIn,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SquareIconButton(
                icon: Icons.list,
                onPressed: () => widget.tabController.animateTo(1),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: AnimatedOpacity(
            opacity: _listVisible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 600),
            curve: Curves.fastOutSlowIn,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleIconButton(
                type: widget.selectedPath.transport,
                onPressed: widget.nextTransport,
              ),
            ),
          ),
        )
      ],
    );
  }

  void drawPath(r.Path path) {
    for (var stretch in path.stretchs) {
      Polyline polyline = Polyline(
          polylineId: PolylineId(stretch.id),
          points: stretch.points,
          color: Colors.blue,
          onTap: () => Toast.show(
              stretch.duration.inMinutes.toString(), context,
              duration: 3),
          consumeTapEvents: true,
          width: 4);
      mapController.drawPolyline(polyline);
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
  MapListView({
    @required this.path,
    @required this.places,
    @required this.removePlace,
    @required this.onPressedAdd,
    @required TabController tabController,
  }) : tabController = tabController;

  r.Path path;
  List<Place> places;
  TabController tabController;
  Function onPressedAdd;
  Function removePlace;
  Duration _duration;

  @override
  Widget build(BuildContext context) {
    _duration = path.duration(places
        .map((place) => place.duration)
        .reduce((value, element) => value + element));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.schedule,
                          size: 70,
                        ),
                        Text(
                          _formatDuration(),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.flag,
                          size: 50,
                        ),
                        Text(
                          'Start',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    ListView.separated(
                      itemCount: path.stretchs.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => SizedBox(height: 5),
                      itemBuilder: (context, index) {
                        var stretch = path.stretchs[index];
                        var place = places.firstWhere(
                            (place) => place.id == stretch.destinationId);
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
                                      child: CircleIcon(type: place.type)),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          place.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        Text(place.adress),
                                        Text(place.duration.inMinutes
                                                .toString() +
                                            ' min')
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              actions: <Widget>[
                                IconSlideAction(
                                  caption: 'Delete',
                                  color: Colors.transparent,
                                  icon: Icons.delete,
                                  foregroundColor:
                                      Theme.of(context).primaryColor,
                                  onTap: () => removePlace(place),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 100)
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SquareIconButton(
              icon: Icons.map,
              onPressed: () => tabController.animateTo(0),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: onPressedAdd,
                backgroundColor: Theme.of(context).primaryColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).buttonColor,
                  size: 30,
                ),
              ))
        ],
      ),
    );
  }

  String _formatDuration() {
    String hours, minutes;
    if (_duration.inHours < 10)
      hours = '0' + _duration.inHours.toString();
    else
      hours = _duration.inHours.toString();
    if (_duration.inMinutes.remainder(60) < 10)
      minutes = '0' + _duration.inMinutes.remainder(60).toString();
    else
      minutes = _duration.inMinutes.remainder(60).toString();
    return hours + ':' + minutes;
  }
}
