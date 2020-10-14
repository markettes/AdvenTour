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
import 'package:here_sdk/src/sdk/routing/calculate_route_callback.dart';
import 'package:here_sdk/src/sdk/routing/car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_truck_options.dart';
import 'package:here_sdk/src/sdk/routing/pedestrian_options.dart';
import 'package:here_sdk/src/sdk/routing/truck_options.dart';
import 'package:here_sdk/src/sdk/routing/waypoint.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

abstract class RoutingInterface {
  RoutingInterface() {}

  factory RoutingInterface.fromLambdas({
    @required void Function(List<Waypoint>, CarOptions, CalculateRouteCallback) lambda_calculateCarRoute,
    @required void Function(List<Waypoint>, PedestrianOptions, CalculateRouteCallback) lambda_calculatePedestrianRoute,
    @required void Function(List<Waypoint>, TruckOptions, CalculateRouteCallback) lambda_calculateTruckRoute,
    @required void Function(List<Waypoint>, EVCarOptions, CalculateRouteCallback) lambda_calculateEVCarRoute,
    @required void Function(List<Waypoint>, EVTruckOptions, CalculateRouteCallback) lambda_calculateEVTruckRoute
  }) => RoutingInterface$Lambdas(
    lambda_calculateCarRoute,
    lambda_calculatePedestrianRoute,
    lambda_calculateTruckRoute,
    lambda_calculateEVCarRoute,
    lambda_calculateEVTruckRoute
  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Asynchronously calculates a car route from one point to another,
  /// passing through the given waypoints in the given order.
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when it contains waypoints of type other than
  /// [WaypointType.stopover].
  /// [carOptions] Options specific for car route calculation, along with
  /// common route options.
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  calculateCarRoute(List<Waypoint> waypoints, CarOptions carOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates a pedestrian route from one point to another,
  /// passing through the given waypoints in the given order.
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when it contains waypoints of type other than
  /// [WaypointType.stopover].
  /// [pedestrianOptions] Options specific for pedestrian route calculation, along with
  /// common route options. Note that [OptimizationMode.shortest] is
  /// is not supported for pedestrians and converted to
  /// [OptimizationMode.fastest] automatically.
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  calculatePedestrianRoute(List<Waypoint> waypoints, PedestrianOptions pedestrianOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates a truck route from one point to another,
  /// passing through the given waypoints in the given order.
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when it contains waypoints of type other than
  /// [WaypointType.stopover].
  /// [truckOptions] Options specific for truck route calculation, along with
  /// common route options.
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  calculateTruckRoute(List<Waypoint> waypoints, TruckOptions truckOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates an electric car route from one point to another,
  /// passing through the given waypoints in the given order.
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when it contains waypoints of type other than
  /// [WaypointType.stopover].
  /// [evCarOptions] Options specific for an electric car route calculation, along with
  /// common route options.
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  calculateEVCarRoute(List<Waypoint> waypoints, EVCarOptions evCarOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates an electic truck route from one point to another,
  /// passing through the given waypoints in the given order.
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when it contains waypoints of type other than
  /// [WaypointType.stopover].
  /// [evTruckOptions] Options specific for an electric truck route calculation, along with
  /// common route options.
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  calculateEVTruckRoute(List<Waypoint> waypoints, EVTruckOptions evTruckOptions, CalculateRouteCallback callback);
}


// RoutingInterface "private" section, not exported.

final _sdk_routing_RoutingInterface_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingInterface_copy_handle'));
final _sdk_routing_RoutingInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingInterface_release_handle'));
final _sdk_routing_RoutingInterface_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_routing_RoutingInterface_create_proxy'));
final _sdk_routing_RoutingInterface_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_routing_RoutingInterface_get_raw_pointer'));
final _sdk_routing_RoutingInterface_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingInterface_get_type_id'));






class RoutingInterface$Lambdas implements RoutingInterface {
  void Function(List<Waypoint>, CarOptions, CalculateRouteCallback) lambda_calculateCarRoute;
  void Function(List<Waypoint>, PedestrianOptions, CalculateRouteCallback) lambda_calculatePedestrianRoute;
  void Function(List<Waypoint>, TruckOptions, CalculateRouteCallback) lambda_calculateTruckRoute;
  void Function(List<Waypoint>, EVCarOptions, CalculateRouteCallback) lambda_calculateEVCarRoute;
  void Function(List<Waypoint>, EVTruckOptions, CalculateRouteCallback) lambda_calculateEVTruckRoute;

  RoutingInterface$Lambdas(
    void Function(List<Waypoint>, CarOptions, CalculateRouteCallback) lambda_calculateCarRoute,
    void Function(List<Waypoint>, PedestrianOptions, CalculateRouteCallback) lambda_calculatePedestrianRoute,
    void Function(List<Waypoint>, TruckOptions, CalculateRouteCallback) lambda_calculateTruckRoute,
    void Function(List<Waypoint>, EVCarOptions, CalculateRouteCallback) lambda_calculateEVCarRoute,
    void Function(List<Waypoint>, EVTruckOptions, CalculateRouteCallback) lambda_calculateEVTruckRoute
  ) {
    this.lambda_calculateCarRoute = lambda_calculateCarRoute;
    this.lambda_calculatePedestrianRoute = lambda_calculatePedestrianRoute;
    this.lambda_calculateTruckRoute = lambda_calculateTruckRoute;
    this.lambda_calculateEVCarRoute = lambda_calculateEVCarRoute;
    this.lambda_calculateEVTruckRoute = lambda_calculateEVTruckRoute;

  }

  @override
  void release() {}

  @override
  calculateCarRoute(List<Waypoint> waypoints, CarOptions carOptions, CalculateRouteCallback callback) =>
    lambda_calculateCarRoute(waypoints, carOptions, callback);
  @override
  calculatePedestrianRoute(List<Waypoint> waypoints, PedestrianOptions pedestrianOptions, CalculateRouteCallback callback) =>
    lambda_calculatePedestrianRoute(waypoints, pedestrianOptions, callback);
  @override
  calculateTruckRoute(List<Waypoint> waypoints, TruckOptions truckOptions, CalculateRouteCallback callback) =>
    lambda_calculateTruckRoute(waypoints, truckOptions, callback);
  @override
  calculateEVCarRoute(List<Waypoint> waypoints, EVCarOptions evCarOptions, CalculateRouteCallback callback) =>
    lambda_calculateEVCarRoute(waypoints, evCarOptions, callback);
  @override
  calculateEVTruckRoute(List<Waypoint> waypoints, EVTruckOptions evTruckOptions, CalculateRouteCallback callback) =>
    lambda_calculateEVTruckRoute(waypoints, evTruckOptions, callback);
}

class RoutingInterface$Impl implements RoutingInterface {
  @protected
  Pointer<Void> handle;
  RoutingInterface$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_routing_RoutingInterface_get_raw_pointer(handle));
    _sdk_routing_RoutingInterface_release_handle(handle);
    handle = null;
  }

  @override
  calculateCarRoute(List<Waypoint> waypoints, CarOptions carOptions, CalculateRouteCallback callback) {
    final _calculateCarRoute_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_1sdk_1routing_1Waypoint_CarOptions_CalculateRouteCallback'));
    final _waypoints_handle = heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_toFfi(waypoints);
    final _carOptions_handle = sdk_routing_CarOptions_toFfi(carOptions);
    final _callback_handle = sdk_routing_CalculateRouteCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _calculateCarRoute_ffi(_handle, __lib.LibraryContext.isolateId, _waypoints_handle, _carOptions_handle, _callback_handle);
    heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(_waypoints_handle);
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
    final _waypoints_handle = heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_toFfi(waypoints);
    final _pedestrianOptions_handle = sdk_routing_PedestrianOptions_toFfi(pedestrianOptions);
    final _callback_handle = sdk_routing_CalculateRouteCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _calculatePedestrianRoute_ffi(_handle, __lib.LibraryContext.isolateId, _waypoints_handle, _pedestrianOptions_handle, _callback_handle);
    heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(_waypoints_handle);
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
    final _waypoints_handle = heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_toFfi(waypoints);
    final _truckOptions_handle = sdk_routing_TruckOptions_toFfi(truckOptions);
    final _callback_handle = sdk_routing_CalculateRouteCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _calculateTruckRoute_ffi(_handle, __lib.LibraryContext.isolateId, _waypoints_handle, _truckOptions_handle, _callback_handle);
    heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(_waypoints_handle);
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
    final _waypoints_handle = heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_toFfi(waypoints);
    final _evCarOptions_handle = sdk_routing_EVCarOptions_toFfi(evCarOptions);
    final _callback_handle = sdk_routing_CalculateRouteCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _calculateEVCarRoute_ffi(_handle, __lib.LibraryContext.isolateId, _waypoints_handle, _evCarOptions_handle, _callback_handle);
    heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(_waypoints_handle);
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
    final _waypoints_handle = heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_toFfi(waypoints);
    final _evTruckOptions_handle = sdk_routing_EVTruckOptions_toFfi(evTruckOptions);
    final _callback_handle = sdk_routing_CalculateRouteCallback_toFfi(callback);
    final _handle = this.handle;
    final __result_handle = _calculateEVTruckRoute_ffi(_handle, __lib.LibraryContext.isolateId, _waypoints_handle, _evTruckOptions_handle, _callback_handle);
    heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(_waypoints_handle);
    sdk_routing_EVTruckOptions_releaseFfiHandle(_evTruckOptions_handle);
    sdk_routing_CalculateRouteCallback_releaseFfiHandle(_callback_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


}

int _RoutingInterface_calculateCarRoute_static(int _token, Pointer<Void> waypoints, Pointer<Void> carOptions, Pointer<Void> callback) {

  try {
    (__lib.instanceCache[_token] as RoutingInterface).calculateCarRoute(heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_fromFfi(waypoints), sdk_routing_CarOptions_fromFfi(carOptions), sdk_routing_CalculateRouteCallback_fromFfi(callback));
  } finally {
    heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(waypoints);
    sdk_routing_CarOptions_releaseFfiHandle(carOptions);
    sdk_routing_CalculateRouteCallback_releaseFfiHandle(callback);
  }
  return 0;
}
int _RoutingInterface_calculatePedestrianRoute_static(int _token, Pointer<Void> waypoints, Pointer<Void> pedestrianOptions, Pointer<Void> callback) {

  try {
    (__lib.instanceCache[_token] as RoutingInterface).calculatePedestrianRoute(heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_fromFfi(waypoints), sdk_routing_PedestrianOptions_fromFfi(pedestrianOptions), sdk_routing_CalculateRouteCallback_fromFfi(callback));
  } finally {
    heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(waypoints);
    sdk_routing_PedestrianOptions_releaseFfiHandle(pedestrianOptions);
    sdk_routing_CalculateRouteCallback_releaseFfiHandle(callback);
  }
  return 0;
}
int _RoutingInterface_calculateTruckRoute_static(int _token, Pointer<Void> waypoints, Pointer<Void> truckOptions, Pointer<Void> callback) {

  try {
    (__lib.instanceCache[_token] as RoutingInterface).calculateTruckRoute(heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_fromFfi(waypoints), sdk_routing_TruckOptions_fromFfi(truckOptions), sdk_routing_CalculateRouteCallback_fromFfi(callback));
  } finally {
    heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(waypoints);
    sdk_routing_TruckOptions_releaseFfiHandle(truckOptions);
    sdk_routing_CalculateRouteCallback_releaseFfiHandle(callback);
  }
  return 0;
}
int _RoutingInterface_calculateEVCarRoute_static(int _token, Pointer<Void> waypoints, Pointer<Void> evCarOptions, Pointer<Void> callback) {

  try {
    (__lib.instanceCache[_token] as RoutingInterface).calculateEVCarRoute(heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_fromFfi(waypoints), sdk_routing_EVCarOptions_fromFfi(evCarOptions), sdk_routing_CalculateRouteCallback_fromFfi(callback));
  } finally {
    heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(waypoints);
    sdk_routing_EVCarOptions_releaseFfiHandle(evCarOptions);
    sdk_routing_CalculateRouteCallback_releaseFfiHandle(callback);
  }
  return 0;
}
int _RoutingInterface_calculateEVTruckRoute_static(int _token, Pointer<Void> waypoints, Pointer<Void> evTruckOptions, Pointer<Void> callback) {

  try {
    (__lib.instanceCache[_token] as RoutingInterface).calculateEVTruckRoute(heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_fromFfi(waypoints), sdk_routing_EVTruckOptions_fromFfi(evTruckOptions), sdk_routing_CalculateRouteCallback_fromFfi(callback));
  } finally {
    heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(waypoints);
    sdk_routing_EVTruckOptions_releaseFfiHandle(evTruckOptions);
    sdk_routing_CalculateRouteCallback_releaseFfiHandle(callback);
  }
  return 0;
}


Pointer<Void> sdk_routing_RoutingInterface_toFfi(RoutingInterface value) {
  if (value is RoutingInterface$Impl) return _sdk_routing_RoutingInterface_copy_handle(value.handle);

  final result = _sdk_routing_RoutingInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Void>, Pointer<Void>)>(_RoutingInterface_calculateCarRoute_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Void>, Pointer<Void>)>(_RoutingInterface_calculatePedestrianRoute_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Void>, Pointer<Void>)>(_RoutingInterface_calculateTruckRoute_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Void>, Pointer<Void>)>(_RoutingInterface_calculateEVCarRoute_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Void>, Pointer<Void>)>(_RoutingInterface_calculateEVTruckRoute_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_routing_RoutingInterface_get_raw_pointer(result)] = value;

  return result;
}

RoutingInterface sdk_routing_RoutingInterface_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_routing_RoutingInterface_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as RoutingInterface;
  if (instance != null) return instance;

  final _type_id_handle = _sdk_routing_RoutingInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_routing_RoutingInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : RoutingInterface$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_routing_RoutingInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_routing_RoutingInterface_release_handle(handle);

Pointer<Void> sdk_routing_RoutingInterface_toFfi_nullable(RoutingInterface value) =>
  value != null ? sdk_routing_RoutingInterface_toFfi(value) : Pointer<Void>.fromAddress(0);

RoutingInterface sdk_routing_RoutingInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_routing_RoutingInterface_fromFfi(handle) : null;

void sdk_routing_RoutingInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_RoutingInterface_release_handle(handle);

// End of RoutingInterface "private" section.

