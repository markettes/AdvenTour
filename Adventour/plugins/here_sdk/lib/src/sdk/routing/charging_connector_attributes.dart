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
import 'package:here_sdk/src/sdk/routing/charging_connector_type.dart';
import 'package:here_sdk/src/sdk/routing/charging_supply_type.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Details of the connector that is suggested to be used in the section's
/// [PostAction]'s for charging.

class ChargingConnectorAttributes {
  /// Power supplied by the suggested connector in kW.
  double powerInKilowatts;

  /// Current of the suggested connector in Ampere.
  double currentInAmperes;

  /// Voltage of the suggested connector in Volt.
  double voltageInVolts;

  /// Supply type of the suggested connector.
  ChargingSupplyType supplyType;

  /// Suggested connector for charging at this station.
  ChargingConnectorType connectorType;


  ChargingConnectorAttributes(this.powerInKilowatts, this.currentInAmperes, this.voltageInVolts, this.supplyType, this.connectorType);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! ChargingConnectorAttributes) return false;
    ChargingConnectorAttributes _other = other;
    return powerInKilowatts == _other.powerInKilowatts &&
        currentInAmperes == _other.currentInAmperes &&
        voltageInVolts == _other.voltageInVolts &&
        supplyType == _other.supplyType &&
        connectorType == _other.connectorType;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + powerInKilowatts.hashCode;
    result = 31 * result + currentInAmperes.hashCode;
    result = 31 * result + voltageInVolts.hashCode;
    result = 31 * result + supplyType.hashCode;
    result = 31 * result + connectorType.hashCode;
    return result;
  }
}


// ChargingConnectorAttributes "private" section, not exported.

final _sdk_routing_ChargingConnectorAttributes_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(double, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_create_handle'));
final _sdk_routing_ChargingConnectorAttributes_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_release_handle'));
final _sdk_routing_ChargingConnectorAttributes_get_field_powerInKilowatts = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_get_field_powerInKilowatts'));
final _sdk_routing_ChargingConnectorAttributes_get_field_currentInAmperes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_get_field_currentInAmperes'));
final _sdk_routing_ChargingConnectorAttributes_get_field_voltageInVolts = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_get_field_voltageInVolts'));
final _sdk_routing_ChargingConnectorAttributes_get_field_supplyType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_get_field_supplyType'));
final _sdk_routing_ChargingConnectorAttributes_get_field_connectorType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_get_field_connectorType'));

Pointer<Void> sdk_routing_ChargingConnectorAttributes_toFfi(ChargingConnectorAttributes value) {
  final _powerInKilowatts_handle = (value.powerInKilowatts);
  final _currentInAmperes_handle = Double_toFfi_nullable(value.currentInAmperes);
  final _voltageInVolts_handle = Double_toFfi_nullable(value.voltageInVolts);
  final _supplyType_handle = sdk_routing_ChargingSupplyType_toFfi_nullable(value.supplyType);
  final _connectorType_handle = sdk_routing_ChargingConnectorType_toFfi_nullable(value.connectorType);
  final _result = _sdk_routing_ChargingConnectorAttributes_create_handle(_powerInKilowatts_handle, _currentInAmperes_handle, _voltageInVolts_handle, _supplyType_handle, _connectorType_handle);
  (_powerInKilowatts_handle);
  Double_releaseFfiHandle_nullable(_currentInAmperes_handle);
  Double_releaseFfiHandle_nullable(_voltageInVolts_handle);
  sdk_routing_ChargingSupplyType_releaseFfiHandle_nullable(_supplyType_handle);
  sdk_routing_ChargingConnectorType_releaseFfiHandle_nullable(_connectorType_handle);
  return _result;
}

ChargingConnectorAttributes sdk_routing_ChargingConnectorAttributes_fromFfi(Pointer<Void> handle) {
  final _powerInKilowatts_handle = _sdk_routing_ChargingConnectorAttributes_get_field_powerInKilowatts(handle);
  final _currentInAmperes_handle = _sdk_routing_ChargingConnectorAttributes_get_field_currentInAmperes(handle);
  final _voltageInVolts_handle = _sdk_routing_ChargingConnectorAttributes_get_field_voltageInVolts(handle);
  final _supplyType_handle = _sdk_routing_ChargingConnectorAttributes_get_field_supplyType(handle);
  final _connectorType_handle = _sdk_routing_ChargingConnectorAttributes_get_field_connectorType(handle);
  try {
    return ChargingConnectorAttributes(
      (_powerInKilowatts_handle), 
    
      Double_fromFfi_nullable(_currentInAmperes_handle), 
    
      Double_fromFfi_nullable(_voltageInVolts_handle), 
    
      sdk_routing_ChargingSupplyType_fromFfi_nullable(_supplyType_handle), 
    
      sdk_routing_ChargingConnectorType_fromFfi_nullable(_connectorType_handle)
    );
  } finally {
    (_powerInKilowatts_handle);
    Double_releaseFfiHandle_nullable(_currentInAmperes_handle);
    Double_releaseFfiHandle_nullable(_voltageInVolts_handle);
    sdk_routing_ChargingSupplyType_releaseFfiHandle_nullable(_supplyType_handle);
    sdk_routing_ChargingConnectorType_releaseFfiHandle_nullable(_connectorType_handle);
  }
}

void sdk_routing_ChargingConnectorAttributes_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_ChargingConnectorAttributes_release_handle(handle);

// Nullable ChargingConnectorAttributes

final _sdk_routing_ChargingConnectorAttributes_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_create_handle_nullable'));
final _sdk_routing_ChargingConnectorAttributes_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_release_handle_nullable'));
final _sdk_routing_ChargingConnectorAttributes_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_get_value_nullable'));

Pointer<Void> sdk_routing_ChargingConnectorAttributes_toFfi_nullable(ChargingConnectorAttributes value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_ChargingConnectorAttributes_toFfi(value);
  final result = _sdk_routing_ChargingConnectorAttributes_create_handle_nullable(_handle);
  sdk_routing_ChargingConnectorAttributes_releaseFfiHandle(_handle);
  return result;
}

ChargingConnectorAttributes sdk_routing_ChargingConnectorAttributes_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_ChargingConnectorAttributes_get_value_nullable(handle);
  final result = sdk_routing_ChargingConnectorAttributes_fromFfi(_handle);
  sdk_routing_ChargingConnectorAttributes_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_ChargingConnectorAttributes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_ChargingConnectorAttributes_release_handle_nullable(handle);

// End of ChargingConnectorAttributes "private" section.

