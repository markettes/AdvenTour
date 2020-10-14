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

/// The additional information that is available for electric vehicles.

class EVDetails {
  /// Estimated net energy consumption (in kWh). Note that it can be negative due to
  /// energy recuperation.
  double consumptionInKilowattHour;


  EVDetails(this.consumptionInKilowattHour);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! EVDetails) return false;
    EVDetails _other = other;
    return consumptionInKilowattHour == _other.consumptionInKilowattHour;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + consumptionInKilowattHour.hashCode;
    return result;
  }
}


// EVDetails "private" section, not exported.

final _sdk_routing_EVDetails_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('here_sdk_sdk_routing_EVDetails_create_handle'));
final _sdk_routing_EVDetails_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVDetails_release_handle'));
final _sdk_routing_EVDetails_get_field_consumptionInKilowattHour = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVDetails_get_field_consumptionInKilowattHour'));

Pointer<Void> sdk_routing_EVDetails_toFfi(EVDetails value) {
  final _consumptionInKilowattHour_handle = (value.consumptionInKilowattHour);
  final _result = _sdk_routing_EVDetails_create_handle(_consumptionInKilowattHour_handle);
  (_consumptionInKilowattHour_handle);
  return _result;
}

EVDetails sdk_routing_EVDetails_fromFfi(Pointer<Void> handle) {
  final _consumptionInKilowattHour_handle = _sdk_routing_EVDetails_get_field_consumptionInKilowattHour(handle);
  try {
    return EVDetails(
      (_consumptionInKilowattHour_handle)
    );
  } finally {
    (_consumptionInKilowattHour_handle);
  }
}

void sdk_routing_EVDetails_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_EVDetails_release_handle(handle);

// Nullable EVDetails

final _sdk_routing_EVDetails_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVDetails_create_handle_nullable'));
final _sdk_routing_EVDetails_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVDetails_release_handle_nullable'));
final _sdk_routing_EVDetails_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVDetails_get_value_nullable'));

Pointer<Void> sdk_routing_EVDetails_toFfi_nullable(EVDetails value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_EVDetails_toFfi(value);
  final result = _sdk_routing_EVDetails_create_handle_nullable(_handle);
  sdk_routing_EVDetails_releaseFfiHandle(_handle);
  return result;
}

EVDetails sdk_routing_EVDetails_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_EVDetails_get_value_nullable(handle);
  final result = sdk_routing_EVDetails_fromFfi(_handle);
  sdk_routing_EVDetails_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_EVDetails_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_EVDetails_release_handle_nullable(handle);

// End of EVDetails "private" section.

