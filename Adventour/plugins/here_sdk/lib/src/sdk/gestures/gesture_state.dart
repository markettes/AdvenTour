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

/// Represents the state of the gesture.
enum GestureState {
    /// The gesture has started.
    begin,
    /// The gesture was updated.
    update,
    /// The gesture was completed.
    end,
    /// The gesture was canceled.
    cancel
}

// GestureState "private" section, not exported.

int sdk_gestures_GestureState_toFfi(GestureState value) {
  switch (value) {
  case GestureState.begin:
    return 0;
  break;
  case GestureState.update:
    return 1;
  break;
  case GestureState.end:
    return 2;
  break;
  case GestureState.cancel:
    return 3;
  break;
  default:
    throw StateError("Invalid enum value $value for GestureState enum.");
  }
}

GestureState sdk_gestures_GestureState_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return GestureState.begin;
  break;
  case 1:
    return GestureState.update;
  break;
  case 2:
    return GestureState.end;
  break;
  case 3:
    return GestureState.cancel;
  break;
  default:
    throw StateError("Invalid numeric value $handle for GestureState enum.");
  }
}

void sdk_gestures_GestureState_releaseFfiHandle(int handle) {}

final _sdk_gestures_GestureState_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_gestures_GestureState_create_handle_nullable'));
final _sdk_gestures_GestureState_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_GestureState_release_handle_nullable'));
final _sdk_gestures_GestureState_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_GestureState_get_value_nullable'));

Pointer<Void> sdk_gestures_GestureState_toFfi_nullable(GestureState value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_gestures_GestureState_toFfi(value);
  final result = _sdk_gestures_GestureState_create_handle_nullable(_handle);
  sdk_gestures_GestureState_releaseFfiHandle(_handle);
  return result;
}

GestureState sdk_gestures_GestureState_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_gestures_GestureState_get_value_nullable(handle);
  final result = sdk_gestures_GestureState_fromFfi(_handle);
  sdk_gestures_GestureState_releaseFfiHandle(_handle);
  return result;
}

void sdk_gestures_GestureState_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_gestures_GestureState_release_handle_nullable(handle);

// End of GestureState "private" section.

