// Copyright (c) 2018-2020 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:here_sdk/src/sdk/mapview/here_map_controller.dart';

/// Method called when the map is ready to be used.
typedef void HereMapCreatedCallback(HereMapController mapController);

/// Widget that displays a map. To interact with the map, use the
/// [HereMapController] object that is passed to [HereMapCreatedCallback]
class HereMap extends StatefulWidget {
  /// Creates a widget that displays a map.
  const HereMap({
    Key key,
    this.onMapCreated,
    this.gestureRecognizers,
  }) : super(key: key);

  /// Method called when the map is ready to be used.
  final HereMapCreatedCallback onMapCreated;

  /// Which gestures should be consumed by the map.
  ///
  /// It is possible for other gesture recognizers to be competing with the map on pointer
  /// events, e.g if the map is inside a [ListView] the [ListView] will want to handle
  /// vertical drags. The map will claim gestures that are recognized by any of the
  /// recognizers on this list.
  ///
  /// When this set is empty or null, the map will only handle pointer events for gestures that
  /// were not claimed by any other gesture recognizer.
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers;

  @override
  State<StatefulWidget> createState() => _HereMapState();
}

class _HereMapState extends State<HereMap> implements MapCameraObserver {
  HereMapController _mapController;
  List<WidgetPin> _pins = <WidgetPin>[];
  _MapOrientationChangeHandler _orientationHandler = _MapOrientationChangeHandler();

  @override
  void dispose() {
    _mapController?.camera?.removeObserver(this);
    _mapController?.finalize();
    super.dispose();
  }

  Widget build(BuildContext context) {
    _orientationHandler.handleOrientationChange(context, () => _updatePins());

    return NotificationListener<SizeChangedLayoutNotification>(
      child: Stack(
        children: <Widget>[
          _buildMap(context),
          ..._buildPins(context, _pins),
        ],
      ),
      onNotification: (SizeChangedLayoutNotification notification) {
        WidgetsBinding.instance.addPostFrameCallback(_renderAgain);
      },
    );
  }

  void onCameraUpdated(MapCameraState cameraState) {
    _updatePins();
  }

  Widget _buildMap(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'com.here.flutter/here_sdk',
        onPlatformViewCreated: _onPlatformViewCreated,
        gestureRecognizers: widget.gestureRecognizers,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'com.here.flutter/here_sdk',
        onPlatformViewCreated: _onPlatformViewCreated,
        gestureRecognizers: widget.gestureRecognizers,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    return Text('$defaultTargetPlatform is not yet supported by the plugin');
  }

  List<Widget> _buildPins(BuildContext context, List<WidgetPin> pins) {
    List<Widget> pinWidgets = pins.map((WidgetPin pin) => pin.makeWidget(context)).toList();
    pinWidgets.removeWhere((Widget widget) => widget == null);
    return pinWidgets;
  }

  void _onPlatformViewCreated(int id) async {
    _mapController = HereMapController(id);
    bool success = await _mapController.initialize(_handleMapEvent);
    _mapController.camera.addObserver(this);
    if (success && widget.onMapCreated != null) {
      widget.onMapCreated(_mapController);
    }
  }

  _updatePins() {
    final List<WidgetPin> newPins = _mapController.widgetPins.map((WidgetPin pin) {
      final Point2D point = _mapController.geoToViewCoordinates(pin.coordinates);
      pin.updateScreenPosition(point);
      return pin;
    }).toList();

    setState(() {
      _pins = newPins;
    });
  }

  _renderAgain(_) {
    // To place the pin correctly (taking into account anchor) we need to know its size. Size of a widget is not
    //  known until it is rendered first time so first render is offstage. Here we trigger re-render to actually
    //  show the pin after we know the size
    setState(() {
      _pins = _mapController.widgetPins;
    });
  }

  _handleMapEvent(HereMapEvent event) {
    switch (event) {
      case HereMapEvent.pinAdded:
        {
          _updatePins();
          WidgetsBinding.instance.addPostFrameCallback(_renderAgain);
          break;
        }
      case HereMapEvent.pinChanged:
      case HereMapEvent.pinRemoved:
        {
          _updatePins();
          break;
        }
    }
  }

  void release() {}
}

class _MapOrientationChangeHandler {
  static const Duration _refreshInterval = Duration(milliseconds: 200);
  static const int _refreshLimit = 5;

  Orientation _orientation;
  Timer _pinUpdateTimer;
  int _pinUpdateAttemptCount = 0;

  handleOrientationChange(BuildContext context, Function orientationChangeCallback) {
    final Orientation newOrientation = MediaQuery.of(context).orientation;
    if (_orientation != null && _orientation != newOrientation) {
      // This is a temporary solution until MapView provides a listener which notifies about MapView size change.
      // When orientation changes mapView is re-rendered to fit in new size. This means that pins have to be updated.
      //  However mapview does not notify us when its size changes. And Flutter's orientation/size notifications happen
      //  before the map is rendered so update based on Flutter's notifications will not work (we will get old values from geoToViewCoordinates)
      if (_pinUpdateTimer != null) {
        _pinUpdateTimer.cancel();
      }
      _pinUpdateAttemptCount = 0;
      _pinUpdateTimer = Timer.periodic(_refreshInterval, (Timer timer) {
        orientationChangeCallback();
        _pinUpdateAttemptCount += 1;
        if (_pinUpdateAttemptCount > _refreshLimit) {
          timer.cancel();
        }
      });
    }
    _orientation = newOrientation;
  }
}
