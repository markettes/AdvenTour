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

/// The traffic speed information.

class TrafficSpeed {
  /// Initial index over [Section] polyline for which the traffic speed
  /// information is valid. The valid range end is either the offset of the next one,
  /// or to the end of the polyline if there are no other traffic speed information.
  int offset;

  /// Expected travel speed in regular conditions.
  double baseSpeedInMetersPerSecond;

  /// Travel speed in current traffic conditions.
  double trafficSpeedInMetersPerSecond;

  /// The traffic jam factor shows the traffic condition in a numeric way. It is a
  /// value in the range \[0.0, 10.0\]. A large jamFactor value means more traffic jam
  /// in general. Specifically, 0.0 means free traffic and 10.0 means stationary traffic.
  double jamFactor;


  TrafficSpeed(this.offset, this.baseSpeedInMetersPerSecond, this.trafficSpeedInMetersPerSecond, this.jamFactor);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! TrafficSpeed) return false;
    TrafficSpeed _other = other;
    return offset == _other.offset &&
        baseSpeedInMetersPerSecond == _other.baseSpeedInMetersPerSecond &&
        trafficSpeedInMetersPerSecond == _other.trafficSpeedInMetersPerSecond &&
        jamFactor == _other.jamFactor;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + offset.hashCode;
    result = 31 * result + baseSpeedInMetersPerSecond.hashCode;
    result = 31 * result + trafficSpeedInMetersPerSecond.hashCode;
    result = 31 * result + jamFactor.hashCode;
    return result;
  }
}


// TrafficSpeed "private" section, not exported.

final _sdk_routing_TrafficSpeed_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_create_handle'));
final _sdk_routing_TrafficSpeed_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_release_handle'));
final _sdk_routing_TrafficSpeed_get_field_offset = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_get_field_offset'));
final _sdk_routing_TrafficSpeed_get_field_baseSpeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_get_field_baseSpeedInMetersPerSecond'));
final _sdk_routing_TrafficSpeed_get_field_trafficSpeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_get_field_trafficSpeedInMetersPerSecond'));
final _sdk_routing_TrafficSpeed_get_field_jamFactor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_get_field_jamFactor'));

Pointer<Void> sdk_routing_TrafficSpeed_toFfi(TrafficSpeed value) {
  final _offset_handle = (value.offset);
  final _baseSpeedInMetersPerSecond_handle = Double_toFfi_nullable(value.baseSpeedInMetersPerSecond);
  final _trafficSpeedInMetersPerSecond_handle = Double_toFfi_nullable(value.trafficSpeedInMetersPerSecond);
  final _jamFactor_handle = Double_toFfi_nullable(value.jamFactor);
  final _result = _sdk_routing_TrafficSpeed_create_handle(_offset_handle, _baseSpeedInMetersPerSecond_handle, _trafficSpeedInMetersPerSecond_handle, _jamFactor_handle);
  (_offset_handle);
  Double_releaseFfiHandle_nullable(_baseSpeedInMetersPerSecond_handle);
  Double_releaseFfiHandle_nullable(_trafficSpeedInMetersPerSecond_handle);
  Double_releaseFfiHandle_nullable(_jamFactor_handle);
  return _result;
}

TrafficSpeed sdk_routing_TrafficSpeed_fromFfi(Pointer<Void> handle) {
  final _offset_handle = _sdk_routing_TrafficSpeed_get_field_offset(handle);
  final _baseSpeedInMetersPerSecond_handle = _sdk_routing_TrafficSpeed_get_field_baseSpeedInMetersPerSecond(handle);
  final _trafficSpeedInMetersPerSecond_handle = _sdk_routing_TrafficSpeed_get_field_trafficSpeedInMetersPerSecond(handle);
  final _jamFactor_handle = _sdk_routing_TrafficSpeed_get_field_jamFactor(handle);
  try {
    return TrafficSpeed(
      (_offset_handle), 
    
      Double_fromFfi_nullable(_baseSpeedInMetersPerSecond_handle), 
    
      Double_fromFfi_nullable(_trafficSpeedInMetersPerSecond_handle), 
    
      Double_fromFfi_nullable(_jamFactor_handle)
    );
  } finally {
    (_offset_handle);
    Double_releaseFfiHandle_nullable(_baseSpeedInMetersPerSecond_handle);
    Double_releaseFfiHandle_nullable(_trafficSpeedInMetersPerSecond_handle);
    Double_releaseFfiHandle_nullable(_jamFactor_handle);
  }
}

void sdk_routing_TrafficSpeed_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_TrafficSpeed_release_handle(handle);

// Nullable TrafficSpeed

final _sdk_routing_TrafficSpeed_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_create_handle_nullable'));
final _sdk_routing_TrafficSpeed_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_release_handle_nullable'));
final _sdk_routing_TrafficSpeed_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficSpeed_get_value_nullable'));

Pointer<Void> sdk_routing_TrafficSpeed_toFfi_nullable(TrafficSpeed value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_TrafficSpeed_toFfi(value);
  final result = _sdk_routing_TrafficSpeed_create_handle_nullable(_handle);
  sdk_routing_TrafficSpeed_releaseFfiHandle(_handle);
  return result;
}

TrafficSpeed sdk_routing_TrafficSpeed_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_TrafficSpeed_get_value_nullable(handle);
  final result = sdk_routing_TrafficSpeed_fromFfi(_handle);
  sdk_routing_TrafficSpeed_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_TrafficSpeed_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TrafficSpeed_release_handle_nullable(handle);

// End of TrafficSpeed "private" section.

