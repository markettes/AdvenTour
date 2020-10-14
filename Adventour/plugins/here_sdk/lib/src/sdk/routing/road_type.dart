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

/// Identifies the road type.
enum RoadType {
    /// Highway road type.
    highway,
    /// Rural road type.
    rural,
    /// Urban road type.
    urban,
    /// Unknown road type.
    unknown
}

// RoadType "private" section, not exported.

int sdk_routing_RoadType_toFfi(RoadType value) {
  switch (value) {
  case RoadType.highway:
    return 0;
  break;
  case RoadType.rural:
    return 1;
  break;
  case RoadType.urban:
    return 2;
  break;
  case RoadType.unknown:
    return 3;
  break;
  default:
    throw StateError("Invalid enum value $value for RoadType enum.");
  }
}

RoadType sdk_routing_RoadType_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return RoadType.highway;
  break;
  case 1:
    return RoadType.rural;
  break;
  case 2:
    return RoadType.urban;
  break;
  case 3:
    return RoadType.unknown;
  break;
  default:
    throw StateError("Invalid numeric value $handle for RoadType enum.");
  }
}

void sdk_routing_RoadType_releaseFfiHandle(int handle) {}

final _sdk_routing_RoadType_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_RoadType_create_handle_nullable'));
final _sdk_routing_RoadType_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadType_release_handle_nullable'));
final _sdk_routing_RoadType_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadType_get_value_nullable'));

Pointer<Void> sdk_routing_RoadType_toFfi_nullable(RoadType value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_RoadType_toFfi(value);
  final result = _sdk_routing_RoadType_create_handle_nullable(_handle);
  sdk_routing_RoadType_releaseFfiHandle(_handle);
  return result;
}

RoadType sdk_routing_RoadType_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_RoadType_get_value_nullable(handle);
  final result = sdk_routing_RoadType_fromFfi(_handle);
  sdk_routing_RoadType_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_RoadType_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_RoadType_release_handle_nullable(handle);

// End of RoadType "private" section.

