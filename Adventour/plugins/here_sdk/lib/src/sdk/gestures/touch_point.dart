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

import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:here_sdk/src/sdk/gestures/touch_phase.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Encapsulates properties of the single touch.
/// @nodoc

class TouchPoint {
  /// Touch identifier. If several fingers are on the screen,
  /// during a gesture, the touch id for each finger will not change.
  /// @nodoc
  int internalid;

  /// Coordinates of the touch on the screen in pixels.
  /// @nodoc
  Point2D internalcoordinates;

  /// Touch phase of the point.
  /// @nodoc
  TouchPhase internalphase;


  TouchPoint(this.internalid, this.internalcoordinates, this.internalphase);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! TouchPoint) return false;
    TouchPoint _other = other;
    return internalid == _other.internalid &&
        internalcoordinates == _other.internalcoordinates &&
        internalphase == _other.internalphase;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalid.hashCode;
    result = 31 * result + internalcoordinates.hashCode;
    result = 31 * result + internalphase.hashCode;
    return result;
  }
}


// TouchPoint "private" section, not exported.

final _sdk_gestures_TouchPoint_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int64, Pointer<Void>, Uint32),
    Pointer<Void> Function(int, Pointer<Void>, int)
  >('here_sdk_sdk_gestures_TouchPoint_create_handle'));
final _sdk_gestures_TouchPoint_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TouchPoint_release_handle'));
final _sdk_gestures_TouchPoint_get_field_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TouchPoint_get_field_id'));
final _sdk_gestures_TouchPoint_get_field_coordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TouchPoint_get_field_coordinates'));
final _sdk_gestures_TouchPoint_get_field_phase = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TouchPoint_get_field_phase'));

Pointer<Void> sdk_gestures_TouchPoint_toFfi(TouchPoint value) {
  final _id_handle = (value.internalid);
  final _coordinates_handle = sdk_core_Point2D_toFfi(value.internalcoordinates);
  final _phase_handle = sdk_gestures_TouchPhase_toFfi(value.internalphase);
  final _result = _sdk_gestures_TouchPoint_create_handle(_id_handle, _coordinates_handle, _phase_handle);
  (_id_handle);
  sdk_core_Point2D_releaseFfiHandle(_coordinates_handle);
  sdk_gestures_TouchPhase_releaseFfiHandle(_phase_handle);
  return _result;
}

TouchPoint sdk_gestures_TouchPoint_fromFfi(Pointer<Void> handle) {
  final _id_handle = _sdk_gestures_TouchPoint_get_field_id(handle);
  final _coordinates_handle = _sdk_gestures_TouchPoint_get_field_coordinates(handle);
  final _phase_handle = _sdk_gestures_TouchPoint_get_field_phase(handle);
  try {
    return TouchPoint(
      (_id_handle), 
    
      sdk_core_Point2D_fromFfi(_coordinates_handle), 
    
      sdk_gestures_TouchPhase_fromFfi(_phase_handle)
    );
  } finally {
    (_id_handle);
    sdk_core_Point2D_releaseFfiHandle(_coordinates_handle);
    sdk_gestures_TouchPhase_releaseFfiHandle(_phase_handle);
  }
}

void sdk_gestures_TouchPoint_releaseFfiHandle(Pointer<Void> handle) => _sdk_gestures_TouchPoint_release_handle(handle);

// Nullable TouchPoint

final _sdk_gestures_TouchPoint_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TouchPoint_create_handle_nullable'));
final _sdk_gestures_TouchPoint_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TouchPoint_release_handle_nullable'));
final _sdk_gestures_TouchPoint_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TouchPoint_get_value_nullable'));

Pointer<Void> sdk_gestures_TouchPoint_toFfi_nullable(TouchPoint value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_gestures_TouchPoint_toFfi(value);
  final result = _sdk_gestures_TouchPoint_create_handle_nullable(_handle);
  sdk_gestures_TouchPoint_releaseFfiHandle(_handle);
  return result;
}

TouchPoint sdk_gestures_TouchPoint_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_gestures_TouchPoint_get_value_nullable(handle);
  final result = sdk_gestures_TouchPoint_fromFfi(_handle);
  sdk_gestures_TouchPoint_releaseFfiHandle(_handle);
  return result;
}

void sdk_gestures_TouchPoint_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_gestures_TouchPoint_release_handle_nullable(handle);

// End of TouchPoint "private" section.

