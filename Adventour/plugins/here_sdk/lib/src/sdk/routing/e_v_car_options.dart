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
import 'package:here_sdk/src/sdk/routing/avoidance_options.dart';
import 'package:here_sdk/src/sdk/routing/battery_specifications.dart';
import 'package:here_sdk/src/sdk/routing/e_v_consumption_model.dart';
import 'package:here_sdk/src/sdk/routing/route_options.dart';
import 'package:here_sdk/src/sdk/routing/route_text_options.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// All the options to specify how a route for an electric car should be calculated.

class EVCarOptions {
  /// Specifies the common route calculation options.
  RouteOptions routeOptions;

  /// Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  RouteTextOptions textOptions;

  /// Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.
  AvoidanceOptions avoidanceOptions;

  /// Ensure that the vehicle does not run out of energy along the way.
  /// Requires valid [EVCarOptions.batterySpecifications].
  /// It also requires that
  /// [RouteOptions.optimizationMode] = [OptimizationMode.fastest]
  /// and [RouteOptions.alternatives] = 0,
  /// otherwise the object is considerred invalid.
  /// Setting this flag enables calculation of a route optimized for electric vehicles.
  /// The charging stations are added along the route to ensure that the vehicle does
  /// not run out of energy along the way.
  /// It is especially useful for longer routes, because after all, charging stations are much
  /// less common than petrol stations.
  bool ensureReachability;

  /// Vehicle specific parameters, which are then used to calculate energy consumption
  /// for the vehicle on a given route.
  EVConsumptionModel consumptionModel;

  /// Parameters that describe the electric vehicle's battery.
  BatterySpecifications batterySpecifications;


  EVCarOptions(this.routeOptions, this.textOptions, this.avoidanceOptions, this.ensureReachability, this.consumptionModel, this.batterySpecifications);

  EVCarOptions.withDefaults()
    : routeOptions = RouteOptions.withDefaults(), textOptions = RouteTextOptions.withDefaults(), avoidanceOptions = AvoidanceOptions.withDefaults(), ensureReachability = false, consumptionModel = EVConsumptionModel.withDefaults(), batterySpecifications = BatterySpecifications.withDefaults();

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! EVCarOptions) return false;
    EVCarOptions _other = other;
    return routeOptions == _other.routeOptions &&
        textOptions == _other.textOptions &&
        avoidanceOptions == _other.avoidanceOptions &&
        ensureReachability == _other.ensureReachability &&
        consumptionModel == _other.consumptionModel &&
        batterySpecifications == _other.batterySpecifications;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + routeOptions.hashCode;
    result = 31 * result + textOptions.hashCode;
    result = 31 * result + avoidanceOptions.hashCode;
    result = 31 * result + ensureReachability.hashCode;
    result = 31 * result + consumptionModel.hashCode;
    result = 31 * result + batterySpecifications.hashCode;
    return result;
  }
}


// EVCarOptions "private" section, not exported.

final _sdk_routing_EVCarOptions_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint8, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, int, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_EVCarOptions_create_handle'));
final _sdk_routing_EVCarOptions_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVCarOptions_release_handle'));
final _sdk_routing_EVCarOptions_get_field_routeOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVCarOptions_get_field_routeOptions'));
final _sdk_routing_EVCarOptions_get_field_textOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVCarOptions_get_field_textOptions'));
final _sdk_routing_EVCarOptions_get_field_avoidanceOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVCarOptions_get_field_avoidanceOptions'));
final _sdk_routing_EVCarOptions_get_field_ensureReachability = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVCarOptions_get_field_ensureReachability'));
final _sdk_routing_EVCarOptions_get_field_consumptionModel = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVCarOptions_get_field_consumptionModel'));
final _sdk_routing_EVCarOptions_get_field_batterySpecifications = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVCarOptions_get_field_batterySpecifications'));

