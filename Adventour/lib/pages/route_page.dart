import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/controllers/geocoding.dart';
import 'package:Adventour/controllers/map_controller.dart';
import 'package:Adventour/controllers/polyline_engine.dart';
import 'package:Adventour/controllers/route_engine.dart';
import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:Adventour/models/Route.dart';
import 'package:Adventour/models/User.dart';
import 'package:Adventour/pages/search_page.dart';
import 'package:Adventour/widgets/circle_icon.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:Adventour/widgets/input_text.dart';
import 'package:Adventour/widgets/place_types_list.dart';
import 'package:Adventour/widgets/place_widget.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:Adventour/widgets/square_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:google_maps_webservice/src/core.dart';
import 'package:toast/toast.dart';

import '../app_localizations.dart';

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

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

    route = arguments['route'];

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(route == null || route.name == null
              ? AppLocalizations.of(context).translate('custom_route')
              : route.name),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () => saveDialog(context),
            )
          ],
        ),
        body: route == null
            ? NotRouteAvailable()
            : TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  MapView(
                    places: route.places,
                    tabController: _tabController,
                    start: route.start,
                    nextTransport: nextTransport,
                    selectedPath: route.paths[_selectedPath],
                    route: route,
                  ),
                  MapListView(
                      path: route.paths[_selectedPath],
                      places: route.places,
                      tabController: _tabController,
                      onPressedAdd: _onPressedAdd,
                      removePlace: _removePlace,
                      refresh: () {
                        setState(() {});
                      })
                ],
              ));
  }

  Future saveDialog(BuildContext context) {
    if (route.name != null) {
      bool oldAuthor = route.author == db.currentUserId;
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              oldAuthor
                  ? AppLocalizations.of(context).translate('are_you_sure')
                  : AppLocalizations.of(context).translate('would_you_like'),
              style:
                  Theme.of(context).textTheme.headline2.copyWith(fontSize: 20),
            ),
            actions: [
              FlatButton(
                child: Text(
                  AppLocalizations.of(context).translate('cancel'),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text(
                  AppLocalizations.of(context).translate('save'),
                ),
                onPressed: () {
                  if (oldAuthor) {
                    db.updateRoute(route);
                    db.editeRoute(db.currentUserId);
                  } else {
                    route.author = db.currentUserId;
                    db.addRoute(route);
                  }

                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    } else
      return showDialog(
        context: context,
        builder: (context) {
          TextEditingController _routeNameController = TextEditingController();
          final _formKey = GlobalKey<FormState>();
          return AlertDialog(
            title: Text(
              AppLocalizations.of(context)
                  .translate('put_a_name_to_your_route'),
              style:
                  Theme.of(context).textTheme.headline2.copyWith(fontSize: 20),
            ),
            content: Container(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      key: _formKey,
                      child: InputText(
                        icon: Icons.flag,
                        labelText: AppLocalizations.of(context)
                            .translate('route_name'),
                        controller: _routeNameController,
                        maxLength: 20,
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Route name can\'t be empty';
                          return null;
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              FlatButton(
                child: Text(
                  AppLocalizations.of(context).translate('cancel'),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text(
                  AppLocalizations.of(context).translate('save'),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    route.name = _routeNameController.text;
                    route.author = db.currentUserId;
                    route.images = route.places
                        .map((place) => place.photos[0].photoReference)
                        .toList();

                    db.addRoute(route);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                },
              )
            ],
          );
        },
      );
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
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
      Toast.show('The route needs at least 3 places', context, duration: 3);
    }
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
      Toast.show(
          AppLocalizations.of(context).translate('already_route'), context,
          duration: 3);
    }
  }

  Future _addPlace(Place place) async {
    if (Geolocator.distanceBetween(place.latitude, place.longitude,
            route.start.latitude, route.start.longitude) <
        20000) {
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
    } else
      Toast.show('Away place, please select closer places', context);
  }

  Future _onPressedAdd() async {
    List<String> preTypePlaces = [];
    for (var place in route.places) {
      if (!preTypePlaces.contains(place.type)) preTypePlaces.add(place.type);
    }
    if (route.places.length < 8)
      await PlacesAutocomplete.show(
        context: context,
        onTapPrediction: _onTapPrediction,
        onSubmitted: (value) {},
        placeholder: RecommendationsWidget(
          addPlace: _addPlace,
          preTypePlaces: preTypePlaces,
          location: Location(route.start.latitude, route.start.longitude),
          places: route.places,
        ),
      );
    else
      Toast.show(AppLocalizations.of(context).translate('route_most'), context,
          duration: 3);
  }

  void _changeDuration(Place place, Duration duration) {
    place.duration = duration;
    setState(() {});
  }

  void nextTransport() {
    if (_selectedPath == route.paths.length - 1)
      _selectedPath = 0;
    else
      _selectedPath++;
    setState(() {});
  }
}

class RecommendationsWidget extends StatefulWidget {
  RecommendationsWidget(
      {@required this.addPlace,
      @required this.preTypePlaces,
      @required this.location,
      @required this.places});

  Function addPlace;
  List<String> preTypePlaces;
  Location location;
  List<Place> places;

  @override
  _RecommendationsWidgetState createState() => _RecommendationsWidgetState();
}

class _RecommendationsWidgetState extends State<RecommendationsWidget> {
  List<String> _placeTypes;

  List<Place> _recommendations = [];

  @override
  void initState() {
    _placeTypes = widget.preTypePlaces;
    sortPlaceTypes(_placeTypes);
    initRecommendations();

    super.initState();
  }

  void initRecommendations() async {
    for (var type in _placeTypes) {
      _recommendations.addAll(await _getRecommendations(type));
      _recommendations.sort((a, b) => b.rating.compareTo(a.rating));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: PlaceTypesList(
            onTap: _onTapPlaceType,
            selectedTypes: _placeTypes,
          ),
        ),
        _recommendations.isEmpty
            ? CircularProgressIndicator()
            : Expanded(
                child: ListView.separated(
                  itemCount: _recommendations.length,
                  padding: EdgeInsets.only(top: 8),
                  separatorBuilder: (context, index) => SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    Place place = _recommendations[index];
                    Widget placeWidget = PlaceWidget(
                      place: place,
                      onTap: () async {
                        _recommendations.remove(place);
                        widget.addPlace(place);
                      },
                    );
                    if (index == 0)
                      return Column(
                        children: [
                          Text(
                            AppLocalizations.of(context).translate('maybe'),
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SizedBox(height: 8),
                          placeWidget
                        ],
                      );
                    return placeWidget;
                  },
                ),
              ),
      ],
    );
  }

  Future _onTapPlaceType(String placeType, bool activated) async {
    FocusScope.of(context).unfocus();
    if (activated) {
      if (_placeTypes.length > 1) {
        _placeTypes.remove(placeType);
        sortPlaceTypes(_placeTypes);
        _recommendations.removeWhere((place) => place.type == placeType);
        setState(() {});
      } else
        Toast.show(
            AppLocalizations.of(context).translate('search_needs'), context,
            duration: 3);
    } else {
      _placeTypes.add(placeType);
      sortPlaceTypes(_placeTypes);

      _recommendations.addAll(await _getRecommendations(placeType));
      _recommendations.sort((a, b) => b.rating.compareTo(a.rating));

      setState(() {});
    }
  }

  Future<List<Place>> _getRecommendations(String placeType) async {
    List<Place> recommendations = await searchEngine.searchByLocationWithType(
        placeType, widget.location, LONG_DISTANCE);
    for (var place in widget.places) {
      recommendations
          .removeWhere((recommendation) => recommendation.id == place.id);
    }
    if (recommendations.length == 0) return [];
    recommendations = recommendations
        .where((place) =>
            place.rating != null &&
            place.rating > 4 &&
            place.type != null &&
            place.type == placeType &&
            place.userRatingsTotal > 500)
        .toList();
    if (recommendations.length < 5) return recommendations;
    recommendations = recommendations.sublist(0, 5);
    return recommendations;
  }
}

