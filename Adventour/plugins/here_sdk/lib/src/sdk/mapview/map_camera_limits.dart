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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/mapview/harp_map_view.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Controls constraints on camera parameters.
abstract class MapCameraLimits {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Absolute minimum possible value of tilt angle.
  static final double minTilt = 0.0;

  /// Absolute maximum possible value of tilt angle.
  static final double maxTilt = 70.0;

  /// Absolute minimum possible value of zoom level.
  static final double minZoomLevel = 0.0;

  /// Absolute maximum possible value of zoom level.
  static final double maxZoomLevel = 22.0;

  /// Sets maximum tilt angle that can be set on the camera.
  ///
  /// If current camera tilt is larger then this value,
  /// it will immediately be changed to the maximum set here.
  /// This method will fail if the value being set is
  /// smaller than minimum set tilt, smaller than absolute minimum value allowed
  /// or larger than absolute maximum value allowed.
  /// [degreesFromNadir] Maximum tilt angle, in degrees from the nadir direction at the target point.
  setMaxTilt(double degreesFromNadir);
  /// Sets minimum tilt angle that can be set on the camera.
  ///
  /// If current camera tilt is smaller then this value,
  /// it will immediately be changed to the minimum set here.
  /// This method will fail if the value being set is
  /// larger than maximum set tilt, smaller than absolute minimum value allowed
  /// or larger than absolute maximum value allowed.
  /// [degreesFromNadir] Minimum tilt angle, in degrees from the nadir direction at the target point.
  setMinTilt(double degreesFromNadir);
  /// Sets maximum zoom level that can be set on the camera.
  ///
  /// If current camera zoom level is larger then this value,
  /// it will immediately be changed to the maximum set here.
  /// This method will fail if the value being set is
  /// smaller than minimum set zoom level, smaller than absolute minimum value allowed
  /// or larger than absolute maximum value allowed.
  /// [zoomLevel] The zoom level to set as maximum allowed value.
  setMaxZoomLevel(double zoomLevel);
  /// Sets minimum zoom level that can be set on the camera.
  ///
  /// If current camera zoom level is smaller then this value,
  /// it will immediately be changed to the minimum set here.
  /// This method will fail if the value being set is
  /// larger than maximum set zoom level, smaller than absolute minimum value allowed
  /// or larger than absolute maximum value allowed.
  /// [zoomLevel] The zoom level to set as minimum allowed value.
  setMinZoomLevel(double zoomLevel);

  /// @nodoc
  internalsetHarpMapview(HarpMapView mapview);
}

enum MapCameraLimitsErrorCode {
    /// Value is above absolute maximum allowed value.
    valueAboveAbsoluteMaximum,
    /// Value is below absolute minimum allowed value.
    valueBelowAbsoluteMinimum,
    /// The minimum value, if set, would be above the current maximum value.
    minimumAboveMaximum,
    /// The maximum value, if set, would be below the current minimum value.
    maximumBelowMinimum
}

// MapCameraLimitsErrorCode "private" section, not exported.

int sdk_mapview_MapCameraLimits_ErrorCode_toFfi(MapCameraLimitsErrorCode value) {
  switch (value) {
  case MapCameraLimitsErrorCode.valueAboveAbsoluteMaximum:
    return 1;
  break;
  case MapCameraLimitsErrorCode.valueBelowAbsoluteMinimum:
    return 2;
  break;
  case MapCameraLimitsErrorCode.minimumAboveMaximum:
    return 3;
  break;
  case MapCameraLimitsErrorCode.maximumBelowMinimum:
    return 4;
  break;
  default:
    throw StateError("Invalid enum value $value for MapCameraLimitsErrorCode enum.");
  }
}

MapCameraLimitsErrorCode sdk_mapview_MapCameraLimits_ErrorCode_fromFfi(int handle) {
  switch (handle) {
  case 1:
    return MapCameraLimitsErrorCode.valueAboveAbsoluteMaximum;
  break;
  case 2:
    return MapCameraLimitsErrorCode.valueBelowAbsoluteMinimum;
  break;
  case 3:
    return MapCameraLimitsErrorCode.minimumAboveMaximum;
  break;
  case 4:
    return MapCameraLimitsErrorCode.maximumBelowMinimum;
  break;
  default:
    throw StateError("Invalid numeric value $handle for MapCameraLimitsErrorCode enum.");
  }
}

