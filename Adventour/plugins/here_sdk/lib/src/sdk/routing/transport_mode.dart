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

/// Specifies the mode of transport to calculate the route.
enum TransportMode {
    /// Route calculation for cars.
    car,
    /// Route calculation for trucks. This mode considers truck restrictions
    /// and uses truck specific speed assumptions when calculating the route.
    truck,
    /// Route calculation for a pedestrian. As one effect, maneuvers will be
    /// optimized for walking, i.e. segments will consider actions relevant for pedestrians
    /// and maneuver instructions will contain texts suitable for a walking person. This mode
    /// disregards any traffic information.
    pedestrian
}

// TransportMode "private" section, not exported.

int sdk_routing_TransportMode_toFfi(TransportMode value) {
  switch (value) {
  case TransportMode.car:
    return 0;
  break;
  case TransportMode.truck:
    return 1;
  break;
  case TransportMode.pedestrian:
    return 2;
  break;
  default:
    throw StateError("Invalid enum value $value for TransportMode enum.");
  }
}

TransportMode sdk_routing_TransportMode_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return TransportMode.car;
  break;
  case 1:
    return TransportMode.truck;
  break;
  case 2:
    return TransportMode.pedestrian;
  break;
  default:
    throw StateError("Invalid numeric value $handle for TransportMode enum.");
  }
}

void sdk_routing_TransportMode_releaseFfiHandle(int handle) {}

final _sdk_routing_TransportMode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_TransportMode_create_handle_nullable'));
final _sdk_routing_TransportMode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransportMode_release_handle_nullable'));
final _sdk_routing_TransportMode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransportMode_get_value_nullable'));

Pointer<Void> sdk_routing_TransportMode_toFfi_nullable(TransportMode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_TransportMode_toFfi(value);
  final result = _sdk_routing_TransportMode_create_handle_nullable(_handle);
  sdk_routing_TransportMode_releaseFfiHandle(_handle);
  return result;
}

TransportMode sdk_routing_TransportMode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_TransportMode_get_value_nullable(handle);
  final result = sdk_routing_TransportMode_fromFfi(_handle);
  sdk_routing_TransportMode_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_TransportMode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TransportMode_release_handle_nullable(handle);

// End of TransportMode "private" section.

