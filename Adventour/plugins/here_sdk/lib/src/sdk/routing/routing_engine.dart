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

import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/routing/calculate_route_callback.dart';
import 'package:here_sdk/src/sdk/routing/car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_truck_options.dart';
import 'package:here_sdk/src/sdk/routing/pedestrian_options.dart';
import 'package:here_sdk/src/sdk/routing/routing_interface.dart';
import 'package:here_sdk/src/sdk/routing/truck_options.dart';
import 'package:here_sdk/src/sdk/routing/waypoint.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Use the RoutingEngine to calculate a route from A to B with
/// a number of waypoints in between.
///
/// Route calculation is done asynchronously and requires an
/// online connection. The resulting route contains various
/// information such as the polyline, route length in meters,
/// estimated time to traverse along the route and maneuver data.
abstract class RoutingEngine implements RoutingInterface {
  /// Creates a new instance of this class.
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  factory RoutingEngine() => RoutingEngine$Impl.$init();
  /// Creates a new instance of RoutingEngine.
  /// [sdkEngine] An SDKEngine instance.
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  factory RoutingEngine.withSdkEngine(SDKNativeEngine sdkEngine) => RoutingEngine$Impl.withSdkEngine(sdkEngine);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

}


// RoutingEngine "private" section, not exported.

final _sdk_routing_RoutingEngine_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_copy_handle'));
final _sdk_routing_RoutingEngine_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_release_handle'));
final _sdk_routing_RoutingEngine_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_routing_RoutingEngine_get_raw_pointer'));
final _sdk_routing_RoutingEngine_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_get_type_id'));

final _$init_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_make_return_release_handle'));
final _$init_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_make_return_get_result'));
final _$init_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_make_return_get_error'));
final _$init_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_make_return_has_error'));


final _withSdkEngine_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_make__SDKNativeEngine_return_release_handle'));
final _withSdkEngine_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_make__SDKNativeEngine_return_get_result'));
final _withSdkEngine_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_make__SDKNativeEngine_return_get_error'));
final _withSdkEngine_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingEngine_make__SDKNativeEngine_return_has_error'));


class RoutingEngine$Impl implements RoutingEngine {
  @protected
  Pointer<Void> handle;

