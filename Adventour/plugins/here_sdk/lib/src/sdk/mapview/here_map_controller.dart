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
import 'dart:ffi';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/gestures.dart';
import 'package:here_sdk/mapview.dart';
import 'package:here_sdk/src/sdk/mapview/map_context.dart';
import 'package:here_sdk/src/sdk/mapview/map_context_provider.dart';
import 'package:here_sdk/src/sdk/mapview/map_view_internal.dart';

enum HereMapEvent { pinAdded, pinChanged, pinRemoved }
typedef HereMapEventCallback = void Function(HereMapEvent event);

/// Allows interacting with the map displayed by [HereMap] widget.
class HereMapController implements MapViewBase {
  HereMapController(int id) {
    _channel = MethodChannel('com.here.flutter/here_sdk_$id');
  }

  /// Gets a list of currently added widget pins.
  List<WidgetPin> get widgetPins => _pins;

  List<WidgetPin> _pins = <WidgetPin>[];
  MapViewInternal _mapViewInternal;
  MethodChannel _channel;
  StreamController<HereMapEvent> _mapEventStream = StreamController<HereMapEvent>();

  static LanguageCode _savedLanguageCode = null;

  /// @nodoc
  Future<bool> initialize(HereMapEventCallback callback) async {
    final mapViewInternalAddress = await _channel.invokeMethod('initialize');
    if (mapViewInternalAddress == 0) {
      print('Platform failed to initialize MapView');
      return false;
    }

    final mapViewInternalPointer = Pointer.fromAddress(mapViewInternalAddress).cast<Void>();
    _mapViewInternal = sdk_mapview_MapViewInternal_fromFfi(mapViewInternalPointer);
    final bool success = (_mapViewInternal != null);
    if (success) {
      if (_savedLanguageCode != null) {
        HereMapController.primaryLanguage = _savedLanguageCode;
        _savedLanguageCode = null;
      }
      if (callback != null) {
        _mapEventStream.stream.listen(callback);
      }
    }
    return success;
  }

  /// @nodoc
  finalize() {
    _mapEventStream.close();
  }

  @override
  MapCamera get camera => _mapViewInternal?.camera;

  @override
  MapScene get mapScene => _mapViewInternal?.mapScene;

  @override
  Gestures get gestures => _mapViewInternal?.gestures;

  @override
  GeoCoordinates viewToGeoCoordinates(Point2D point) => _mapViewInternal?.viewToGeoCoordinates(point);

  @override
  Point2D geoToViewCoordinates(GeoCoordinates coords) => _mapViewInternal?.geoToViewCoordinates(coords);

  @override
  addMapRepresentable(MapRepresentable mapRepresentable) => _mapViewInternal?.addMapRepresentable(mapRepresentable);

  @override
  pickMapItems(Point2D centerPoint, double radius, callback) =>
      _mapViewInternal?.pickMapItems(centerPoint, radius, callback);

  @override
  double get pixelScale => _mapViewInternal?.pixelScale;

  @override
  removeMapRepresentable(MapRepresentable mapRepresentable) =>
      _mapViewInternal?.removeMapRepresentable(mapRepresentable);

  @override
  setWatermarkPosition(WatermarkPlacement placement, int bottomCenterMargin) =>
      _mapViewInternal?.setWatermarkPosition(placement, bottomCenterMargin);

  /// Pins a [Widget] to the MapView and returns a proxy object that can be used to
  /// control the pinning.
  ///
  /// @param widget Widget to pin
  /// @param coordinates GeoCoordinates to pin the widget at
  /// @param anchor The anchor point for the widget which specifies the position offset relative to the widget's coordinates.
  /// @returns [WidgetPin] proxy object
  WidgetPin pinWidget(Widget widget, GeoCoordinates coordinates, {Anchor2D anchor}) {
    final WidgetPin newPin = WidgetPin(
        child: widget,
        coordinates: coordinates,
        anchor: anchor,
        onChange: () {
          _mapEventStream.add(HereMapEvent.pinChanged);
        },
        onUnpin: () {
          unpinWidget(widget);
        });
    _pins.add(newPin);
    _mapEventStream.add(HereMapEvent.pinAdded);
    return newPin;
  }

  /// Removes a [WidgetPin] from the MapView by specifying the corresponding [Widget].
  /// Trying to unpin a view that was not pinned or was unpinned before has no effect.
  ///
  /// @param widget [Widget] corresponding to the [WidgetPin] to remove.
  unpinWidget(Widget widget) {
    final previousPinCount = _pins.length;
    _pins.removeWhere((WidgetPin pin) => pin.child == widget);
    if (_pins.length < previousPinCount) {
      _mapEventStream.add(HereMapEvent.pinRemoved);
    }
  }

  /// The code of desired primary map display language. If not set or if
  /// desired language is not supported, then the language of the displayed
  /// region is used, which is the default behaviour. Applies to all instances
  /// of [HereMap]. When changed, triggers redraw of any visible [HereMap].
  static LanguageCode get primaryLanguage {
    MapContext mapContext = MapContextProvider.internalgetInstance();
    if (mapContext == null) {
      return _savedLanguageCode;
    }
    return mapContext?.internalprimaryLanguage;
  }

  static void set primaryLanguage(LanguageCode languageCode) {
    MapContext mapContext = MapContextProvider.internalgetInstance();
    if (mapContext == null) {
      // TODO IOTSDK-5778
      // mapContext is null until first MapView is created so if user
      // changed primary language before that we need to save that
      // and apply this change when first MapView is created.
      // This can probably be removed once IOTSDK-5778 is resolved.
      _savedLanguageCode = languageCode;
    }
    mapContext?.internalprimaryLanguage = languageCode;
  }

  /// @nodoc
  @override
  void release() {}
}
