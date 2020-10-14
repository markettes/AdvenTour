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

/// Identifiers for different optimizations that can be used during the
/// route calculation while trying to keep the quality of the route being calculated high.
///
/// The route is considered to be of low quality if it gives the traveler an unpleasant experience,
/// such as having difficult turns or having a lot of turns in general.
/// For example, if there are two possible routes from A to B, one with a length of 1000m
/// and 10 turns, and another with a length of 1050m and only one turn, the second one
/// will be returned as the shortest, although it is 50m longer. Yet, it contains only one turn
/// and it is therefore considered to provide a better traveler experience.
enum OptimizationMode {
    /// The routing algorithm will attempt to find the fastest route possible,
    /// i.e. to optimize travel time while at the same time keeping the quality of the route high.
    /// For example, the algorithm may favor a route that remains on a highway, even if
    /// a shorter route can be achieved by taking a shortcut through side roads.
    fastest,
    /// The routing algorithm will attempt to find the shortest route possible,
    /// i.e. to optimize the length of the route while at the same time keeping the quality of the route
    /// high. For example, the algorithm may favor taking a shortcut that ignores speed
    /// information, even if a faster route can be achieved by staying on the highway.
    shortest
}

// OptimizationMode "private" section, not exported.

int sdk_routing_OptimizationMode_toFfi(OptimizationMode value) {
  switch (value) {
  case OptimizationMode.fastest:
    return 0;
  break;
  case OptimizationMode.shortest:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for OptimizationMode enum.");
  }
}

OptimizationMode sdk_routing_OptimizationMode_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return OptimizationMode.fastest;
  break;
  case 1:
    return OptimizationMode.shortest;
  break;
  default:
    throw StateError("Invalid numeric value $handle for OptimizationMode enum.");
  }
}

void sdk_routing_OptimizationMode_releaseFfiHandle(int handle) {}

final _sdk_routing_OptimizationMode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_OptimizationMode_create_handle_nullable'));
final _sdk_routing_OptimizationMode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OptimizationMode_release_handle_nullable'));
final _sdk_routing_OptimizationMode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OptimizationMode_get_value_nullable'));

Pointer<Void> sdk_routing_OptimizationMode_toFfi_nullable(OptimizationMode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_OptimizationMode_toFfi(value);
  final result = _sdk_routing_OptimizationMode_create_handle_nullable(_handle);
  sdk_routing_OptimizationMode_releaseFfiHandle(_handle);
  return result;
}

OptimizationMode sdk_routing_OptimizationMode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_OptimizationMode_get_value_nullable(handle);
  final result = sdk_routing_OptimizationMode_fromFfi(_handle);
  sdk_routing_OptimizationMode_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_OptimizationMode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_OptimizationMode_release_handle_nullable(handle);

// End of OptimizationMode "private" section.