Pointer<Void> sdk_routing_EVCarOptions_toFfi(EVCarOptions value) {
  final _routeOptions_handle = sdk_routing_RouteOptions_toFfi(value.routeOptions);
  final _textOptions_handle = sdk_routing_RouteTextOptions_toFfi(value.textOptions);
  final _avoidanceOptions_handle = sdk_routing_AvoidanceOptions_toFfi(value.avoidanceOptions);
  final _ensureReachability_handle = Boolean_toFfi(value.ensureReachability);
  final _consumptionModel_handle = sdk_routing_EVConsumptionModel_toFfi(value.consumptionModel);
  final _batterySpecifications_handle = sdk_routing_BatterySpecifications_toFfi(value.batterySpecifications);
  final _result = _sdk_routing_EVCarOptions_create_handle(_routeOptions_handle, _textOptions_handle, _avoidanceOptions_handle, _ensureReachability_handle, _consumptionModel_handle, _batterySpecifications_handle);
  sdk_routing_RouteOptions_releaseFfiHandle(_routeOptions_handle);
  sdk_routing_RouteTextOptions_releaseFfiHandle(_textOptions_handle);
  sdk_routing_AvoidanceOptions_releaseFfiHandle(_avoidanceOptions_handle);
  Boolean_releaseFfiHandle(_ensureReachability_handle);
  sdk_routing_EVConsumptionModel_releaseFfiHandle(_consumptionModel_handle);
  sdk_routing_BatterySpecifications_releaseFfiHandle(_batterySpecifications_handle);
  return _result;
}

EVCarOptions sdk_routing_EVCarOptions_fromFfi(Pointer<Void> handle) {
  final _routeOptions_handle = _sdk_routing_EVCarOptions_get_field_routeOptions(handle);
  final _textOptions_handle = _sdk_routing_EVCarOptions_get_field_textOptions(handle);
  final _avoidanceOptions_handle = _sdk_routing_EVCarOptions_get_field_avoidanceOptions(handle);
  final _ensureReachability_handle = _sdk_routing_EVCarOptions_get_field_ensureReachability(handle);
  final _consumptionModel_handle = _sdk_routing_EVCarOptions_get_field_consumptionModel(handle);
  final _batterySpecifications_handle = _sdk_routing_EVCarOptions_get_field_batterySpecifications(handle);
  try {
    return EVCarOptions(
      sdk_routing_RouteOptions_fromFfi(_routeOptions_handle), 
    
      sdk_routing_RouteTextOptions_fromFfi(_textOptions_handle), 
    
      sdk_routing_AvoidanceOptions_fromFfi(_avoidanceOptions_handle), 
    
      Boolean_fromFfi(_ensureReachability_handle), 
    
      sdk_routing_EVConsumptionModel_fromFfi(_consumptionModel_handle), 
    
      sdk_routing_BatterySpecifications_fromFfi(_batterySpecifications_handle)
    );
  } finally {
    sdk_routing_RouteOptions_releaseFfiHandle(_routeOptions_handle);
    sdk_routing_RouteTextOptions_releaseFfiHandle(_textOptions_handle);
    sdk_routing_AvoidanceOptions_releaseFfiHandle(_avoidanceOptions_handle);
    Boolean_releaseFfiHandle(_ensureReachability_handle);
    sdk_routing_EVConsumptionModel_releaseFfiHandle(_consumptionModel_handle);
    sdk_routing_BatterySpecifications_releaseFfiHandle(_batterySpecifications_handle);
  }
}

void sdk_routing_EVCarOptions_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_EVCarOptions_release_handle(handle);

// Nullable EVCarOptions

final _sdk_routing_EVCarOptions_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVCarOptions_create_handle_nullable'));
final _sdk_routing_EVCarOptions_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVCarOptions_release_handle_nullable'));
final _sdk_routing_EVCarOptions_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVCarOptions_get_value_nullable'));

Pointer<Void> sdk_routing_EVCarOptions_toFfi_nullable(EVCarOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_EVCarOptions_toFfi(value);
  final result = _sdk_routing_EVCarOptions_create_handle_nullable(_handle);
  sdk_routing_EVCarOptions_releaseFfiHandle(_handle);
  return result;
}

EVCarOptions sdk_routing_EVCarOptions_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_EVCarOptions_get_value_nullable(handle);
  final result = sdk_routing_EVCarOptions_fromFfi(_handle);
  sdk_routing_EVCarOptions_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_EVCarOptions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_EVCarOptions_release_handle_nullable(handle);

// End of EVCarOptions "private" section.

