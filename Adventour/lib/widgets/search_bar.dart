library flutter_google_places.src;

import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    @required this.size,
    @required this.scaffoldKey,
    @required this.mapController,
    @required this.addMarker,
    @required this.position,
  });

  final Size size;
  GlobalKey<ScaffoldState> scaffoldKey;
  GoogleMapController mapController;
  Function(Marker) addMarker;
  Position position;

  SearchEngine _searchEngine = SearchEngine();

  @override
  Widget build(BuildContext context) {
    return PlacesAutocompleteWidget(
      apiKey: _searchEngine.placesApiKey,
      logo: null,
      scaffoldKey: scaffoldKey,
      location: Location(position.latitude,position.longitude),
      radius: 100,
      onSubmitted: (value) async {
        List<Place> places = await _searchEngine.searchByText(
            value, position.latitude,position.longitude, 1000);
        if (places.length == 1) {
          Place place = places.first;
          goToPlace(place);
        }
        if (places.length > 1) {
          mapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
              bearing: 0,
              target: LatLng(position.latitude,position.longitude),
              zoom: 8,
            ),
          ));
        }
      },
      onTapPrediction: (prediction) async {
        Place place = (await _searchEngine.searchByText(
                prediction.description, position.latitude,position.longitude, 1000))
            .first;
        goToPlace(place);
      },
    );
  }

  void goToPlace(Place place) {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(place.latitude, place.longitude),
        zoom: 18.0,
      ),
    ));
    final MarkerId markerId = MarkerId('searchBar');
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(place.latitude, place.longitude),
      infoWindow: InfoWindow(title: markerId.toString(), snippet: '*'),
      onTap: () {
        // _onMarkerTapped(markerId);
      },
    );
    addMarker(marker);
  }
}

class PlacesAutocompleteWidget extends StatefulWidget {
  final String apiKey;
  final String startText;
  final String hint;
  final BorderRadius overlayBorderRadius;
  final Location location;
  final num offset;
  final num radius;
  final String language;
  final String sessionToken;
  final List<String> types;
  final List<Component> components;
  final bool strictbounds;
  final String region;
  final Widget logo;
  final ValueChanged<PlacesAutocompleteResponse> onError;
  final int debounce;

  /// optional - sets 'proxy' value in google_maps_webservice
  ///
  /// In case of using a proxy the baseUrl can be set.
  /// The apiKey is not required in case the proxy sets it.
  /// (Not storing the apiKey in the app is good practice)
  final String proxyBaseUrl;

  /// optional - set 'client' value in google_maps_webservice
  ///
  /// In case of using a proxy url that requires authentication
  /// or custom configuration
  final BaseClient httpClient;

  GlobalKey<ScaffoldState> scaffoldKey;

  Function(String) onSubmitted;

  Function onTapTextField;

  FocusNode focusNode = FocusNode();

  Function(Prediction) onTapPrediction;

  PlacesAutocompleteWidget(
      {@required this.apiKey,
      this.hint = "Search",
      this.overlayBorderRadius,
      this.offset,
      this.location,
      this.radius,
      this.language,
      this.sessionToken,
      this.types,
      this.components,
      this.strictbounds,
      this.region,
      this.logo,
      this.onError,
      Key key,
      this.proxyBaseUrl,
      this.httpClient,
      @required this.scaffoldKey,
      @required this.onSubmitted,
      this.onTapTextField,
      this.startText,
      this.onTapPrediction,
      this.debounce = 300})
      : super(key: key);

  @override
  State<PlacesAutocompleteWidget> createState() {
    return _PlacesAutocompleteOverlayState();
  }

  static PlacesAutocompleteState of(BuildContext context) =>
      context.ancestorStateOfType(const TypeMatcher<PlacesAutocompleteState>());
}

