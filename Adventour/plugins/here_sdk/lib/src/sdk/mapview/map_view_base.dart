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

import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:here_sdk/src/sdk/gestures/gestures.dart';
import 'package:here_sdk/src/sdk/mapview/map_camera.dart';
import 'package:here_sdk/src/sdk/mapview/map_representable.dart';
import 'package:here_sdk/src/sdk/mapview/map_scene.dart';
import 'package:here_sdk/src/sdk/mapview/pick_map_items_result.dart';
import 'package:here_sdk/src/sdk/mapview/watermark_placement.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents the available public API from  MapView.
abstract class MapViewBase {
  MapViewBase() {}

  factory MapViewBase.fromLambdas({
    @required GeoCoordinates Function(Point2D) lambda_viewToGeoCoordinates,
    @required Point2D Function(GeoCoordinates) lambda_geoToViewCoordinates,
    @required void Function(WatermarkPlacement, int) lambda_setWatermarkPosition,
    @required void Function(MapRepresentable) lambda_addMapRepresentable,
    @required void Function(MapRepresentable) lambda_removeMapRepresentable,
    @required void Function(Point2D, double, MapViewBasePickMapItemsCallback) lambda_pickMapItems,
    @required MapCamera Function() lambda_camera_get,
    @required Gestures Function() lambda_gestures_get,
    @required MapScene Function() lambda_mapScene_get,
    @required double Function() lambda_pixelScale_get
  }) => MapViewBase$Lambdas(
    lambda_viewToGeoCoordinates,
    lambda_geoToViewCoordinates,
    lambda_setWatermarkPosition,
    lambda_addMapRepresentable,
    lambda_removeMapRepresentable,
    lambda_pickMapItems,
    lambda_camera_get,
    lambda_gestures_get,
    lambda_mapScene_get,
    lambda_pixelScale_get
  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Converts view coordinates to geographical coordinates.
  ///
  /// If the MapView does not have a rendered surface attached,
  /// it will return `null`. This happens before a map scene is loaded
  /// or after the map view has been destroyed.
  /// [viewCoordinates] Point on the screen to convert.
  /// Returns [GeoCoordinates]. The converted GeoCoordinate or `null` if there is no rendered
  /// surface attached.
  GeoCoordinates viewToGeoCoordinates(Point2D viewCoordinates);
  /// Converts geographical coordinates to view coordinates.
  ///
  /// View coordinates might be outside of current viewport, i.e. result might contain values
  /// less than zero or greater than view's dimensions. If the MapView does not have a rendered
  /// surface attached, it will return `null`. This happens before a map scene is loaded
  /// or after the map view has been destroyed.
  /// [geoCoordinates] Geographical coordinates to convert.
  /// Returns [Point2D]. The converted point on the map or `null` in cases described in
  /// the method description.
  Point2D geoToViewCoordinates(GeoCoordinates geoCoordinates);
  /// Sets the HERE logo watermark location within the map view.
  ///
  /// Defaults to [WatermarkPlacement.bottomRight].
  /// It is recommended to change the default placement only when it
  /// is required due to overlapping UI elements.
  /// The margin will only be applied if the placement is equal to
  /// [WatermarkPlacement.bottomCenter].
  /// If the map view is smaller then half of the total screen size
  /// either horizontally or vertically then the watermark remains in
  /// the default position (bottom right). For map views that are smaller
  /// then 250 dip in width and height the watermark will not be shown.
  /// [placement] Placement of HERE logo watermark. For more details please see
  /// [WatermarkPlacement].
  /// [bottomCenterMargin] An optional margin for the distance to the bottom measured in physical pixels.
  /// The value zero corresponds to the default margin. The margin will always be
  /// set to zero (default margin) if the placement is not equal to
  /// [WatermarkPlacement.bottomCenter].
  setWatermarkPosition(WatermarkPlacement placement, int bottomCenterMargin);
  /// Adds a MapRepresentable to this map view.
  ///
  /// Adding the same object multiple times has no effect.
  /// [mapRepresentable] An object implementing [MapRepresentable].
  addMapRepresentable(MapRepresentable mapRepresentable);
  /// Removes a MapRepresentable from this map view.
  ///
  /// Trying to remove an object that was not added or was removed before
  /// has no effect.
  /// [mapRepresentable] An object implementing [MapRepresentable].
  removeMapRepresentable(MapRepresentable mapRepresentable);
  /// Returns all map items located inside the specified pick area.
  ///
  /// The pick area is a circle
  /// defined by a center point and radius.
  /// [centerPoint] The center point of the pick area, in view coordinates.
  /// [radius] The radius of the pick area, in pixels.
  /// [callback] Callback to call with the result. This will be called on main thread when the operation
  /// has completed.
  pickMapItems(Point2D centerPoint, double radius, MapViewBasePickMapItemsCallback callback);
  /// Gets the camera to control the view for the map.
  MapCamera get camera;

  /// Gets the gestures control object.
  Gestures get gestures;

  /// Gets the map scene associated with this map view.
  MapScene get mapScene;

  /// Gets the pixel scale factor used by this MapView.
  ///
  /// It is used to support screen resolution and size independence.
  /// This value is a derivative of the device's screen pixel density
  ///
  /// .
  /// It can be used to translate between physical pixels and
  ///
  /// according to the formula:
  double get pixelScale;

}

/// Callback after pick map items operation has completed.
///
/// If the pick operation failed,
/// null will be returned.
typedef MapViewBasePickMapItemsCallback = void Function(PickMapItemsResult);

// MapViewBasePickMapItemsCallback "private" section, not exported.

final _sdk_mapview_MapViewBase_PickMapItemsCallback_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_copy_handle'));
final _sdk_mapview_MapViewBase_PickMapItemsCallback_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_release_handle'));
final _sdk_mapview_MapViewBase_PickMapItemsCallback_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_create_proxy'));
final _sdk_mapview_MapViewBase_PickMapItemsCallback_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_get_raw_pointer'));

class MapViewBasePickMapItemsCallback$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  MapViewBasePickMapItemsCallback$Impl(this.handle);

