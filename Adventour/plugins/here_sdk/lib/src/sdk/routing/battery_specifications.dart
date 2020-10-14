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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/charging_connector_type.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Parameters that describe the electric vehicle's battery.

class BatterySpecifications {
  /// Total capacity of the vehicle's battery (in kWh).
  double totalCapacityInKilowattHours;

  /// Charge level of the vehicle's battery at the start of the route (in kWh).
  /// It must be less than or equal to the value of
  /// [BatterySpecifications.totalCapacityInKilowattHours],
  /// otherwise the [BatterySpecifications] instance is considered invalid.
  double initialChargeInKilowattHours;

  /// Maximum charge to which the battery should be charged at a charging station (in kWh).
  /// It must be less than or equal to the value of
  /// [BatterySpecifications.totalCapacityInKilowattHours],
  /// otherwise the [BatterySpecifications] instance is considered invalid.
  double targetChargeInKilowattHours;

  /// Function curve describing the maximum battery charging rate (in kW) at a given charge
  /// level (in kWh).
  /// Map keys represent charge levels that are non-negative floating point values
  /// in units of (kWh).
  /// Map values represent charging rate values that are positive floating point values
  /// in units of (kW).
  /// Given charge levels must cover the entire range of
  /// \[0, [BatterySpecifications.targetChargeInKilowattHours]\],
  /// otherwise the [BatterySpecifications] instance is considered invalid.
  /// The charging curve is considerred piecewise constant instead of being interpolated.
  Map<double, double> chargingCurve;

  /// List of available charging connector types.
  /// It must be at least one charging connector type added, otherwise
  /// the [BatterySpecifications] instance is considered invalid.
  List<ChargingConnectorType> connectorTypes;


  BatterySpecifications(this.totalCapacityInKilowattHours, this.initialChargeInKilowattHours, this.targetChargeInKilowattHours, this.chargingCurve, this.connectorTypes);

  BatterySpecifications.withDefaults()
    : totalCapacityInKilowattHours = 0.0, initialChargeInKilowattHours = 0.0, targetChargeInKilowattHours = 0.0, chargingCurve = {}, connectorTypes = [];

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! BatterySpecifications) return false;
    BatterySpecifications _other = other;
    return totalCapacityInKilowattHours == _other.totalCapacityInKilowattHours &&
        initialChargeInKilowattHours == _other.initialChargeInKilowattHours &&
        targetChargeInKilowattHours == _other.targetChargeInKilowattHours &&
        DeepCollectionEquality().equals(chargingCurve, _other.chargingCurve) &&
        DeepCollectionEquality().equals(connectorTypes, _other.connectorTypes);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + totalCapacityInKilowattHours.hashCode;
    result = 31 * result + initialChargeInKilowattHours.hashCode;
    result = 31 * result + targetChargeInKilowattHours.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(chargingCurve);
    result = 31 * result + DeepCollectionEquality().hash(connectorTypes);
    return result;
  }
}


// BatterySpecifications "private" section, not exported.

final _sdk_routing_BatterySpecifications_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Double, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(double, double, double, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_create_handle'));
final _sdk_routing_BatterySpecifications_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_release_handle'));
final _sdk_routing_BatterySpecifications_get_field_totalCapacityInKilowattHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_field_totalCapacityInKilowattHours'));
final _sdk_routing_BatterySpecifications_get_field_initialChargeInKilowattHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_field_initialChargeInKilowattHours'));
final _sdk_routing_BatterySpecifications_get_field_targetChargeInKilowattHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_field_targetChargeInKilowattHours'));
final _sdk_routing_BatterySpecifications_get_field_chargingCurve = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_field_chargingCurve'));
final _sdk_routing_BatterySpecifications_get_field_connectorTypes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_field_connectorTypes'));

Pointer<Void> sdk_routing_BatterySpecifications_toFfi(BatterySpecifications value) {
  final _totalCapacityInKilowattHours_handle = (value.totalCapacityInKilowattHours);
  final _initialChargeInKilowattHours_handle = (value.initialChargeInKilowattHours);
  final _targetChargeInKilowattHours_handle = (value.targetChargeInKilowattHours);
  final _chargingCurve_handle = heresdk_routing_common_bindings_MapOf_Double_to_Double_toFfi(value.chargingCurve);
  final _connectorTypes_handle = heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_toFfi(value.connectorTypes);
  final _result = _sdk_routing_BatterySpecifications_create_handle(_totalCapacityInKilowattHours_handle, _initialChargeInKilowattHours_handle, _targetChargeInKilowattHours_handle, _chargingCurve_handle, _connectorTypes_handle);
  (_totalCapacityInKilowattHours_handle);
  (_initialChargeInKilowattHours_handle);
  (_targetChargeInKilowattHours_handle);
  heresdk_routing_common_bindings_MapOf_Double_to_Double_releaseFfiHandle(_chargingCurve_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_releaseFfiHandle(_connectorTypes_handle);
  return _result;
}

BatterySpecifications sdk_routing_BatterySpecifications_fromFfi(Pointer<Void> handle) {
  final _totalCapacityInKilowattHours_handle = _sdk_routing_BatterySpecifications_get_field_totalCapacityInKilowattHours(handle);
  final _initialChargeInKilowattHours_handle = _sdk_routing_BatterySpecifications_get_field_initialChargeInKilowattHours(handle);
  final _targetChargeInKilowattHours_handle = _sdk_routing_BatterySpecifications_get_field_targetChargeInKilowattHours(handle);
  final _chargingCurve_handle = _sdk_routing_BatterySpecifications_get_field_chargingCurve(handle);
  final _connectorTypes_handle = _sdk_routing_BatterySpecifications_get_field_connectorTypes(handle);
  try {
    return BatterySpecifications(
      (_totalCapacityInKilowattHours_handle), 
    
      (_initialChargeInKilowattHours_handle), 
    
      (_targetChargeInKilowattHours_handle), 
    
      heresdk_routing_common_bindings_MapOf_Double_to_Double_fromFfi(_chargingCurve_handle), 
    
      heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_fromFfi(_connectorTypes_handle)
    );
  } finally {
    (_totalCapacityInKilowattHours_handle);
    (_initialChargeInKilowattHours_handle);
    (_targetChargeInKilowattHours_handle);
    heresdk_routing_common_bindings_MapOf_Double_to_Double_releaseFfiHandle(_chargingCurve_handle);
    heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_releaseFfiHandle(_connectorTypes_handle);
  }
}

void sdk_routing_BatterySpecifications_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_BatterySpecifications_release_handle(handle);

// Nullable BatterySpecifications

final _sdk_routing_BatterySpecifications_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_create_handle_nullable'));
final _sdk_routing_BatterySpecifications_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_release_handle_nullable'));
final _sdk_routing_BatterySpecifications_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_value_nullable'));

Pointer<Void> sdk_routing_BatterySpecifications_toFfi_nullable(BatterySpecifications value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_BatterySpecifications_toFfi(value);
  final result = _sdk_routing_BatterySpecifications_create_handle_nullable(_handle);
  sdk_routing_BatterySpecifications_releaseFfiHandle(_handle);
  return result;
}

BatterySpecifications sdk_routing_BatterySpecifications_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_BatterySpecifications_get_value_nullable(handle);
  final result = sdk_routing_BatterySpecifications_fromFfi(_handle);
  sdk_routing_BatterySpecifications_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_BatterySpecifications_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_BatterySpecifications_release_handle_nullable(handle);

// End of BatterySpecifications "private" section.

