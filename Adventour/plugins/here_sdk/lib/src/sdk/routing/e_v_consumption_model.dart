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

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Parameters specific for the electric vehicle, which are then used to calculate
/// energy consumption on a given route.

class EVConsumptionModel {
  /// Rate of energy consumed per meter rise in elevation (in Wh/m, i.e., Watt-hours per meter).
  double ascentConsumptionInWattHoursPerMeter;

  /// Rate of energy recovered per meter fall in elevation (in Wh/m, i.e., Watt-hours per meter).
  double descentRecoveryInWattHoursPerMeter;

  /// Free flow speed table describes energy consumption when travelling at constant speed.
  /// It defines a function curve specifying consumption rate at a given free flow speed
  /// on a flat stretch of road.
  /// Map keys represent speed values that are non-negative integers in units of (km/h).
  /// Map values represent consumption values that are non-negative floating point values
  /// in units of (Wh/m).
  /// The function is linearly interpolated between each successive pair of data points.
  Map<int, double> freeFlowSpeedTable;

  /// Traffic speed table describes energy consumption when travelling under heavy traffic
  /// conditions, i.e. when the vehicle is expected to often change the travel speed.
  /// It defines a function curve specifying consumption rate at a given speed under traffic
  /// conditions on a flat stretch of road.
  /// Map keys represent speed values that are non-negative integers in units of (km/h).
  /// Map values represent consumption values that are non-negative floating point values
  /// in units of (Wh/m).
  /// The function is linearly interpolated between each successive pair of data points.
  /// If [EVConsumptionModel.trafficSpeedTable] is empty then only
  /// [EVConsumptionModel.freeFlowSpeedTable] is used for calculating speed-related
  /// energy consumption.
  Map<int, double> trafficSpeedTable;

  /// Rate of energy (in Wh/s) consumed by the vehicle's auxiliary systems
  /// (e.g., air conditioning, lights) per second of travel.
  double auxiliaryConsumptionInWattHoursPerSecond;


  EVConsumptionModel(this.ascentConsumptionInWattHoursPerMeter, this.descentRecoveryInWattHoursPerMeter, this.freeFlowSpeedTable, this.trafficSpeedTable, this.auxiliaryConsumptionInWattHoursPerSecond);

  EVConsumptionModel.withDefaults()
    : ascentConsumptionInWattHoursPerMeter = 0.0, descentRecoveryInWattHoursPerMeter = 0.0, freeFlowSpeedTable = {}, trafficSpeedTable = {}, auxiliaryConsumptionInWattHoursPerSecond = 0.0;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! EVConsumptionModel) return false;
    EVConsumptionModel _other = other;
    return ascentConsumptionInWattHoursPerMeter == _other.ascentConsumptionInWattHoursPerMeter &&
        descentRecoveryInWattHoursPerMeter == _other.descentRecoveryInWattHoursPerMeter &&
        DeepCollectionEquality().equals(freeFlowSpeedTable, _other.freeFlowSpeedTable) &&
        DeepCollectionEquality().equals(trafficSpeedTable, _other.trafficSpeedTable) &&
        auxiliaryConsumptionInWattHoursPerSecond == _other.auxiliaryConsumptionInWattHoursPerSecond;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + ascentConsumptionInWattHoursPerMeter.hashCode;
    result = 31 * result + descentRecoveryInWattHoursPerMeter.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(freeFlowSpeedTable);
    result = 31 * result + DeepCollectionEquality().hash(trafficSpeedTable);
    result = 31 * result + auxiliaryConsumptionInWattHoursPerSecond.hashCode;
    return result;
  }
}


// EVConsumptionModel "private" section, not exported.

final _sdk_routing_EVConsumptionModel_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Pointer<Void>, Pointer<Void>, Double),
    Pointer<Void> Function(double, double, Pointer<Void>, Pointer<Void>, double)
  >('here_sdk_sdk_routing_EVConsumptionModel_create_handle'));
final _sdk_routing_EVConsumptionModel_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_release_handle'));
final _sdk_routing_EVConsumptionModel_get_field_ascentConsumptionInWattHoursPerMeter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_get_field_ascentConsumptionInWattHoursPerMeter'));
final _sdk_routing_EVConsumptionModel_get_field_descentRecoveryInWattHoursPerMeter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_get_field_descentRecoveryInWattHoursPerMeter'));
final _sdk_routing_EVConsumptionModel_get_field_freeFlowSpeedTable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_get_field_freeFlowSpeedTable'));
final _sdk_routing_EVConsumptionModel_get_field_trafficSpeedTable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_get_field_trafficSpeedTable'));
final _sdk_routing_EVConsumptionModel_get_field_auxiliaryConsumptionInWattHoursPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_get_field_auxiliaryConsumptionInWattHoursPerSecond'));