  void release() => _sdk_mapview_MapViewBase_PickMapItemsCallback_release_handle(handle);

  call(PickMapItemsResult p0) {
    final _call_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_call__PickMapItemsResult'));
    final _p0_handle = sdk_mapview_PickMapItemsResult_toFfi_nullable(p0);
    final _handle = this.handle;
    final __result_handle = _call_ffi(_handle, __lib.LibraryContext.isolateId, _p0_handle);
    sdk_mapview_PickMapItemsResult_releaseFfiHandle_nullable(_p0_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

}

int _MapViewBasePickMapItemsCallback_call_static(int _token, Pointer<Void> p0) {
  
  try {
    (__lib.instanceCache[_token] as MapViewBasePickMapItemsCallback)(sdk_mapview_PickMapItemsResult_fromFfi_nullable(p0));
  } finally {
    sdk_mapview_PickMapItemsResult_releaseFfiHandle_nullable(p0);
  }
  return 0;
}

Pointer<Void> sdk_mapview_MapViewBase_PickMapItemsCallback_toFfi(MapViewBasePickMapItemsCallback value) {
  final result = _sdk_mapview_MapViewBase_PickMapItemsCallback_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_MapViewBasePickMapItemsCallback_call_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_mapview_MapViewBase_PickMapItemsCallback_get_raw_pointer(result)] = value;

  return result;
}

MapViewBasePickMapItemsCallback sdk_mapview_MapViewBase_PickMapItemsCallback_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_sdk_mapview_MapViewBase_PickMapItemsCallback_get_raw_pointer(handle)] as MapViewBasePickMapItemsCallback;
  if (instance != null) return instance;
  final _impl = MapViewBasePickMapItemsCallback$Impl(_sdk_mapview_MapViewBase_PickMapItemsCallback_copy_handle(handle));
  return (PickMapItemsResult p0) {
    final _result =_impl.call(p0);
    _impl.release();
    return _result;
  };
}

