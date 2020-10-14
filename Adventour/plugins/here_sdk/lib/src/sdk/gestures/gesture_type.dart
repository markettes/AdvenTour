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


import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Enum that represents the type of a gesture.
enum GestureType {
    /// Single-tap performed with two fingers.
    twoFingerTap,
    /// Double-tap performed with one finger.
    doubleTap,
    /// Panning gesture with a single finger.
    pan,
    /// Panning gesture with two fingers.
    twoFingerPan,
    /// Pinching and rotating gesture using two fingers.
    pinchRotate
}

// GestureType "private" section, not exported.

int sdk_gestures_GestureType_toFfi(GestureType value) {
  switch (value) {
  case GestureType.twoFingerTap:
    return 0;
  break;
  case GestureType.doubleTap:
    return 1;
  break;
  case GestureType.pan:
    return 2;
  break;
  case GestureType.twoFingerPan:
    return 3;
  break;
  case GestureType.pinchRotate:
    return 4;
  break;
  default:
    throw StateError("Invalid enum value $value for GestureType enum.");
  }
}

GestureType sdk_gestures_GestureType_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return GestureType.twoFingerTap;
  break;
  case 1:
    return GestureType.doubleTap;
  break;
  case 2:
    return GestureType.pan;
  break;
  case 3:
    return GestureType.twoFingerPan;
  break;
  case 4:
    return GestureType.pinchRotate;
  break;
  default:
    throw StateError("Invalid numeric value $handle for GestureType enum.");
  }
}

void sdk_gestures_GestureType_releaseFfiHandle(int handle) {}

final _sdk_gestures_GestureType_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_gestures_GestureType_create_handle_nullable'));
final _sdk_gestures_GestureType_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_GestureType_release_handle_nullable'));
final _sdk_gestures_GestureType_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_GestureType_get_value_nullable'));

Pointer<Void> sdk_gestures_GestureType_toFfi_nullable(GestureType value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_gestures_GestureType_toFfi(value);
  final result = _sdk_gestures_GestureType_create_handle_nullable(_handle);
  sdk_gestures_GestureType_releaseFfiHandle(_handle);
  return result;
}

GestureType sdk_gestures_GestureType_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_gestures_GestureType_get_value_nullable(handle);
  final result = sdk_gestures_GestureType_fromFfi(_handle);
  sdk_gestures_GestureType_releaseFfiHandle(_handle);
  return result;
}

void sdk_gestures_GestureType_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_gestures_GestureType_release_handle_nullable(handle);

// End of GestureType "private" section.

