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
import 'package:here_sdk/src/sdk/routing/optimization_mode.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// The options to specify how the route will be calculated.

class RouteOptions {
  /// The optimization mode to be used for route calculation.
  OptimizationMode optimizationMode;

  /// Maximum number of alternative routes that will be calculated, in addition
  /// to the best one. The provided value must be in the range \[0, 6\].
  /// Alternative routes can be unavailable, thus they are not guaranteed to be returned.
  /// The order of routes is from the best to the worst, as evaluated by the route calculation
  /// algorithm and according to the given input parameters.
  /// Defaults to 0, which means there are no alternatives, i.e. only the best route is returned.
  int alternatives;

  /// Optional time when travel is expected to start. Traffic speed and
  /// incidents shall be taken into account in the calculation of the route.
  /// Note that in the event of a past departure time, the historical traffic is limited to one year. If it
  /// is not specified, it is set to the current time.
  DateTime departureTime;


  RouteOptions(this.optimizationMode, this.alternatives, this.departureTime);

  RouteOptions.withDefaults()
    : optimizationMode = OptimizationMode.fastest, alternatives = 0, departureTime = null;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! RouteOptions) return false;
    RouteOptions _other = other;
    return optimizationMode == _other.optimizationMode &&
        alternatives == _other.alternatives &&
        departureTime == _other.departureTime;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + optimizationMode.hashCode;
    result = 31 * result + alternatives.hashCode;
    result = 31 * result + departureTime.hashCode;
    return result;
  }
}


// RouteOptions "private" section, not exported.

final _sdk_routing_RouteOptions_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Int32, Pointer<Void>),
    Pointer<Void> Function(int, int, Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_create_handle'));
final _sdk_routing_RouteOptions_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_release_handle'));
final _sdk_routing_RouteOptions_get_field_optimizationMode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_optimizationMode'));
final _sdk_routing_RouteOptions_get_field_alternatives = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_alternatives'));
final _sdk_routing_RouteOptions_get_field_departureTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_departureTime'));

Pointer<Void> sdk_routing_RouteOptions_toFfi(RouteOptions value) {
  final _optimizationMode_handle = sdk_routing_OptimizationMode_toFfi(value.optimizationMode);
  final _alternatives_handle = (value.alternatives);
  final _departureTime_handle = Date_toFfi_nullable(value.departureTime);
  final _result = _sdk_routing_RouteOptions_create_handle(_optimizationMode_handle, _alternatives_handle, _departureTime_handle);
  sdk_routing_OptimizationMode_releaseFfiHandle(_optimizationMode_handle);
  (_alternatives_handle);
  Date_releaseFfiHandle_nullable(_departureTime_handle);
  return _result;
}

RouteOptions sdk_routing_RouteOptions_fromFfi(Pointer<Void> handle) {
  final _optimizationMode_handle = _sdk_routing_RouteOptions_get_field_optimizationMode(handle);
  final _alternatives_handle = _sdk_routing_RouteOptions_get_field_alternatives(handle);
  final _departureTime_handle = _sdk_routing_RouteOptions_get_field_departureTime(handle);
  try {
    return RouteOptions(
      sdk_routing_OptimizationMode_fromFfi(_optimizationMode_handle), 
    
      (_alternatives_handle), 
    
      Date_fromFfi_nullable(_departureTime_handle)
    );
  } finally {
    sdk_routing_OptimizationMode_releaseFfiHandle(_optimizationMode_handle);
    (_alternatives_handle);
    Date_releaseFfiHandle_nullable(_departureTime_handle);
  }
}

void sdk_routing_RouteOptions_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_RouteOptions_release_handle(handle);

// Nullable RouteOptions

final _sdk_routing_RouteOptions_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_create_handle_nullable'));
final _sdk_routing_RouteOptions_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_release_handle_nullable'));
final _sdk_routing_RouteOptions_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_value_nullable'));

Pointer<Void> sdk_routing_RouteOptions_toFfi_nullable(RouteOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_RouteOptions_toFfi(value);
  final result = _sdk_routing_RouteOptions_create_handle_nullable(_handle);
  sdk_routing_RouteOptions_releaseFfiHandle(_handle);
  return result;
}

RouteOptions sdk_routing_RouteOptions_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_RouteOptions_get_value_nullable(handle);
  final result = sdk_routing_RouteOptions_fromFfi(_handle);
  sdk_routing_RouteOptions_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_RouteOptions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_RouteOptions_release_handle_nullable(handle);

// End of RouteOptions "private" section.