void sdk_mapview_MapViewBase_PickMapItemsCallback_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapViewBase_PickMapItemsCallback_release_handle(handle);

// Nullable MapViewBasePickMapItemsCallback

final _sdk_mapview_MapViewBase_PickMapItemsCallback_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_create_handle_nullable'));
final _sdk_mapview_MapViewBase_PickMapItemsCallback_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_release_handle_nullable'));
final _sdk_mapview_MapViewBase_PickMapItemsCallback_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_PickMapItemsCallback_get_value_nullable'));

Pointer<Void> sdk_mapview_MapViewBase_PickMapItemsCallback_toFfi_nullable(MapViewBasePickMapItemsCallback value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_MapViewBase_PickMapItemsCallback_toFfi(value);
  final result = _sdk_mapview_MapViewBase_PickMapItemsCallback_create_handle_nullable(_handle);
  sdk_mapview_MapViewBase_PickMapItemsCallback_releaseFfiHandle(_handle);
  return result;
}

MapViewBasePickMapItemsCallback sdk_mapview_MapViewBase_PickMapItemsCallback_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_MapViewBase_PickMapItemsCallback_get_value_nullable(handle);
  final result = sdk_mapview_MapViewBase_PickMapItemsCallback_fromFfi(_handle);
  sdk_mapview_MapViewBase_PickMapItemsCallback_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_MapViewBase_PickMapItemsCallback_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapViewBase_PickMapItemsCallback_release_handle_nullable(handle);

// End of MapViewBasePickMapItemsCallback "private" section.

// MapViewBase "private" section, not exported.

final _sdk_mapview_MapViewBase_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_copy_handle'));
final _sdk_mapview_MapViewBase_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_release_handle'));
final _sdk_mapview_MapViewBase_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_mapview_MapViewBase_create_proxy'));
final _sdk_mapview_MapViewBase_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapViewBase_get_raw_pointer'));
final _sdk_mapview_MapViewBase_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewBase_get_type_id'));







class MapViewBase$Lambdas implements MapViewBase {
  GeoCoordinates Function(Point2D) lambda_viewToGeoCoordinates;
  Point2D Function(GeoCoordinates) lambda_geoToViewCoordinates;
  void Function(WatermarkPlacement, int) lambda_setWatermarkPosition;
  void Function(MapRepresentable) lambda_addMapRepresentable;
  void Function(MapRepresentable) lambda_removeMapRepresentable;
  void Function(Point2D, double, MapViewBasePickMapItemsCallback) lambda_pickMapItems;
  MapCamera Function() lambda_camera_get;
  Gestures Function() lambda_gestures_get;
  MapScene Function() lambda_mapScene_get;
  double Function() lambda_pixelScale_get;

  MapViewBase$Lambdas(
    GeoCoordinates Function(Point2D) lambda_viewToGeoCoordinates,
    Point2D Function(GeoCoordinates) lambda_geoToViewCoordinates,
    void Function(WatermarkPlacement, int) lambda_setWatermarkPosition,
    void Function(MapRepresentable) lambda_addMapRepresentable,
    void Function(MapRepresentable) lambda_removeMapRepresentable,
    void Function(Point2D, double, MapViewBasePickMapItemsCallback) lambda_pickMapItems,
    MapCamera Function() lambda_camera_get,
    Gestures Function() lambda_gestures_get,
    MapScene Function() lambda_mapScene_get,
    double Function() lambda_pixelScale_get
  ) {
    this.lambda_viewToGeoCoordinates = lambda_viewToGeoCoordinates;
    this.lambda_geoToViewCoordinates = lambda_geoToViewCoordinates;
    this.lambda_setWatermarkPosition = lambda_setWatermarkPosition;
    this.lambda_addMapRepresentable = lambda_addMapRepresentable;
    this.lambda_removeMapRepresentable = lambda_removeMapRepresentable;
    this.lambda_pickMapItems = lambda_pickMapItems;
    this.lambda_camera_get = lambda_camera_get;
    this.lambda_gestures_get = lambda_gestures_get;
    this.lambda_mapScene_get = lambda_mapScene_get;
    this.lambda_pixelScale_get = lambda_pixelScale_get;

  }

