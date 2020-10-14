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

/// Identifies the action type.
enum PostActionType {
    /// An action to prepare for electric vehicle charging. Represents the time
    /// spent setting up for charging (e.g., payment processing), independent of
    /// the time required to actually charge the vehicle.
    chargingSetup,
    /// An action to charge the electric vehicle.
    charging,
    /// An action to be performed at or during a specific portion of a section.
    wait
}

// PostActionType "private" section, not exported.

int sdk_routing_PostActionType_toFfi(PostActionType value) {
  switch (value) {
  case PostActionType.chargingSetup:
    return 0;
  break;
  case PostActionType.charging:
    return 1;
  break;
  case PostActionType.wait:
    return 2;
  break;
  default:
    throw StateError("Invalid enum value $value for PostActionType enum.");
  }
}

PostActionType sdk_routing_PostActionType_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return PostActionType.chargingSetup;
  break;
  case 1:
    return PostActionType.charging;
  break;
  case 2:
    return PostActionType.wait;
  break;
  default:
    throw StateError("Invalid numeric value $handle for PostActionType enum.");
  }
}

void sdk_routing_PostActionType_releaseFfiHandle(int handle) {}

final _sdk_routing_PostActionType_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_PostActionType_create_handle_nullable'));
final _sdk_routing_PostActionType_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PostActionType_release_handle_nullable'));
final _sdk_routing_PostActionType_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PostActionType_get_value_nullable'));

Pointer<Void> sdk_routing_PostActionType_toFfi_nullable(PostActionType value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_PostActionType_toFfi(value);
  final result = _sdk_routing_PostActionType_create_handle_nullable(_handle);
  sdk_routing_PostActionType_releaseFfiHandle(_handle);
  return result;
}

PostActionType sdk_routing_PostActionType_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_PostActionType_get_value_nullable(handle);
  final result = sdk_routing_PostActionType_fromFfi(_handle);
  sdk_routing_PostActionType_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_PostActionType_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_PostActionType_release_handle_nullable(handle);

// End of PostActionType "private" section.

