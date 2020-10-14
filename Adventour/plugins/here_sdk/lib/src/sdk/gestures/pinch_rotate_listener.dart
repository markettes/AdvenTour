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
import 'package:here_sdk/src/sdk/core/angle.dart';
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:here_sdk/src/sdk/gestures/gesture_state.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Abstract class for handling pinch rotate gestures.
///
/// Pinch rotate gesture occurs when two fingers are on the screen
/// and at least one of them moves.
abstract class PinchRotateListener {
  PinchRotateListener() {}

  factory PinchRotateListener.fromLambdas({
    @required void Function(GestureState, Point2D, Point2D, double, Angle) lambda_onPinchRotate
  }) => PinchRotateListener$Lambdas(
    lambda_onPinchRotate
  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Called when the pinch rotate gesture occurs.
  /// [state] Determines in which state the gesture is.
  /// [pinchOrigin] Position where the pinch happened relative to the MapView in pixels.
  /// [rotationOrigin] Position where the rotation happened relative to the MapView in pixels.
  /// [twoFingerDistance] Distance between the two fingers in pixels.
  /// [rotation] Fingers rotation angle delta. Indicates how much the fingers rotation angle has changed
  /// since the previous gesture update. Clockwise finger rotation gives positive deltas,
  /// counter clockwise finger rotation gives negative deltas.
  onPinchRotate(GestureState state, Point2D pinchOrigin, Point2D rotationOrigin, double twoFingerDistance, Angle rotation);
}


// PinchRotateListener "private" section, not exported.

final _sdk_gestures_PinchRotateListener_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_PinchRotateListener_copy_handle'));
final _sdk_gestures_PinchRotateListener_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_PinchRotateListener_release_handle'));
final _sdk_gestures_PinchRotateListener_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_gestures_PinchRotateListener_create_proxy'));
final _sdk_gestures_PinchRotateListener_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_gestures_PinchRotateListener_get_raw_pointer'));
final _sdk_gestures_PinchRotateListener_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_PinchRotateListener_get_type_id'));


class PinchRotateListener$Lambdas implements PinchRotateListener {
  void Function(GestureState, Point2D, Point2D, double, Angle) lambda_onPinchRotate;

  PinchRotateListener$Lambdas(
    void Function(GestureState, Point2D, Point2D, double, Angle) lambda_onPinchRotate
  ) {
    this.lambda_onPinchRotate = lambda_onPinchRotate;

  }

  @override
  void release() {}

  @override
  onPinchRotate(GestureState state, Point2D pinchOrigin, Point2D rotationOrigin, double twoFingerDistance, Angle rotation) =>
    lambda_onPinchRotate(state, pinchOrigin, rotationOrigin, twoFingerDistance, rotation);
}

class PinchRotateListener$Impl implements PinchRotateListener {
  @protected
  Pointer<Void> handle;
  PinchRotateListener$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_gestures_PinchRotateListener_get_raw_pointer(handle));
    _sdk_gestures_PinchRotateListener_release_handle(handle);
    handle = null;
  }

  @override
  onPinchRotate(GestureState state, Point2D pinchOrigin, Point2D rotationOrigin, double twoFingerDistance, Angle rotation) {
    final _onPinchRotate_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Pointer<Void>, Pointer<Void>, Double, Pointer<Void>), void Function(Pointer<Void>, int, int, Pointer<Void>, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_gestures_PinchRotateListener_onPinchRotate__GestureState_Point2D_Point2D_Double_Angle'));
    final _state_handle = sdk_gestures_GestureState_toFfi(state);
    final _pinchOrigin_handle = sdk_core_Point2D_toFfi(pinchOrigin);
    final _rotationOrigin_handle = sdk_core_Point2D_toFfi(rotationOrigin);
    final _twoFingerDistance_handle = (twoFingerDistance);
    final _rotation_handle = sdk_core_Angle_toFfi(rotation);
    final _handle = this.handle;
    final __result_handle = _onPinchRotate_ffi(_handle, __lib.LibraryContext.isolateId, _state_handle, _pinchOrigin_handle, _rotationOrigin_handle, _twoFingerDistance_handle, _rotation_handle);
    sdk_gestures_GestureState_releaseFfiHandle(_state_handle);
    sdk_core_Point2D_releaseFfiHandle(_pinchOrigin_handle);
    sdk_core_Point2D_releaseFfiHandle(_rotationOrigin_handle);
    (_twoFingerDistance_handle);
    sdk_core_Angle_releaseFfiHandle(_rotation_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


}

int _PinchRotateListener_onPinchRotate_static(int _token, int state, Pointer<Void> pinchOrigin, Pointer<Void> rotationOrigin, double twoFingerDistance, Pointer<Void> rotation) {

  try {
    (__lib.instanceCache[_token] as PinchRotateListener).onPinchRotate(sdk_gestures_GestureState_fromFfi(state), sdk_core_Point2D_fromFfi(pinchOrigin), sdk_core_Point2D_fromFfi(rotationOrigin), (twoFingerDistance), sdk_core_Angle_fromFfi(rotation));
  } finally {
    sdk_gestures_GestureState_releaseFfiHandle(state);
    sdk_core_Point2D_releaseFfiHandle(pinchOrigin);
    sdk_core_Point2D_releaseFfiHandle(rotationOrigin);
    (twoFingerDistance);
    sdk_core_Angle_releaseFfiHandle(rotation);
  }
  return 0;
}


Pointer<Void> sdk_gestures_PinchRotateListener_toFfi(PinchRotateListener value) {
  if (value is PinchRotateListener$Impl) return _sdk_gestures_PinchRotateListener_copy_handle(value.handle);

  final result = _sdk_gestures_PinchRotateListener_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Uint32, Pointer<Void>, Pointer<Void>, Double, Pointer<Void>)>(_PinchRotateListener_onPinchRotate_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_gestures_PinchRotateListener_get_raw_pointer(result)] = value;

  return result;
}

PinchRotateListener sdk_gestures_PinchRotateListener_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_gestures_PinchRotateListener_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as PinchRotateListener;
  if (instance != null) return instance;

  final _type_id_handle = _sdk_gestures_PinchRotateListener_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_gestures_PinchRotateListener_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : PinchRotateListener$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_gestures_PinchRotateListener_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_gestures_PinchRotateListener_release_handle(handle);

Pointer<Void> sdk_gestures_PinchRotateListener_toFfi_nullable(PinchRotateListener value) =>
  value != null ? sdk_gestures_PinchRotateListener_toFfi(value) : Pointer<Void>.fromAddress(0);

PinchRotateListener sdk_gestures_PinchRotateListener_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_gestures_PinchRotateListener_fromFfi(handle) : null;

void sdk_gestures_PinchRotateListener_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_gestures_PinchRotateListener_release_handle(handle);

// End of PinchRotateListener "private" section.