class _PlacesAutocompleteOverlayState extends PlacesAutocompleteState {
  @override
  void dispose() {
    widget.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final headerTopLeftBorderRadius = widget.overlayBorderRadius != null
        ? widget.overlayBorderRadius.topLeft
        : Radius.circular(2);

    final headerTopRightBorderRadius = widget.overlayBorderRadius != null
        ? widget.overlayBorderRadius.topRight
        : Radius.circular(2);

    final header = Column(children: <Widget>[
      Material(
          color: theme.dialogBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: headerTopLeftBorderRadius,
              topRight: headerTopRightBorderRadius),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                color: Theme.of(context).primaryColor,
                icon: Icon(Icons.menu),
                onPressed: () {
                  widget.focusNode.unfocus();
                  widget.scaffoldKey.currentState.openDrawer();
                },
              ),
              Expanded(
                  child: Padding(
                child: _textField(context),
                padding: const EdgeInsets.only(right: 8.0),
              )),
            ],
          )),
    ]);

    Widget body;

    final bodyBottomLeftBorderRadius = widget.overlayBorderRadius != null
        ? widget.overlayBorderRadius.bottomLeft
        : Radius.circular(2);

    final bodyBottomRightBorderRadius = widget.overlayBorderRadius != null
        ? widget.overlayBorderRadius.bottomRight
        : Radius.circular(2);
    if (_searching) {
      body = Stack(
        children: <Widget>[_Loader()],
        alignment: FractionalOffset.bottomCenter,
      );
    } else if (_queryTextController.text.isEmpty ||
        _response == null ||
        _response.predictions.isEmpty) {
      body = Material(
        color: theme.dialogBackgroundColor,
        child: widget.logo,
        borderRadius: BorderRadius.only(
          bottomLeft: bodyBottomLeftBorderRadius,
          bottomRight: bodyBottomRightBorderRadius,
        ),
      );
    } else {
      body = SingleChildScrollView(
        child: Material(
          borderRadius: BorderRadius.only(
            bottomLeft: bodyBottomLeftBorderRadius,
            bottomRight: bodyBottomRightBorderRadius,
          ),
          color: theme.dialogBackgroundColor,
          child: ListBody(
            children: _response.predictions
                .map(
                  (p) => PredictionTile(
                      prediction: p,
                      onTap: (prediction) {
                        widget.onTapPrediction(prediction);
                        _queryTextController.clear();
                      }),
                )
                .toList(),
          ),
        ),
      );
    }

    final container = Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
        child: Stack(children: <Widget>[
          header,
          Padding(padding: EdgeInsets.only(top: 48.0), child: body),
        ]));

    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return Padding(padding: EdgeInsets.only(top: 8.0), child: container);
    }
    return container;
  }

  Icon get _iconBack => Theme.of(context).platform == TargetPlatform.iOS
      ? Icon(Icons.arrow_back_ios)
      : Icon(Icons.arrow_back);

  Widget _textField(BuildContext context) => TextField(
      controller: _queryTextController,
      focusNode: widget.focusNode,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black87
              : null,
          fontSize: 16.0),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black45
              : null,
          fontSize: 16.0,
        ),
        border: InputBorder.none,
        suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () => _queryTextController.clear()),
      ),
      onSubmitted: widget.onSubmitted,
      onTap: widget.onTapTextField);
}

class _Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxHeight: 2.0),
        child: LinearProgressIndicator());
  }
}

class PlacesAutocompleteResult extends StatefulWidget {
  final ValueChanged<Prediction> onTap;
  final Widget logo;

  PlacesAutocompleteResult({this.onTap, this.logo});

  @override
  _PlacesAutocompleteResult createState() => _PlacesAutocompleteResult();
}

class _PlacesAutocompleteResult extends State<PlacesAutocompleteResult> {
  @override
  Widget build(BuildContext context) {
    final state = PlacesAutocompleteWidget.of(context);
    assert(state != null);

    if (state._queryTextController.text.isEmpty ||
        state._response == null ||
        state._response.predictions.isEmpty) {
      final children = <Widget>[];
      if (state._searching) {
        children.add(_Loader());
      }
      children.add(widget.logo);
      return Stack(children: children);
    }
    return PredictionsListView(
      predictions: state._response.predictions,
      onTap: widget.onTap,
    );
  }
}

class AppBarPlacesAutoCompleteTextField extends StatefulWidget {
  final InputDecoration textDecoration;
  final TextStyle textStyle;

  AppBarPlacesAutoCompleteTextField(
      {Key key, this.textDecoration, this.textStyle})
      : super(key: key);

  @override
  _AppBarPlacesAutoCompleteTextFieldState createState() =>
      _AppBarPlacesAutoCompleteTextFieldState();
}

class _AppBarPlacesAutoCompleteTextFieldState
    extends State<AppBarPlacesAutoCompleteTextField> {
  @override
  Widget build(BuildContext context) {
    final state = PlacesAutocompleteWidget.of(context);
    assert(state != null);

    return Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(top: 4.0),
        child: TextField(
          controller: state._queryTextController,
          autofocus: true,
          style: widget.textStyle ?? _defaultStyle(),
          decoration:
              widget.textDecoration ?? _defaultDecoration(state.widget.hint),
        ));
  }

  InputDecoration _defaultDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white30
          : Colors.black38,
      hintStyle: TextStyle(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.black38
            : Colors.white30,
        fontSize: 16.0,
      ),
      border: InputBorder.none,
    );
  }

  TextStyle _defaultStyle() {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.black.withOpacity(0.9)
          : Colors.white.withOpacity(0.9),
      fontSize: 16.0,
    );
  }
}

