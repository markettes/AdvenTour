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
import 'package:here_sdk/src/sdk/gestures/double_tap_listener.dart';
import 'package:here_sdk/src/sdk/gestures/gesture_type.dart';
import 'package:here_sdk/src/sdk/gestures/long_press_listener.dart';
import 'package:here_sdk/src/sdk/gestures/pan_listener.dart';
import 'package:here_sdk/src/sdk/gestures/pinch_rotate_listener.dart';
import 'package:here_sdk/src/sdk/gestures/tap_listener.dart';
import 'package:here_sdk/src/sdk/gestures/two_finger_pan_listener.dart';
import 'package:here_sdk/src/sdk/gestures/two_finger_tap_listener.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Use this class to process touch events from the platform and detect gesture induced actions on the map view.
///
/// Please note that this class holds strong references to the gesture listeners.
abstract class Gestures {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Enables default action to be performed for a specified
  /// gesture.
  enableDefaultAction(GestureType gestureType);
  /// Disables default action for a specified gesture.
  disableDefaultAction(GestureType gestureType);


  /// Gets a TapListener that notifies when a tap gesture occurs.
  TapListener get tapListener;


  /// Sets a TapListener that notifies when a tap gesture occurs.
  set tapListener(TapListener value);




  /// Gets a DoubleTapListener that notifies when a double-tap gesture occurs.
  DoubleTapListener get doubleTapListener;


  /// Sets a DoubleTapListener that notifies when a double-tap gesture occurs.
  set doubleTapListener(DoubleTapListener value);




  /// Gets a PinchRotateListener that notifies when a pinch-rotate gesture occurs.
  PinchRotateListener get pinchRotateListener;


  /// Sets a PinchRotateListener that notifies when a pinch-rotate gesture occurs.
  set pinchRotateListener(PinchRotateListener value);




  /// Gets a LongPressListener that notifies when a long-press gesture occurs.
  LongPressListener get longPressListener;


  /// Sets a LongPressListener that notifies when a long-press gesture occurs.
  set longPressListener(LongPressListener value);




  /// Gets a PanListener that notifies when a pan gesture occurs.
  PanListener get panListener;


  /// Sets a PanListener that notifies when a pan gesture occurs.
  set panListener(PanListener value);




  /// Gets a TwoFingerTapListener that notifies when a two-finger tap gesture occurs.
  TwoFingerTapListener get twoFingerTapListener;


  /// Sets a TwoFingerTapListener that notifies when a two-finger tap gesture occurs.
  set twoFingerTapListener(TwoFingerTapListener value);




  /// Gets a TwoFingerPanListener that notifies when a two-finger tap gesture occurs.
  TwoFingerPanListener get twoFingerPanListener;


  /// Sets a TwoFingerPanListener that notifies when a two-finger tap gesture occurs.
  set twoFingerPanListener(TwoFingerPanListener value);


}


// Gestures "private" section, not exported.

final _sdk_gestures_Gestures_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_Gestures_copy_handle'));
final _sdk_gestures_Gestures_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_Gestures_release_handle'));
final _sdk_gestures_Gestures_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_gestures_Gestures_get_raw_pointer'));



class Gestures$Impl implements Gestures {
  @protected
  Pointer<Void> handle;

