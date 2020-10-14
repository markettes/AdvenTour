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

/// Road features or states.
enum RoadFeatures {
    /// This part of the route is subject to seasonal closure.
    seasonalClosure,
    /// Access to this part of the route is restricted with a fee or toll.
    tollRoad,
    /// This part of the route is a controlled-access highway, i.e. high-speed
    /// and highly controlled.
    controlledAccessHighway,
    /// This part of the route is for transit with a ferry.
    ferry,
    /// This part of the route is for transit with a car shuttle train.
    carShuttleTrain,
    /// This part of the route is a tunnel.
    tunnel,
    /// This part of the route has an un-paved surface.
    dirtRoad,
    /// This part of the route has difficult turns for trucks. Note that
    /// this feature is valid only for trucks.
    difficultTurns
}

// RoadFeatures "private" section, not exported.

int sdk_routing_RoadFeatures_toFfi(RoadFeatures value) {
  switch (value) {
  case RoadFeatures.seasonalClosure:
    return 0;
  break;
  case RoadFeatures.tollRoad:
    return 1;
  break;
  case RoadFeatures.controlledAccessHighway:
    return 2;
  break;
  case RoadFeatures.ferry:
    return 3;
  break;
  case RoadFeatures.carShuttleTrain:
    return 4;
  break;
  case RoadFeatures.tunnel:
    return 5;
  break;
  case RoadFeatures.dirtRoad:
    return 6;
  break;
  case RoadFeatures.difficultTurns:
    return 7;
  break;
  default:
    throw StateError("Invalid enum value $value for RoadFeatures enum.");
  }
}

RoadFeatures sdk_routing_RoadFeatures_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return RoadFeatures.seasonalClosure;
  break;
  case 1:
    return RoadFeatures.tollRoad;
  break;
  case 2:
    return RoadFeatures.controlledAccessHighway;
  break;
  case 3:
    return RoadFeatures.ferry;
  break;
  case 4:
    return RoadFeatures.carShuttleTrain;
  break;
  case 5:
    return RoadFeatures.tunnel;
  break;
  case 6:
    return RoadFeatures.dirtRoad;
  break;
  case 7:
    return RoadFeatures.difficultTurns;
  break;
  default:
    throw StateError("Invalid numeric value $handle for RoadFeatures enum.");
  }
}

void sdk_routing_RoadFeatures_releaseFfiHandle(int handle) {}

final _sdk_routing_RoadFeatures_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_RoadFeatures_create_handle_nullable'));
final _sdk_routing_RoadFeatures_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadFeatures_release_handle_nullable'));
final _sdk_routing_RoadFeatures_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadFeatures_get_value_nullable'));

Pointer<Void> sdk_routing_RoadFeatures_toFfi_nullable(RoadFeatures value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_RoadFeatures_toFfi(value);
  final result = _sdk_routing_RoadFeatures_create_handle_nullable(_handle);
  sdk_routing_RoadFeatures_releaseFfiHandle(_handle);
  return result;
}

RoadFeatures sdk_routing_RoadFeatures_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_RoadFeatures_get_value_nullable(handle);
  final result = sdk_routing_RoadFeatures_fromFfi(_handle);
  sdk_routing_RoadFeatures_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_RoadFeatures_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_RoadFeatures_release_handle_nullable(handle);

// End of RoadFeatures "private" section.