class MapView extends StatefulWidget {
  MapView({
    @required this.selectedPath,
    @required this.start,
    @required this.places,
    this.nextTransport,
    this.route,
    @required TabController tabController,
  }) : tabController = tabController;

  List<Place> places;
  TabController tabController;
  r.Path selectedPath;
  LatLng start;
  Function nextTransport;
  r.Route route;

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with AutomaticKeepAliveClientMixin {
  MapController _mapController = MapController();
  List<LatLng> routeCoords = List();
  Polyline _polyline;

  drawPath() async {
    String transport = widget.selectedPath.transport;
    routeCoords.addAll(await polylineEngine.getPoints(
        widget.start,
        LatLng(widget.places.first.latitude, widget.places.first.longitude),
        transport));
    for (var i = 0; i < widget.places.length - 1; i++) {
      Place start = widget.places[i];
      Place end = widget.places[i + 1];
      routeCoords.addAll(await polylineEngine.getPoints(
          LatLng(start.latitude, start.longitude),
          LatLng(end.latitude, end.longitude),
          transport));
    }
    _polyline = Polyline(
        polylineId: PolylineId('Route'),
        points: routeCoords,
        color: Theme.of(context).primaryColor,
        width: 4);
    _mapController.drawPolyline(_polyline);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
                widget.places.first.latitude, widget.places.first.longitude),
            zoom: 13.5,
          ),
          markers: Set<Marker>.of(_mapController.markers.values),
          polylines: Set<Polyline>.of(_mapController.polylines.values),
          onMapCreated: (googleMapController) =>
              _mapController.onMapCreated(googleMapController, () async {
            await drawPath();
            _mapController.addStartMarker(widget.route.start, context);
            for (var place in widget.places) {
              _mapController.addPlaceMarker(place, context);
            }
            setState(() {});
          }),
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              child: Icon(
                Icons.list,
                size: 32,
                color: Colors.white,
              ),
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () => widget.tabController.animateTo(1),
            ),
          ),
        ),
        // floatingActionButton: AnimatedOpacity(
        //   // If the widget is visible, animate to 0.0 (invisible).
        //   // If the widget is hidden, animate to 1.0 (fully visible).
        //   opacity: _listVisible ? 1.0 : 0.0,
        //   duration: Duration(milliseconds: 600),
        //   curve: Curves.fastOutSlowIn,
        //   // The green box must be a child of the AnimatedOpacity widget.
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         FloatingActionButton(
        //           heroTag: 'edit',
        //           backgroundColor: Theme.of(context).primaryColor,
        //           onPressed: () => widget.tabController.animateTo(1),
        //           child: Icon(
        //             Icons.edit,
        //             color: Theme.of(context).buttonColor,
        //           ),
        //         ),
        //         SizedBox(height: 8),
        //         FloatingActionButton(
        //           heroTag: 'navigation',
        //           backgroundColor: Theme.of(context).primaryColor,
        //           onPressed: () {
        //             Navigator.pushNamed(context, '/navigationPage', arguments: {
        //               'route': widget.route,
        //               'polylines': polyline,
        //               'markers': markers,
        //             });
        //           },
        //           child: Icon(
        //             Icons.navigation,
        //             color: Theme.of(context).buttonColor,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleIconButton(
              type: widget.selectedPath.transport,
              onPressed: widget.nextTransport,
            ),
          ),
        )
      ],
    );
  }

  // void drawPath(r.Path path) {
  //   for (var stretch in path.stretchs) {
  //     Polyline polyline = Polyline(
  //         polylineId: PolylineId(stretch.id),
  //         points: stretch.points,
  //         color: Colors.blue,
  //         onTap: () => Toast.show(
  //             stretch.duration.inMinutes.toString(), context,
  //             duration: 3),
  //         consumeTapEvents: true,
  //         width: 4);
  //     _mapController.drawPolyline(polyline);
  //   }

  //   setState(() {});
  // }

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
                AppLocalizations.of(context).translate('no_route_available'),
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              PrimaryButton(
                text: AppLocalizations.of(context).translate('edit_location'),
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
    @required this.refresh,
  }) : tabController = tabController;

  r.Path path;
  List<Place> places;
  TabController tabController;
  Function onPressedAdd;
  Function removePlace;
  Function refresh;
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
                          AppLocalizations.of(context).translate('start'),
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
                            GestureDetector(
                              child: Slidable(
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
                                    onTap: () async {
                                      removePlace(place);
                                    },
                                  ),
                                ],
                              ),
                              onLongPress: () async {
                                Duration duration = await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return DurationDialog(
                                          duration: place.duration);
                                    });
                                if (duration != null) {
                                  place.duration = duration;
                                  refresh();
                                }
                              },
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

class DurationDialog extends StatefulWidget {
  DurationDialog({
    @required this.duration,
  });
  Duration duration;
  @override
  _DurationDialogState createState() => _DurationDialogState();
}

class _DurationDialogState extends State<DurationDialog> {
  Duration _duration;

  @override
  void initState() {
    _duration = widget.duration;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Change estimate place duration',
        style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 17),
      ),
      content: DurationPicker(
        duration: _duration,
        onChange: (duration) {
          if (duration < Duration(hours: 2)) {
            _duration = duration;
            setState(() {});
          }
        },
      ),
      actions: [
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('Save'),
          onPressed: () {
            Navigator.pop(context, _duration);
          },
        ),
      ],
    );
  }
}