  Gestures$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_gestures_Gestures_get_raw_pointer(handle));
    _sdk_gestures_Gestures_release_handle(handle);
    handle = null;
  }

  @override
  enableDefaultAction(GestureType gestureType) {
    final _enableDefaultAction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_gestures_Gestures_enableDefaultAction__GestureType'));
    final _gestureType_handle = sdk_gestures_GestureType_toFfi(gestureType);
    final _handle = this.handle;
    final __result_handle = _enableDefaultAction_ffi(_handle, __lib.LibraryContext.isolateId, _gestureType_handle);
    sdk_gestures_GestureType_releaseFfiHandle(_gestureType_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  disableDefaultAction(GestureType gestureType) {
    final _disableDefaultAction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_gestures_Gestures_disableDefaultAction__GestureType'));
    final _gestureType_handle = sdk_gestures_GestureType_toFfi(gestureType);
    final _handle = this.handle;
    final __result_handle = _disableDefaultAction_ffi(_handle, __lib.LibraryContext.isolateId, _gestureType_handle);
    sdk_gestures_GestureType_releaseFfiHandle(_gestureType_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  TapListener get tapListener {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_gestures_Gestures_tapListener_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_gestures_TapListener_fromFfi_nullable(__result_handle);
    } finally {
      sdk_gestures_TapListener_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  set tapListener(TapListener value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_Gestures_tapListener_set__TapListener'));
    final _value_handle = sdk_gestures_TapListener_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_gestures_TapListener_releaseFfiHandle_nullable(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  DoubleTapListener get doubleTapListener {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_gestures_Gestures_doubleTapListener_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_gestures_DoubleTapListener_fromFfi_nullable(__result_handle);
    } finally {
      sdk_gestures_DoubleTapListener_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  set doubleTapListener(DoubleTapListener value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_Gestures_doubleTapListener_set__DoubleTapListener'));
    final _value_handle = sdk_gestures_DoubleTapListener_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_gestures_DoubleTapListener_releaseFfiHandle_nullable(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  PinchRotateListener get pinchRotateListener {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_gestures_Gestures_pinchRotateListener_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_gestures_PinchRotateListener_fromFfi_nullable(__result_handle);
    } finally {
      sdk_gestures_PinchRotateListener_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  set pinchRotateListener(PinchRotateListener value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_Gestures_pinchRotateListener_set__PinchRotateListener'));
    final _value_handle = sdk_gestures_PinchRotateListener_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_gestures_PinchRotateListener_releaseFfiHandle_nullable(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  LongPressListener get longPressListener {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_gestures_Gestures_longPressListener_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_gestures_LongPressListener_fromFfi_nullable(__result_handle);
    } finally {
      sdk_gestures_LongPressListener_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  set longPressListener(LongPressListener value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_Gestures_longPressListener_set__LongPressListener'));
    final _value_handle = sdk_gestures_LongPressListener_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_gestures_LongPressListener_releaseFfiHandle_nullable(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  PanListener get panListener {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_gestures_Gestures_panListener_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_gestures_PanListener_fromFfi_nullable(__result_handle);
    } finally {
      sdk_gestures_PanListener_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  set panListener(PanListener value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_Gestures_panListener_set__PanListener'));
    final _value_handle = sdk_gestures_PanListener_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_gestures_PanListener_releaseFfiHandle_nullable(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  TwoFingerTapListener get twoFingerTapListener {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_gestures_Gestures_twoFingerTapListener_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_gestures_TwoFingerTapListener_fromFfi_nullable(__result_handle);
    } finally {
      sdk_gestures_TwoFingerTapListener_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  set twoFingerTapListener(TwoFingerTapListener value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_Gestures_twoFingerTapListener_set__TwoFingerTapListener'));
    final _value_handle = sdk_gestures_TwoFingerTapListener_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_gestures_TwoFingerTapListener_releaseFfiHandle_nullable(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  TwoFingerPanListener get twoFingerPanListener {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_gestures_Gestures_twoFingerPanListener_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_gestures_TwoFingerPanListener_fromFfi_nullable(__result_handle);
    } finally {
      sdk_gestures_TwoFingerPanListener_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  set twoFingerPanListener(TwoFingerPanListener value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_Gestures_twoFingerPanListener_set__TwoFingerPanListener'));
    final _value_handle = sdk_gestures_TwoFingerPanListener_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_gestures_TwoFingerPanListener_releaseFfiHandle_nullable(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }



}

Pointer<Void> sdk_gestures_Gestures_toFfi(Gestures value) =>
  _sdk_gestures_Gestures_copy_handle((value as Gestures$Impl).handle);

Gestures sdk_gestures_Gestures_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_gestures_Gestures_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as Gestures;
  if (instance != null) return instance;

  final _copied_handle = _sdk_gestures_Gestures_copy_handle(handle);
  final result = Gestures$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_gestures_Gestures_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_gestures_Gestures_release_handle(handle);

Pointer<Void> sdk_gestures_Gestures_toFfi_nullable(Gestures value) =>
  value != null ? sdk_gestures_Gestures_toFfi(value) : Pointer<Void>.fromAddress(0);

Gestures sdk_gestures_Gestures_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_gestures_Gestures_fromFfi(handle) : null;

void sdk_gestures_Gestures_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_gestures_Gestures_release_handle(handle);

// End of Gestures "private" section.

