library flutter_google_places.src;

import 'dart:async';
import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

String apiKey = "AIzaSyAzLMUtt6ZleHHXpB2LUaEkTjGuT8PeYho";

class PlacesAutocompleteWidget extends StatefulWidget {
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

  Function(Prediction) onTapPrediction;

  Function(String) onSubmitted;

  PlacesAutocompleteWidget(
      {
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
      this.onError,
      Key key,
      this.proxyBaseUrl,
      this.httpClient,
      this.startText,
      @required this.onTapPrediction,
      @required this.onSubmitted,
      this.debounce = 300})
      : super(key: key);

  @override
  State<PlacesAutocompleteWidget> createState() {
    return _PlacesAutocompleteScaffoldState();
  }

  static PlacesAutocompleteState of(BuildContext context) =>
      context.ancestorStateOfType(const TypeMatcher<PlacesAutocompleteState>());
}

class _PlacesAutocompleteScaffoldState extends PlacesAutocompleteState {
  @override
  Widget build(BuildContext context) {
    final searchBar = AppBarPlacesAutoCompleteTextField();
    final body = PlacesAutocompleteResult(
      onTap: widget.onTapPrediction,
    );
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              searchBar,
              Expanded(child: body),
            ],
          ),
        ),
      ),
    );
  }
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

  PlacesAutocompleteResult({this.onTap});

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
          decoration: widget.textDecoration ?? _defaultDecoration(state),
          onSubmitted: state.widget.onSubmitted,
        ));
  }

  InputDecoration _defaultDecoration(PlacesAutocompleteState state) {
    return InputDecoration(
        hintText: state.widget.hint,
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
        prefixIcon: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => state._queryTextController.clear(),
        ));
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
      onTap: () {
        if (onTap != null) {
          onTap(prediction);
        }
      },
    );
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
        apiKey: apiKey,
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
      String hint = "Search",
      BorderRadius overlayBorderRadius,
      num offset,
      @required Location location,
      num radius,
      String language,
      String sessionToken,
      List<String> types,
      List<Component> components,
      bool strictbounds,
      String region,
      ValueChanged<PlacesAutocompleteResponse> onError,
      String proxyBaseUrl,
      Client httpClient,
      @required Function(Prediction) onTapPrediction,
      @required Function(String) onSubmitted,
      String startText = ""}) {
    final builder = (BuildContext ctx) => PlacesAutocompleteWidget(
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
          onError: onError,
          proxyBaseUrl: proxyBaseUrl,
          httpClient: httpClient,
          startText: startText,
          onTapPrediction: onTapPrediction,
          onSubmitted: onSubmitted,
        );

    return Navigator.push(context, MaterialPageRoute(builder: builder));
  }
}