class PredictionsListView extends StatelessWidget {
  final List<Prediction> predictions;
  final ValueChanged<Prediction> onTap;

  PredictionsListView({@required this.predictions, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: predictions
          .map((Prediction p) => PredictionTile(prediction: p, onTap: onTap))
          .toList(),
    );
  }
}

class PredictionTile extends StatelessWidget {
  final Prediction prediction;
  final ValueChanged<Prediction> onTap;

  PredictionTile({@required this.prediction, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(Icons.location_on),
        title: Text(prediction.description),
        onTap: () => onTap(prediction));
  }
}

enum Mode { overlay, fullscreen }

abstract class PlacesAutocompleteState extends State<PlacesAutocompleteWidget> {
  TextEditingController _queryTextController;
  PlacesAutocompleteResponse _response;
  GoogleMapsPlaces _places;
  bool _searching;
  Timer _debounce;

  final _queryBehavior = BehaviorSubject<String>.seeded('');

  @override
  void initState() {
    super.initState();
    _queryTextController = TextEditingController(text: widget.startText);

    _places = GoogleMapsPlaces(
        apiKey: widget.apiKey,
        baseUrl: widget.proxyBaseUrl,
        httpClient: widget.httpClient);
    _searching = false;

    _queryTextController.addListener(_onQueryChange);

    _queryBehavior.stream.listen(doSearch);
  }

  Future<Null> doSearch(String value) async {
    if (mounted && value.isNotEmpty) {
      setState(() {
        _searching = true;
      });

      final res = await _places.autocomplete(
        value,
        offset: widget.offset,
        location: widget.location,
        radius: widget.radius,
        language: widget.language,
        sessionToken: widget.sessionToken,
        types: widget.types,
        components: widget.components,
        strictbounds: widget.strictbounds,
        region: widget.region,
      );

      if (res.errorMessage?.isNotEmpty == true ||
          res.status == "REQUEST_DENIED") {
        onResponseError(res);
      } else {
        onResponse(res);
      }
    } else {
      onResponse(null);
    }
  }

  void _onQueryChange() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(Duration(milliseconds: widget.debounce), () {
      if (!_queryBehavior.isClosed) {
        _queryBehavior.add(_queryTextController.text);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _places.dispose();
    _debounce.cancel();
    _queryBehavior.close();
    _queryTextController.removeListener(_onQueryChange);
  }

  @mustCallSuper
  void onResponseError(PlacesAutocompleteResponse res) {
    if (!mounted) return;

    if (widget.onError != null) {
      widget.onError(res);
    }
    setState(() {
      _response = null;
      _searching = false;
    });
  }

  @mustCallSuper
  void onResponse(PlacesAutocompleteResponse res) {
    if (!mounted) return;

    setState(() {
      _response = res;
      _searching = false;
    });
  }
}

class PlacesAutocomplete {
  static Future<Prediction> show(
      {@required BuildContext context,
      @required String apiKey,
      Mode mode = Mode.fullscreen,
      String hint = "Search",
      BorderRadius overlayBorderRadius,
      num offset,
      Location location,
      num radius,
      String language,
      String sessionToken,
      List<String> types,
      List<Component> components,
      bool strictbounds,
      String region,
      Widget logo,
      ValueChanged<PlacesAutocompleteResponse> onError,
      String proxyBaseUrl,
      Client httpClient,
      GlobalKey<ScaffoldState> scaffoldKey,
      Function(String) onSubmitted,
      String startText = ""}) {
    final builder = (BuildContext ctx) => PlacesAutocompleteWidget(
          apiKey: apiKey,
          overlayBorderRadius: overlayBorderRadius,
          language: language,
          sessionToken: sessionToken,
          components: components,
          types: types,
          location: location,
          radius: radius,
          strictbounds: strictbounds,
          region: region,
          offset: offset,
          hint: hint,
          logo: logo,
          onError: onError,
          proxyBaseUrl: proxyBaseUrl,
          httpClient: httpClient,
          startText: startText,
          onSubmitted: onSubmitted,
          scaffoldKey: scaffoldKey,
        );

    if (mode == Mode.overlay) {
      return showDialog(context: context, builder: builder);
    }
    return Navigator.push(context, MaterialPageRoute(builder: builder));
  }
}
