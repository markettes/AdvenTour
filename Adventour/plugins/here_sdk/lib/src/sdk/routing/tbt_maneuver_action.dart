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

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// @nodoc

class TbtManeuverAction {
  /// @nodoc
  String internalaction;

  /// @nodoc
  String internaltrafficDirection;

  /// @nodoc
  String internalorientation;

  /// @nodoc
  String internalturn;

  /// @nodoc
  int internalroundaboutExit;


  TbtManeuverAction(this.internalaction, this.internaltrafficDirection, this.internalorientation, this.internalturn, this.internalroundaboutExit);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! TbtManeuverAction) return false;
    TbtManeuverAction _other = other;
    return internalaction == _other.internalaction &&
        internaltrafficDirection == _other.internaltrafficDirection &&
        internalorientation == _other.internalorientation &&
        internalturn == _other.internalturn &&
        internalroundaboutExit == _other.internalroundaboutExit;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalaction.hashCode;
    result = 31 * result + internaltrafficDirection.hashCode;
    result = 31 * result + internalorientation.hashCode;
    result = 31 * result + internalturn.hashCode;
    result = 31 * result + internalroundaboutExit.hashCode;
    return result;
  }
}


// TbtManeuverAction "private" section, not exported.

final _sdk_routing_TbtManeuverAction_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuverAction_create_handle'));
final _sdk_routing_TbtManeuverAction_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuverAction_release_handle'));
final _sdk_routing_TbtManeuverAction_get_field_action = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuverAction_get_field_action'));
final _sdk_routing_TbtManeuverAction_get_field_trafficDirection = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuverAction_get_field_trafficDirection'));
final _sdk_routing_TbtManeuverAction_get_field_orientation = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuverAction_get_field_orientation'));
final _sdk_routing_TbtManeuverAction_get_field_turn = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuverAction_get_field_turn'));
final _sdk_routing_TbtManeuverAction_get_field_roundaboutExit = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuverAction_get_field_roundaboutExit'));

Pointer<Void> sdk_routing_TbtManeuverAction_toFfi(TbtManeuverAction value) {
  final _action_handle = String_toFfi(value.internalaction);
  final _trafficDirection_handle = String_toFfi(value.internaltrafficDirection);
  final _orientation_handle = String_toFfi_nullable(value.internalorientation);
  final _turn_handle = String_toFfi_nullable(value.internalturn);
  final _roundaboutExit_handle = Int_toFfi_nullable(value.internalroundaboutExit);
  final _result = _sdk_routing_TbtManeuverAction_create_handle(_action_handle, _trafficDirection_handle, _orientation_handle, _turn_handle, _roundaboutExit_handle);
  String_releaseFfiHandle(_action_handle);
  String_releaseFfiHandle(_trafficDirection_handle);
  String_releaseFfiHandle_nullable(_orientation_handle);
  String_releaseFfiHandle_nullable(_turn_handle);
  Int_releaseFfiHandle_nullable(_roundaboutExit_handle);
  return _result;
}

TbtManeuverAction sdk_routing_TbtManeuverAction_fromFfi(Pointer<Void> handle) {
  final _action_handle = _sdk_routing_TbtManeuverAction_get_field_action(handle);
  final _trafficDirection_handle = _sdk_routing_TbtManeuverAction_get_field_trafficDirection(handle);
  final _orientation_handle = _sdk_routing_TbtManeuverAction_get_field_orientation(handle);
  final _turn_handle = _sdk_routing_TbtManeuverAction_get_field_turn(handle);
  final _roundaboutExit_handle = _sdk_routing_TbtManeuverAction_get_field_roundaboutExit(handle);
  try {
    return TbtManeuverAction(
      String_fromFfi(_action_handle), 
    
      String_fromFfi(_trafficDirection_handle), 
    
      String_fromFfi_nullable(_orientation_handle), 
    
      String_fromFfi_nullable(_turn_handle), 
    
      Int_fromFfi_nullable(_roundaboutExit_handle)
    );
  } finally {
    String_releaseFfiHandle(_action_handle);
    String_releaseFfiHandle(_trafficDirection_handle);
    String_releaseFfiHandle_nullable(_orientation_handle);
    String_releaseFfiHandle_nullable(_turn_handle);
    Int_releaseFfiHandle_nullable(_roundaboutExit_handle);
  }
}

void sdk_routing_TbtManeuverAction_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_TbtManeuverAction_release_handle(handle);

// Nullable TbtManeuverAction

final _sdk_routing_TbtManeuverAction_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuverAction_create_handle_nullable'));
final _sdk_routing_TbtManeuverAction_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuverAction_release_handle_nullable'));
final _sdk_routing_TbtManeuverAction_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuverAction_get_value_nullable'));

Pointer<Void> sdk_routing_TbtManeuverAction_toFfi_nullable(TbtManeuverAction value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_TbtManeuverAction_toFfi(value);
  final result = _sdk_routing_TbtManeuverAction_create_handle_nullable(_handle);
  sdk_routing_TbtManeuverAction_releaseFfiHandle(_handle);
  return result;
}

TbtManeuverAction sdk_routing_TbtManeuverAction_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_TbtManeuverAction_get_value_nullable(handle);
  final result = sdk_routing_TbtManeuverAction_fromFfi(_handle);
  sdk_routing_TbtManeuverAction_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_TbtManeuverAction_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TbtManeuverAction_release_handle_nullable(handle);

// End of TbtManeuverAction "private" section.

