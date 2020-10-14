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

/// @nodoc
enum StreetAttributes {
    rightDrivingSide,
    dirtRoad,
    tunnel,
    bridge,
    ramp,
    controlledAccess,
    roundabout,
    underConstruction,
    dividedRoad,
    motorway,
    privateRoad
}

// StreetAttributes "private" section, not exported.

int sdk_routing_StreetAttributes_toFfi(StreetAttributes value) {
  switch (value) {
  case StreetAttributes.rightDrivingSide:
    return 0;
  break;
  case StreetAttributes.dirtRoad:
    return 1;
  break;
  case StreetAttributes.tunnel:
    return 2;
  break;
  case StreetAttributes.bridge:
    return 3;
  break;
  case StreetAttributes.ramp:
    return 4;
  break;
  case StreetAttributes.controlledAccess:
    return 5;
  break;
  case StreetAttributes.roundabout:
    return 6;
  break;
  case StreetAttributes.underConstruction:
    return 7;
  break;
  case StreetAttributes.dividedRoad:
    return 8;
  break;
  case StreetAttributes.motorway:
    return 9;
  break;
  case StreetAttributes.privateRoad:
    return 10;
  break;
  default:
    throw StateError("Invalid enum value $value for StreetAttributes enum.");
  }
}

StreetAttributes sdk_routing_StreetAttributes_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return StreetAttributes.rightDrivingSide;
  break;
  case 1:
    return StreetAttributes.dirtRoad;
  break;
  case 2:
    return StreetAttributes.tunnel;
  break;
  case 3:
    return StreetAttributes.bridge;
  break;
  case 4:
    return StreetAttributes.ramp;
  break;
  case 5:
    return StreetAttributes.controlledAccess;
  break;
  case 6:
    return StreetAttributes.roundabout;
  break;
  case 7:
    return StreetAttributes.underConstruction;
  break;
  case 8:
    return StreetAttributes.dividedRoad;
  break;
  case 9:
    return StreetAttributes.motorway;
  break;
  case 10:
    return StreetAttributes.privateRoad;
  break;
  default:
    throw StateError("Invalid numeric value $handle for StreetAttributes enum.");
  }
}

void sdk_routing_StreetAttributes_releaseFfiHandle(int handle) {}

final _sdk_routing_StreetAttributes_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_StreetAttributes_create_handle_nullable'));
final _sdk_routing_StreetAttributes_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_StreetAttributes_release_handle_nullable'));
final _sdk_routing_StreetAttributes_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_StreetAttributes_get_value_nullable'));

Pointer<Void> sdk_routing_StreetAttributes_toFfi_nullable(StreetAttributes value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_StreetAttributes_toFfi(value);
  final result = _sdk_routing_StreetAttributes_create_handle_nullable(_handle);
  sdk_routing_StreetAttributes_releaseFfiHandle(_handle);
  return result;
}

StreetAttributes sdk_routing_StreetAttributes_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_StreetAttributes_get_value_nullable(handle);
  final result = sdk_routing_StreetAttributes_fromFfi(_handle);
  sdk_routing_StreetAttributes_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_StreetAttributes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_StreetAttributes_release_handle_nullable(handle);

// End of StreetAttributes "private" section.

