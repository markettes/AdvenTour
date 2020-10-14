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

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Truck specifications such as dimensions and weight.

class TruckSpecifications {
  /// Truck weight including trailers and shipped goods in kilograms. The provided value
  /// must be greater or equal to 0. When not set, possible weight restrictions will not be
  /// taken into consideration for route calculation.
  int grossWeightInKilograms;

  /// Truck weight per axle in kilograms. The provided value must be greater or equal to 0.
  /// When not set, possible weight per axle restrictions will not be taken into
  /// consideration for route calculation.
  int weightPerAxleInKilograms;

  /// Truck height in centimeters. The provided value must be in the range \[0, 5000\]. When not
  /// set, possible height restrictions will not be taken into consideration for route
  /// calculation.
  int heightInCentimeters;

  /// Truck width in centimeters. The provided value must be in the range \[0, 5000\]. When not
  /// set, possible width restrictions will not be taken into consideration for route
  /// calculation.
  int widthInCentimeters;

  /// Truck length in centimeters. The provided value must be in the range \[0, 30000\]. When
  /// not set, possible length restrictions will not be taken into consideration for route
  /// calculation.
  int lengthInCentimeters;

  /// Defines total number of axles in the vehicle. The provided value must be greater or
  /// equal to 2. When not set, possible axle count restrictions will not be taken into
  /// consideration for route calculation.
  int axleCount;


  TruckSpecifications(this.grossWeightInKilograms, this.weightPerAxleInKilograms, this.heightInCentimeters, this.widthInCentimeters, this.lengthInCentimeters, this.axleCount);

  TruckSpecifications.withDefaults()
    : grossWeightInKilograms = null, weightPerAxleInKilograms = null, heightInCentimeters = null, widthInCentimeters = null, lengthInCentimeters = null, axleCount = null;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! TruckSpecifications) return false;
    TruckSpecifications _other = other;
    return grossWeightInKilograms == _other.grossWeightInKilograms &&
        weightPerAxleInKilograms == _other.weightPerAxleInKilograms &&
        heightInCentimeters == _other.heightInCentimeters &&
        widthInCentimeters == _other.widthInCentimeters &&
        lengthInCentimeters == _other.lengthInCentimeters &&
        axleCount == _other.axleCount;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + grossWeightInKilograms.hashCode;
    result = 31 * result + weightPerAxleInKilograms.hashCode;
    result = 31 * result + heightInCentimeters.hashCode;
    result = 31 * result + widthInCentimeters.hashCode;
    result = 31 * result + lengthInCentimeters.hashCode;
    result = 31 * result + axleCount.hashCode;
    return result;
  }
}


// TruckSpecifications "private" section, not exported.

final _sdk_routing_TruckSpecifications_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_create_handle'));
final _sdk_routing_TruckSpecifications_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_release_handle'));
final _sdk_routing_TruckSpecifications_get_field_grossWeightInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_field_grossWeightInKilograms'));
final _sdk_routing_TruckSpecifications_get_field_weightPerAxleInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_field_weightPerAxleInKilograms'));
final _sdk_routing_TruckSpecifications_get_field_heightInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_field_heightInCentimeters'));
final _sdk_routing_TruckSpecifications_get_field_widthInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_field_widthInCentimeters'));
final _sdk_routing_TruckSpecifications_get_field_lengthInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_field_lengthInCentimeters'));
final _sdk_routing_TruckSpecifications_get_field_axleCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_field_axleCount'));

