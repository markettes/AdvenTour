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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/gestures/gestures.dart';
import 'package:here_sdk/src/sdk/gestures/touch_phase.dart';
import 'package:here_sdk/src/sdk/gestures/touch_point.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Processes touch events from the platform and detects appropriate gestures.
abstract class InternalGestureDetector {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Processes the touch event and detects appropriate gestures.
  /// [points] Map of all the touches, where the key is the touch id and the value is the touch.
  /// [timestampMs] Timestamp in milliseconds.
  /// [phase] Touch phase of the event.
  /// @nodoc
  internalprocessTouchEvent(Map<int, TouchPoint> points, int timestampMs, TouchPhase phase);
  /// Sets the pixel scale factor.
  ///
  /// The factor is used to support screen resolution
  /// and size independence.
  /// This value is a derivative of the device's screen pixel density
  /// and is a direct analogy of Android's density factor and iOS' contentScaleFactor.
  /// It can be used to translate between pixels and density-independent pixels,
  /// according to the formula: dp = px / pixel_scale.
  /// @nodoc
  internalsetPixelScale(double pixelScale);


  /// Gets the accessor for the gesture handlers.
  /// @nodoc
  Gestures get internalgestures;



}


// InternalGestureDetector "private" section, not exported.

final _sdk_gestures_InternalGestureDetector_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_InternalGestureDetector_copy_handle'));
final _sdk_gestures_InternalGestureDetector_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_InternalGestureDetector_release_handle'));
final _sdk_gestures_InternalGestureDetector_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_gestures_InternalGestureDetector_get_raw_pointer'));



class InternalGestureDetector$Impl implements InternalGestureDetector {
  @protected
  Pointer<Void> handle;

  InternalGestureDetector$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_gestures_InternalGestureDetector_get_raw_pointer(handle));
    _sdk_gestures_InternalGestureDetector_release_handle(handle);
    handle = null;
  }

  @override
  internalprocessTouchEvent(Map<int, TouchPoint> points, int timestampMs, TouchPhase phase) {
    final _processTouchEvent_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Int64, Uint32), void Function(Pointer<Void>, int, Pointer<Void>, int, int)>('here_sdk_sdk_gestures_InternalGestureDetector_processTouchEvent__MapOf_1Long_1to_1sdk_1gestures_1TouchPoint_Long_TouchPhase'));
    final _points_handle = heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_toFfi(points);
    final _timestampMs_handle = (timestampMs);
    final _phase_handle = sdk_gestures_TouchPhase_toFfi(phase);
    final _handle = this.handle;
    final __result_handle = _processTouchEvent_ffi(_handle, __lib.LibraryContext.isolateId, _points_handle, _timestampMs_handle, _phase_handle);
    heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_releaseFfiHandle(_points_handle);
    (_timestampMs_handle);
    sdk_gestures_TouchPhase_releaseFfiHandle(_phase_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internalsetPixelScale(double pixelScale) {
    final _setPixelScale_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Float), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_gestures_InternalGestureDetector_setPixelScale__Float'));
    final _pixelScale_handle = (pixelScale);
    final _handle = this.handle;
    final __result_handle = _setPixelScale_ffi(_handle, __lib.LibraryContext.isolateId, _pixelScale_handle);
    (_pixelScale_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  Gestures get internalgestures {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_gestures_InternalGestureDetector_gestures_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_gestures_Gestures_fromFfi(__result_handle);
    } finally {
      sdk_gestures_Gestures_releaseFfiHandle(__result_handle);
    }
  }



}

Pointer<Void> sdk_gestures_InternalGestureDetector_toFfi(InternalGestureDetector value) =>
  _sdk_gestures_InternalGestureDetector_copy_handle((value as InternalGestureDetector$Impl).handle);

InternalGestureDetector sdk_gestures_InternalGestureDetector_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_gestures_InternalGestureDetector_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as InternalGestureDetector;
  if (instance != null) return instance;

  final _copied_handle = _sdk_gestures_InternalGestureDetector_copy_handle(handle);
  final result = InternalGestureDetector$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_gestures_InternalGestureDetector_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_gestures_InternalGestureDetector_release_handle(handle);

Pointer<Void> sdk_gestures_InternalGestureDetector_toFfi_nullable(InternalGestureDetector value) =>
  value != null ? sdk_gestures_InternalGestureDetector_toFfi(value) : Pointer<Void>.fromAddress(0);

InternalGestureDetector sdk_gestures_InternalGestureDetector_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_gestures_InternalGestureDetector_fromFfi(handle) : null;

void sdk_gestures_InternalGestureDetector_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_gestures_InternalGestureDetector_release_handle(handle);

// End of InternalGestureDetector "private" section.