  @override
  void release() {}

  @override
  GeoCoordinates viewToGeoCoordinates(Point2D viewCoordinates) =>
    lambda_viewToGeoCoordinates(viewCoordinates);
  @override
  Point2D geoToViewCoordinates(GeoCoordinates geoCoordinates) =>
    lambda_geoToViewCoordinates(geoCoordinates);
  @override
  setWatermarkPosition(WatermarkPlacement placement, int bottomCenterMargin) =>
    lambda_setWatermarkPosition(placement, bottomCenterMargin);
  @override
  addMapRepresentable(MapRepresentable mapRepresentable) =>
    lambda_addMapRepresentable(mapRepresentable);
  @override
  removeMapRepresentable(MapRepresentable mapRepresentable) =>
    lambda_removeMapRepresentable(mapRepresentable);
  @override
  pickMapItems(Point2D centerPoint, double radius, MapViewBasePickMapItemsCallback callback) =>
    lambda_pickMapItems(centerPoint, radius, callback);
  @override
  MapCamera get camera => lambda_camera_get();
  @override
  Gestures get gestures => lambda_gestures_get();
  @override
  MapScene get mapScene => lambda_mapScene_get();
  @override
  double get pixelScale => lambda_pixelScale_get();
}

class MapViewBase$Impl implements MapViewBase {
  @protected
  Pointer<Void> handle;
  MapViewBase$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_MapViewBase_get_raw_pointer(handle));
    _sdk_mapview_MapViewBase_release_handle(handle);
    handle = null;
  }

  @override
  GeoCoordinates viewToGeoCoordinates(Point2D viewCoordinates) {
    final _viewToGeoCoordinates_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_viewToGeoCoordinates__Point2D'));
    final _viewCoordinates_handle = sdk_core_Point2D_toFfi(viewCoordinates);
    final _handle = this.handle;
    final __result_handle = _viewToGeoCoordinates_ffi(_handle, __lib.LibraryContext.isolateId, _viewCoordinates_handle);
    sdk_core_Point2D_releaseFfiHandle(_viewCoordinates_handle);
    try {
      return sdk_core_GeoCoordinates_fromFfi_nullable(__result_handle);
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  Point2D geoToViewCoordinates(GeoCoordinates geoCoordinates) {
    final _geoToViewCoordinates_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_geoToViewCoordinates__GeoCoordinates'));
    final _geoCoordinates_handle = sdk_core_GeoCoordinates_toFfi(geoCoordinates);
    final _handle = this.handle;
    final __result_handle = _geoToViewCoordinates_ffi(_handle, __lib.LibraryContext.isolateId, _geoCoordinates_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_geoCoordinates_handle);
    try {
      return sdk_core_Point2D_fromFfi_nullable(__result_handle);
    } finally {
      sdk_core_Point2D_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  setWatermarkPosition(WatermarkPlacement placement, int bottomCenterMargin) {
    final _setWatermarkPosition_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Uint32), void Function(Pointer<Void>, int, int, int)>('here_sdk_sdk_mapview_MapViewBase_setWatermarkPosition__WatermarkPlacement_UInt'));
    final _placement_handle = sdk_mapview_WatermarkPlacement_toFfi(placement);
    final _bottomCenterMargin_handle = (bottomCenterMargin);
    final _handle = this.handle;
    final __result_handle = _setWatermarkPosition_ffi(_handle, __lib.LibraryContext.isolateId, _placement_handle, _bottomCenterMargin_handle);
    sdk_mapview_WatermarkPlacement_releaseFfiHandle(_placement_handle);
    (_bottomCenterMargin_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  addMapRepresentable(MapRepresentable mapRepresentable) {
    final _addMapRepresentable_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_addMapRepresentable__MapRepresentable'));
    final _mapRepresentable_handle = sdk_mapview_MapRepresentable_toFfi(mapRepresentable);
    final _handle = this.handle;
    final __result_handle = _addMapRepresentable_ffi(_handle, __lib.LibraryContext.isolateId, _mapRepresentable_handle);
    sdk_mapview_MapRepresentable_releaseFfiHandle(_mapRepresentable_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  removeMapRepresentable(MapRepresentable mapRepresentable) {
    final _removeMapRepresentable_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_removeMapRepresentable__MapRepresentable'));
    final _mapRepresentable_handle = sdk_mapview_MapRepresentable_toFfi(mapRepresentable);
    final _handle = this.handle;
    final __result_handle = _removeMapRepresentable_ffi(_handle, __lib.LibraryContext.isolateId, _mapRepresentable_handle);
    sdk_mapview_MapRepresentable_releaseFfiHandle(_mapRepresentable_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  pickMapItems(Point2D centerPoint, double radius, MapViewBasePickMapItemsCallback callback) {
    final _pickMapItems_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Double, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewBase_pickMapItems__Point2D_Double_PickMapItemsCallback'));
    final _centerPoint_handle = sdk_core_Point2D_toFfi(centerPoint);
    final _radius_handle = (radius);
    final _callback_handle = sdk_mapview_MapViewBase_PickMapItemsCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _pickMapItems_ffi(_handle, __lib.LibraryContext.isolateId, _centerPoint_handle, _radius_handle, _callback_handle);
    sdk_core_Point2D_releaseFfiHandle(_centerPoint_handle);
    (_radius_handle);
    sdk_mapview_MapViewBase_PickMapItemsCallback_releaseFfiHandle(_callback_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  /// Gets the camera to control the view for the map.
  MapCamera get camera {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_camera_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_mapview_MapCamera_fromFfi(__result_handle);
    } finally {
      sdk_mapview_MapCamera_releaseFfiHandle(__result_handle);
    }
  }


  /// Gets the gestures control object.
  Gestures get gestures {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_gestures_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_gestures_Gestures_fromFfi(__result_handle);
    } finally {
      sdk_gestures_Gestures_releaseFfiHandle(__result_handle);
    }
  }


  /// Gets the map scene associated with this map view.
  MapScene get mapScene {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_mapScene_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_mapview_MapScene_fromFfi(__result_handle);
    } finally {
      sdk_mapview_MapScene_releaseFfiHandle(__result_handle);
    }
  }


  /// Gets the pixel scale factor used by this MapView.
  ///
  /// It is used to support screen resolution and size independence.
  /// This value is a derivative of the device's screen pixel density
  ///
  /// .
  /// It can be used to translate between physical pixels and
  ///
  /// according to the formula:
  double get pixelScale {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewBase_pixelScale_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }



}

int _MapViewBase_viewToGeoCoordinates_static(int _token, Pointer<Void> viewCoordinates, Pointer<Pointer<Void>> _result) {
  GeoCoordinates _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as MapViewBase).viewToGeoCoordinates(sdk_core_Point2D_fromFfi(viewCoordinates));
    _result.value = sdk_core_GeoCoordinates_toFfi_nullable(_result_object);
  } finally {
    sdk_core_Point2D_releaseFfiHandle(viewCoordinates);
  }
  return 0;
}
int _MapViewBase_geoToViewCoordinates_static(int _token, Pointer<Void> geoCoordinates, Pointer<Pointer<Void>> _result) {
  Point2D _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as MapViewBase).geoToViewCoordinates(sdk_core_GeoCoordinates_fromFfi(geoCoordinates));
    _result.value = sdk_core_Point2D_toFfi_nullable(_result_object);
  } finally {
    sdk_core_GeoCoordinates_releaseFfiHandle(geoCoordinates);
  }
  return 0;
}
int _MapViewBase_setWatermarkPosition_static(int _token, int placement, int bottomCenterMargin) {

  try {
    (__lib.instanceCache[_token] as MapViewBase).setWatermarkPosition(sdk_mapview_WatermarkPlacement_fromFfi(placement), (bottomCenterMargin));
  } finally {
    sdk_mapview_WatermarkPlacement_releaseFfiHandle(placement);
    (bottomCenterMargin);
  }
  return 0;
}
int _MapViewBase_addMapRepresentable_static(int _token, Pointer<Void> mapRepresentable) {

  try {
    (__lib.instanceCache[_token] as MapViewBase).addMapRepresentable(sdk_mapview_MapRepresentable_fromFfi(mapRepresentable));
  } finally {
    sdk_mapview_MapRepresentable_releaseFfiHandle(mapRepresentable);
  }
  return 0;
}
int _MapViewBase_removeMapRepresentable_static(int _token, Pointer<Void> mapRepresentable) {

  try {
    (__lib.instanceCache[_token] as MapViewBase).removeMapRepresentable(sdk_mapview_MapRepresentable_fromFfi(mapRepresentable));
  } finally {
    sdk_mapview_MapRepresentable_releaseFfiHandle(mapRepresentable);
  }
  return 0;
}
int _MapViewBase_pickMapItems_static(int _token, Pointer<Void> centerPoint, double radius, Pointer<Void> callback) {

  try {
    (__lib.instanceCache[_token] as MapViewBase).pickMapItems(sdk_core_Point2D_fromFfi(centerPoint), (radius), sdk_mapview_MapViewBase_PickMapItemsCallback_fromFfi(callback));
  } finally {
    sdk_core_Point2D_releaseFfiHandle(centerPoint);
    (radius);
    sdk_mapview_MapViewBase_PickMapItemsCallback_releaseFfiHandle(callback);
  }
  return 0;
}

int _MapViewBase_camera_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = sdk_mapview_MapCamera_toFfi((__lib.instanceCache[_token] as MapViewBase).camera);
  return 0;
}
int _MapViewBase_gestures_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = sdk_gestures_Gestures_toFfi((__lib.instanceCache[_token] as MapViewBase).gestures);
  return 0;
}
int _MapViewBase_mapScene_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = sdk_mapview_MapScene_toFfi((__lib.instanceCache[_token] as MapViewBase).mapScene);
  return 0;
}
int _MapViewBase_pixelScale_get_static(int _token, Pointer<Double> _result) {
  _result.value = ((__lib.instanceCache[_token] as MapViewBase).pixelScale);
  return 0;
}