Pointer<Void> sdk_routing_TruckSpecifications_toFfi(TruckSpecifications value) {
  final _grossWeightInKilograms_handle = Int_toFfi_nullable(value.grossWeightInKilograms);
  final _weightPerAxleInKilograms_handle = Int_toFfi_nullable(value.weightPerAxleInKilograms);
  final _heightInCentimeters_handle = Int_toFfi_nullable(value.heightInCentimeters);
  final _widthInCentimeters_handle = Int_toFfi_nullable(value.widthInCentimeters);
  final _lengthInCentimeters_handle = Int_toFfi_nullable(value.lengthInCentimeters);
  final _axleCount_handle = Int_toFfi_nullable(value.axleCount);
  final _result = _sdk_routing_TruckSpecifications_create_handle(_grossWeightInKilograms_handle, _weightPerAxleInKilograms_handle, _heightInCentimeters_handle, _widthInCentimeters_handle, _lengthInCentimeters_handle, _axleCount_handle);
  Int_releaseFfiHandle_nullable(_grossWeightInKilograms_handle);
  Int_releaseFfiHandle_nullable(_weightPerAxleInKilograms_handle);
  Int_releaseFfiHandle_nullable(_heightInCentimeters_handle);
  Int_releaseFfiHandle_nullable(_widthInCentimeters_handle);
  Int_releaseFfiHandle_nullable(_lengthInCentimeters_handle);
  Int_releaseFfiHandle_nullable(_axleCount_handle);
  return _result;
}

TruckSpecifications sdk_routing_TruckSpecifications_fromFfi(Pointer<Void> handle) {
  final _grossWeightInKilograms_handle = _sdk_routing_TruckSpecifications_get_field_grossWeightInKilograms(handle);
  final _weightPerAxleInKilograms_handle = _sdk_routing_TruckSpecifications_get_field_weightPerAxleInKilograms(handle);
  final _heightInCentimeters_handle = _sdk_routing_TruckSpecifications_get_field_heightInCentimeters(handle);
  final _widthInCentimeters_handle = _sdk_routing_TruckSpecifications_get_field_widthInCentimeters(handle);
  final _lengthInCentimeters_handle = _sdk_routing_TruckSpecifications_get_field_lengthInCentimeters(handle);
  final _axleCount_handle = _sdk_routing_TruckSpecifications_get_field_axleCount(handle);
  try {
    return TruckSpecifications(
      Int_fromFfi_nullable(_grossWeightInKilograms_handle), 
    
      Int_fromFfi_nullable(_weightPerAxleInKilograms_handle), 
    
      Int_fromFfi_nullable(_heightInCentimeters_handle), 
    
      Int_fromFfi_nullable(_widthInCentimeters_handle), 
    
      Int_fromFfi_nullable(_lengthInCentimeters_handle), 
    
      Int_fromFfi_nullable(_axleCount_handle)
    );
  } finally {
    Int_releaseFfiHandle_nullable(_grossWeightInKilograms_handle);
    Int_releaseFfiHandle_nullable(_weightPerAxleInKilograms_handle);
    Int_releaseFfiHandle_nullable(_heightInCentimeters_handle);
    Int_releaseFfiHandle_nullable(_widthInCentimeters_handle);
    Int_releaseFfiHandle_nullable(_lengthInCentimeters_handle);
    Int_releaseFfiHandle_nullable(_axleCount_handle);
  }
}

void sdk_routing_TruckSpecifications_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_TruckSpecifications_release_handle(handle);

// Nullable TruckSpecifications

final _sdk_routing_TruckSpecifications_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_create_handle_nullable'));
final _sdk_routing_TruckSpecifications_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_release_handle_nullable'));
final _sdk_routing_TruckSpecifications_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckSpecifications_get_value_nullable'));

Pointer<Void> sdk_routing_TruckSpecifications_toFfi_nullable(TruckSpecifications value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_TruckSpecifications_toFfi(value);
  final result = _sdk_routing_TruckSpecifications_create_handle_nullable(_handle);
  sdk_routing_TruckSpecifications_releaseFfiHandle(_handle);
  return result;
}

TruckSpecifications sdk_routing_TruckSpecifications_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_TruckSpecifications_get_value_nullable(handle);
  final result = sdk_routing_TruckSpecifications_fromFfi(_handle);
  sdk_routing_TruckSpecifications_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_TruckSpecifications_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TruckSpecifications_release_handle_nullable(handle);

// End of TruckSpecifications "private" section.