void sdk_mapview_MapCameraLimits_ErrorCode_releaseFfiHandle(int handle) {}

final _sdk_mapview_MapCameraLimits_ErrorCode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapCameraLimits_ErrorCode_create_handle_nullable'));
final _sdk_mapview_MapCameraLimits_ErrorCode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_ErrorCode_release_handle_nullable'));
final _sdk_mapview_MapCameraLimits_ErrorCode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_ErrorCode_get_value_nullable'));

Pointer<Void> sdk_mapview_MapCameraLimits_ErrorCode_toFfi_nullable(MapCameraLimitsErrorCode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_MapCameraLimits_ErrorCode_toFfi(value);
  final result = _sdk_mapview_MapCameraLimits_ErrorCode_create_handle_nullable(_handle);
  sdk_mapview_MapCameraLimits_ErrorCode_releaseFfiHandle(_handle);
  return result;
}

MapCameraLimitsErrorCode sdk_mapview_MapCameraLimits_ErrorCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_MapCameraLimits_ErrorCode_get_value_nullable(handle);
  final result = sdk_mapview_MapCameraLimits_ErrorCode_fromFfi(_handle);
  sdk_mapview_MapCameraLimits_ErrorCode_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_MapCameraLimits_ErrorCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapCameraLimits_ErrorCode_release_handle_nullable(handle);

// End of MapCameraLimitsErrorCode "private" section.
class MapCameraLimitsMapCameraLimitsExceptionException implements Exception {
  final MapCameraLimitsErrorCode error;
  MapCameraLimitsMapCameraLimitsExceptionException(this.error);
}

// MapCameraLimits "private" section, not exported.

final _sdk_mapview_MapCameraLimits_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_copy_handle'));
final _sdk_mapview_MapCameraLimits_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_release_handle'));
final _sdk_mapview_MapCameraLimits_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapCameraLimits_get_raw_pointer'));

final _setMaxTilt_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMaxTilt__Double_return_release_handle'));
final _setMaxTilt_return_get_result = (Pointer) {};
final _setMaxTilt_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMaxTilt__Double_return_get_error'));
final _setMaxTilt_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMaxTilt__Double_return_has_error'));


final _setMinTilt_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMinTilt__Double_return_release_handle'));
final _setMinTilt_return_get_result = (Pointer) {};
final _setMinTilt_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMinTilt__Double_return_get_error'));
final _setMinTilt_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMinTilt__Double_return_has_error'));


final _setMaxZoomLevel_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMaxZoomLevel__Double_return_release_handle'));
final _setMaxZoomLevel_return_get_result = (Pointer) {};
final _setMaxZoomLevel_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMaxZoomLevel__Double_return_get_error'));
final _setMaxZoomLevel_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMaxZoomLevel__Double_return_has_error'));


final _setMinZoomLevel_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMinZoomLevel__Double_return_release_handle'));
final _setMinZoomLevel_return_get_result = (Pointer) {};
final _setMinZoomLevel_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMinZoomLevel__Double_return_get_error'));
final _setMinZoomLevel_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMinZoomLevel__Double_return_has_error'));



class MapCameraLimits$Impl implements MapCameraLimits {
  @protected
  Pointer<Void> handle;