Pointer<Void> sdk_routing_EVConsumptionModel_toFfi(EVConsumptionModel value) {
  final _ascentConsumptionInWattHoursPerMeter_handle = (value.ascentConsumptionInWattHoursPerMeter);
  final _descentRecoveryInWattHoursPerMeter_handle = (value.descentRecoveryInWattHoursPerMeter);
  final _freeFlowSpeedTable_handle = heresdk_routing_common_bindings_MapOf_Int_to_Double_toFfi(value.freeFlowSpeedTable);
  final _trafficSpeedTable_handle = heresdk_routing_common_bindings_MapOf_Int_to_Double_toFfi(value.trafficSpeedTable);
  final _auxiliaryConsumptionInWattHoursPerSecond_handle = (value.auxiliaryConsumptionInWattHoursPerSecond);
  final _result = _sdk_routing_EVConsumptionModel_create_handle(_ascentConsumptionInWattHoursPerMeter_handle, _descentRecoveryInWattHoursPerMeter_handle, _freeFlowSpeedTable_handle, _trafficSpeedTable_handle, _auxiliaryConsumptionInWattHoursPerSecond_handle);
  (_ascentConsumptionInWattHoursPerMeter_handle);
  (_descentRecoveryInWattHoursPerMeter_handle);
  heresdk_routing_common_bindings_MapOf_Int_to_Double_releaseFfiHandle(_freeFlowSpeedTable_handle);
  heresdk_routing_common_bindings_MapOf_Int_to_Double_releaseFfiHandle(_trafficSpeedTable_handle);
  (_auxiliaryConsumptionInWattHoursPerSecond_handle);
  return _result;
}

EVConsumptionModel sdk_routing_EVConsumptionModel_fromFfi(Pointer<Void> handle) {
  final _ascentConsumptionInWattHoursPerMeter_handle = _sdk_routing_EVConsumptionModel_get_field_ascentConsumptionInWattHoursPerMeter(handle);
  final _descentRecoveryInWattHoursPerMeter_handle = _sdk_routing_EVConsumptionModel_get_field_descentRecoveryInWattHoursPerMeter(handle);
  final _freeFlowSpeedTable_handle = _sdk_routing_EVConsumptionModel_get_field_freeFlowSpeedTable(handle);
  final _trafficSpeedTable_handle = _sdk_routing_EVConsumptionModel_get_field_trafficSpeedTable(handle);
  final _auxiliaryConsumptionInWattHoursPerSecond_handle = _sdk_routing_EVConsumptionModel_get_field_auxiliaryConsumptionInWattHoursPerSecond(handle);
  try {
    return EVConsumptionModel(
      (_ascentConsumptionInWattHoursPerMeter_handle), 
    
      (_descentRecoveryInWattHoursPerMeter_handle), 
    
      heresdk_routing_common_bindings_MapOf_Int_to_Double_fromFfi(_freeFlowSpeedTable_handle), 
    
      heresdk_routing_common_bindings_MapOf_Int_to_Double_fromFfi(_trafficSpeedTable_handle), 
    
      (_auxiliaryConsumptionInWattHoursPerSecond_handle)
    );
  } finally {
    (_ascentConsumptionInWattHoursPerMeter_handle);
    (_descentRecoveryInWattHoursPerMeter_handle);
    heresdk_routing_common_bindings_MapOf_Int_to_Double_releaseFfiHandle(_freeFlowSpeedTable_handle);
    heresdk_routing_common_bindings_MapOf_Int_to_Double_releaseFfiHandle(_trafficSpeedTable_handle);
    (_auxiliaryConsumptionInWattHoursPerSecond_handle);
  }
}

void sdk_routing_EVConsumptionModel_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_EVConsumptionModel_release_handle(handle);

// Nullable EVConsumptionModel

final _sdk_routing_EVConsumptionModel_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_create_handle_nullable'));
final _sdk_routing_EVConsumptionModel_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_release_handle_nullable'));
final _sdk_routing_EVConsumptionModel_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_get_value_nullable'));

Pointer<Void> sdk_routing_EVConsumptionModel_toFfi_nullable(EVConsumptionModel value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_EVConsumptionModel_toFfi(value);
  final result = _sdk_routing_EVConsumptionModel_create_handle_nullable(_handle);
  sdk_routing_EVConsumptionModel_releaseFfiHandle(_handle);
  return result;
}

EVConsumptionModel sdk_routing_EVConsumptionModel_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_EVConsumptionModel_get_value_nullable(handle);
  final result = sdk_routing_EVConsumptionModel_fromFfi(_handle);
  sdk_routing_EVConsumptionModel_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_EVConsumptionModel_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_EVConsumptionModel_release_handle_nullable(handle);

// End of EVConsumptionModel "private" section.