Pointer<Void> sdk_mapview_MapViewBase_toFfi(MapViewBase value) {
  if (value is MapViewBase$Impl) return _sdk_mapview_MapViewBase_copy_handle(value.handle);

  final result = _sdk_mapview_MapViewBase_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_MapViewBase_viewToGeoCoordinates_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_MapViewBase_geoToViewCoordinates_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Uint32, Uint32)>(_MapViewBase_setWatermarkPosition_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_MapViewBase_addMapRepresentable_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_MapViewBase_removeMapRepresentable_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Double, Pointer<Void>)>(_MapViewBase_pickMapItems_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_MapViewBase_camera_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_MapViewBase_gestures_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_MapViewBase_mapScene_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Double>)>(_MapViewBase_pixelScale_get_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_mapview_MapViewBase_get_raw_pointer(result)] = value;

  return result;
}

MapViewBase sdk_mapview_MapViewBase_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_MapViewBase_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as MapViewBase;
  if (instance != null) return instance;

  final _type_id_handle = _sdk_mapview_MapViewBase_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_mapview_MapViewBase_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : MapViewBase$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_MapViewBase_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapViewBase_release_handle(handle);

Pointer<Void> sdk_mapview_MapViewBase_toFfi_nullable(MapViewBase value) =>
  value != null ? sdk_mapview_MapViewBase_toFfi(value) : Pointer<Void>.fromAddress(0);

MapViewBase sdk_mapview_MapViewBase_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapViewBase_fromFfi(handle) : null;

void sdk_mapview_MapViewBase_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapViewBase_release_handle(handle);

// End of MapViewBase "private" section.