  MapCameraLimits$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_MapCameraLimits_get_raw_pointer(handle));
    _sdk_mapview_MapCameraLimits_release_handle(handle);
    handle = null;
  }

  @override
  setMaxTilt(double degreesFromNadir) {
    final _setMaxTilt_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Double), Pointer<Void> Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapCameraLimits_setMaxTilt__Double'));
    final _degreesFromNadir_handle = (degreesFromNadir);
    final _handle = this.handle;
    final __call_result_handle = _setMaxTilt_ffi(_handle, __lib.LibraryContext.isolateId, _degreesFromNadir_handle);
    (_degreesFromNadir_handle);
    if (_setMaxTilt_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _setMaxTilt_return_get_error(__call_result_handle);
        _setMaxTilt_return_release_handle(__call_result_handle);
        try {
          throw MapCameraLimitsMapCameraLimitsExceptionException(sdk_mapview_MapCameraLimits_ErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_mapview_MapCameraLimits_ErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _setMaxTilt_return_get_result(__call_result_handle);
    _setMaxTilt_return_release_handle(__call_result_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  setMinTilt(double degreesFromNadir) {
    final _setMinTilt_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Double), Pointer<Void> Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapCameraLimits_setMinTilt__Double'));
    final _degreesFromNadir_handle = (degreesFromNadir);
    final _handle = this.handle;
    final __call_result_handle = _setMinTilt_ffi(_handle, __lib.LibraryContext.isolateId, _degreesFromNadir_handle);
    (_degreesFromNadir_handle);
    if (_setMinTilt_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _setMinTilt_return_get_error(__call_result_handle);
        _setMinTilt_return_release_handle(__call_result_handle);
        try {
          throw MapCameraLimitsMapCameraLimitsExceptionException(sdk_mapview_MapCameraLimits_ErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_mapview_MapCameraLimits_ErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _setMinTilt_return_get_result(__call_result_handle);
    _setMinTilt_return_release_handle(__call_result_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  setMaxZoomLevel(double zoomLevel) {
    final _setMaxZoomLevel_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Double), Pointer<Void> Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapCameraLimits_setMaxZoomLevel__Double'));
    final _zoomLevel_handle = (zoomLevel);
    final _handle = this.handle;
    final __call_result_handle = _setMaxZoomLevel_ffi(_handle, __lib.LibraryContext.isolateId, _zoomLevel_handle);
    (_zoomLevel_handle);
    if (_setMaxZoomLevel_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _setMaxZoomLevel_return_get_error(__call_result_handle);
        _setMaxZoomLevel_return_release_handle(__call_result_handle);
        try {
          throw MapCameraLimitsMapCameraLimitsExceptionException(sdk_mapview_MapCameraLimits_ErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_mapview_MapCameraLimits_ErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _setMaxZoomLevel_return_get_result(__call_result_handle);
    _setMaxZoomLevel_return_release_handle(__call_result_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  setMinZoomLevel(double zoomLevel) {
    final _setMinZoomLevel_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Double), Pointer<Void> Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapCameraLimits_setMinZoomLevel__Double'));
    final _zoomLevel_handle = (zoomLevel);
    final _handle = this.handle;
    final __call_result_handle = _setMinZoomLevel_ffi(_handle, __lib.LibraryContext.isolateId, _zoomLevel_handle);
    (_zoomLevel_handle);
    if (_setMinZoomLevel_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _setMinZoomLevel_return_get_error(__call_result_handle);
        _setMinZoomLevel_return_release_handle(__call_result_handle);
        try {
          throw MapCameraLimitsMapCameraLimitsExceptionException(sdk_mapview_MapCameraLimits_ErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_mapview_MapCameraLimits_ErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _setMinZoomLevel_return_get_result(__call_result_handle);
    _setMinZoomLevel_return_release_handle(__call_result_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internalsetHarpMapview(HarpMapView mapview) {
    final _setHarpMapview_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraLimits_setHarpMapview__HarpMapView'));
    final _mapview_handle = sdk_mapview_HarpMapView_toFfi(mapview);
    final _handle = this.handle;
    final __result_handle = _setHarpMapview_ffi(_handle, __lib.LibraryContext.isolateId, _mapview_handle);
    sdk_mapview_HarpMapView_releaseFfiHandle(_mapview_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


}

Pointer<Void> sdk_mapview_MapCameraLimits_toFfi(MapCameraLimits value) =>
  _sdk_mapview_MapCameraLimits_copy_handle((value as MapCameraLimits$Impl).handle);

MapCameraLimits sdk_mapview_MapCameraLimits_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_MapCameraLimits_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as MapCameraLimits;
  if (instance != null) return instance;

  final _copied_handle = _sdk_mapview_MapCameraLimits_copy_handle(handle);
  final result = MapCameraLimits$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_MapCameraLimits_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapCameraLimits_release_handle(handle);

Pointer<Void> sdk_mapview_MapCameraLimits_toFfi_nullable(MapCameraLimits value) =>
  value != null ? sdk_mapview_MapCameraLimits_toFfi(value) : Pointer<Void>.fromAddress(0);

MapCameraLimits sdk_mapview_MapCameraLimits_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapCameraLimits_fromFfi(handle) : null;

void sdk_mapview_MapCameraLimits_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapCameraLimits_release_handle(handle);

// End of MapCameraLimits "private" section.