  RoutingEngine$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_routing_RoutingEngine_get_raw_pointer(handle));
    _sdk_routing_RoutingEngine_release_handle(handle);
    handle = null;
  }


  RoutingEngine$Impl.$init() : handle = _$init() {
    __lib.reverseCache[_sdk_routing_RoutingEngine_get_raw_pointer(handle)] = this;
  }


  RoutingEngine$Impl.withSdkEngine(SDKNativeEngine sdkEngine) : handle = _withSdkEngine(sdkEngine) {
    __lib.reverseCache[_sdk_routing_RoutingEngine_get_raw_pointer(handle)] = this;
  }

  static Pointer<Void> _$init() {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_routing_RoutingEngine_make'));
    final __call_result_handle = _$init_ffi(__lib.LibraryContext.isolateId);
    if (_$init_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _$init_return_get_error(__call_result_handle);
        _$init_return_release_handle(__call_result_handle);
        try {
          throw InstantiationException(sdk_core_errors_InstantiationErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_core_errors_InstantiationErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _$init_return_get_result(__call_result_handle);
    _$init_return_release_handle(__call_result_handle);
    return __result_handle;
  }

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine) {
    final _withSdkEngine_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RoutingEngine_make__SDKNativeEngine'));
    final _sdkEngine_handle = sdk_core_engine_SDKNativeEngine_toFfi(sdkEngine);
    final __call_result_handle = _withSdkEngine_ffi(__lib.LibraryContext.isolateId, _sdkEngine_handle);
    sdk_core_engine_SDKNativeEngine_releaseFfiHandle(_sdkEngine_handle);
    if (_withSdkEngine_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _withSdkEngine_return_get_error(__call_result_handle);
        _withSdkEngine_return_release_handle(__call_result_handle);
        try {
          throw InstantiationException(sdk_core_errors_InstantiationErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_core_errors_InstantiationErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _withSdkEngine_return_get_result(__call_result_handle);
    _withSdkEngine_return_release_handle(__call_result_handle);
    return __result_handle;
  }

  @override
  calculateCarRoute(List<Waypoint> waypoints, CarOptions carOptions, CalculateRouteCallback callback) {
    final _calculateCarRoute_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_1sdk_1routing_1Waypoint_CarOptions_CalculateRouteCallback'));
    final _waypoints_handle = heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_toFfi(waypoints);
    final _carOptions_handle = sdk_routing_CarOptions_toFfi(carOptions);
    final _callback_handle = sdk_routing_CalculateRouteCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _calculateCarRoute_ffi(_handle, __lib.LibraryContext.isolateId, _waypoints_handle, _carOptions_handle, _callback_handle);
    heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(_waypoints_handle);
    sdk_routing_CarOptions_releaseFfiHandle(_carOptions_handle);
    sdk_routing_CalculateRouteCallback_releaseFfiHandle(_callback_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  calculatePedestrianRoute(List<Waypoint> waypoints, PedestrianOptions pedestrianOptions, CalculateRouteCallback callback) {
    final _calculatePedestrianRoute_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_1sdk_1routing_1Waypoint_PedestrianOptions_CalculateRouteCallback'));
    final _waypoints_handle = heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_toFfi(waypoints);
    final _pedestrianOptions_handle = sdk_routing_PedestrianOptions_toFfi(pedestrianOptions);
    final _callback_handle = sdk_routing_CalculateRouteCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _calculatePedestrianRoute_ffi(_handle, __lib.LibraryContext.isolateId, _waypoints_handle, _pedestrianOptions_handle, _callback_handle);
    heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(_waypoints_handle);
    sdk_routing_PedestrianOptions_releaseFfiHandle(_pedestrianOptions_handle);
    sdk_routing_CalculateRouteCallback_releaseFfiHandle(_callback_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  calculateTruckRoute(List<Waypoint> waypoints, TruckOptions truckOptions, CalculateRouteCallback callback) {
    final _calculateTruckRoute_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_1sdk_1routing_1Waypoint_TruckOptions_CalculateRouteCallback'));
    final _waypoints_handle = heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_toFfi(waypoints);
    final _truckOptions_handle = sdk_routing_TruckOptions_toFfi(truckOptions);
    final _callback_handle = sdk_routing_CalculateRouteCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _calculateTruckRoute_ffi(_handle, __lib.LibraryContext.isolateId, _waypoints_handle, _truckOptions_handle, _callback_handle);
    heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(_waypoints_handle);
    sdk_routing_TruckOptions_releaseFfiHandle(_truckOptions_handle);
    sdk_routing_CalculateRouteCallback_releaseFfiHandle(_callback_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  calculateEVCarRoute(List<Waypoint> waypoints, EVCarOptions evCarOptions, CalculateRouteCallback callback) {
    final _calculateEVCarRoute_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_1sdk_1routing_1Waypoint_EVCarOptions_CalculateRouteCallback'));
    final _waypoints_handle = heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_toFfi(waypoints);
    final _evCarOptions_handle = sdk_routing_EVCarOptions_toFfi(evCarOptions);
    final _callback_handle = sdk_routing_CalculateRouteCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _calculateEVCarRoute_ffi(_handle, __lib.LibraryContext.isolateId, _waypoints_handle, _evCarOptions_handle, _callback_handle);
    heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(_waypoints_handle);
    sdk_routing_EVCarOptions_releaseFfiHandle(_evCarOptions_handle);
    sdk_routing_CalculateRouteCallback_releaseFfiHandle(_callback_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  calculateEVTruckRoute(List<Waypoint> waypoints, EVTruckOptions evTruckOptions, CalculateRouteCallback callback) {
    final _calculateEVTruckRoute_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_1sdk_1routing_1Waypoint_EVTruckOptions_CalculateRouteCallback'));
    final _waypoints_handle = heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_toFfi(waypoints);
    final _evTruckOptions_handle = sdk_routing_EVTruckOptions_toFfi(evTruckOptions);
    final _callback_handle = sdk_routing_CalculateRouteCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _calculateEVTruckRoute_ffi(_handle, __lib.LibraryContext.isolateId, _waypoints_handle, _evTruckOptions_handle, _callback_handle);
    heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(_waypoints_handle);
    sdk_routing_EVTruckOptions_releaseFfiHandle(_evTruckOptions_handle);
    sdk_routing_CalculateRouteCallback_releaseFfiHandle(_callback_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


}

Pointer<Void> sdk_routing_RoutingEngine_toFfi(RoutingEngine value) =>
  _sdk_routing_RoutingEngine_copy_handle((value as RoutingEngine$Impl).handle);

RoutingEngine sdk_routing_RoutingEngine_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_routing_RoutingEngine_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as RoutingEngine;
  if (instance != null) return instance;

  final _type_id_handle = _sdk_routing_RoutingEngine_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_routing_RoutingEngine_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : RoutingEngine$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_routing_RoutingEngine_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_routing_RoutingEngine_release_handle(handle);

Pointer<Void> sdk_routing_RoutingEngine_toFfi_nullable(RoutingEngine value) =>
  value != null ? sdk_routing_RoutingEngine_toFfi(value) : Pointer<Void>.fromAddress(0);

RoutingEngine sdk_routing_RoutingEngine_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_routing_RoutingEngine_fromFfi(handle) : null;

void sdk_routing_RoutingEngine_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_RoutingEngine_release_handle(handle);

// End of RoutingEngine "private" section.

