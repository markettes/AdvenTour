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

/// @nodoc

class DynamicSpeedInfo {
  /// @nodoc
  double internalbaseSpeedInMetersPerSecond;

  /// @nodoc
  double internaltrafficSpeedInMetersPerSecond;

  /// @nodoc
  int internalturnTimeInSeconds;


  DynamicSpeedInfo(this.internalbaseSpeedInMetersPerSecond, this.internaltrafficSpeedInMetersPerSecond, this.internalturnTimeInSeconds);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! DynamicSpeedInfo) return false;
    DynamicSpeedInfo _other = other;
    return internalbaseSpeedInMetersPerSecond == _other.internalbaseSpeedInMetersPerSecond &&
        internaltrafficSpeedInMetersPerSecond == _other.internaltrafficSpeedInMetersPerSecond &&
        internalturnTimeInSeconds == _other.internalturnTimeInSeconds;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalbaseSpeedInMetersPerSecond.hashCode;
    result = 31 * result + internaltrafficSpeedInMetersPerSecond.hashCode;
    result = 31 * result + internalturnTimeInSeconds.hashCode;
    return result;
  }
}


// DynamicSpeedInfo "private" section, not exported.

final _sdk_routing_DynamicSpeedInfo_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Int32),
    Pointer<Void> Function(double, double, int)
  >('here_sdk_sdk_routing_DynamicSpeedInfo_create_handle'));
final _sdk_routing_DynamicSpeedInfo_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DynamicSpeedInfo_release_handle'));
final _sdk_routing_DynamicSpeedInfo_get_field_baseSpeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DynamicSpeedInfo_get_field_baseSpeedInMetersPerSecond'));
final _sdk_routing_DynamicSpeedInfo_get_field_trafficSpeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DynamicSpeedInfo_get_field_trafficSpeedInMetersPerSecond'));
final _sdk_routing_DynamicSpeedInfo_get_field_turnTimeInSeconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DynamicSpeedInfo_get_field_turnTimeInSeconds'));

Pointer<Void> sdk_routing_DynamicSpeedInfo_toFfi(DynamicSpeedInfo value) {
  final _baseSpeedInMetersPerSecond_handle = (value.internalbaseSpeedInMetersPerSecond);
  final _trafficSpeedInMetersPerSecond_handle = (value.internaltrafficSpeedInMetersPerSecond);
  final _turnTimeInSeconds_handle = (value.internalturnTimeInSeconds);
  final _result = _sdk_routing_DynamicSpeedInfo_create_handle(_baseSpeedInMetersPerSecond_handle, _trafficSpeedInMetersPerSecond_handle, _turnTimeInSeconds_handle);
  (_baseSpeedInMetersPerSecond_handle);
  (_trafficSpeedInMetersPerSecond_handle);
  (_turnTimeInSeconds_handle);
  return _result;
}

DynamicSpeedInfo sdk_routing_DynamicSpeedInfo_fromFfi(Pointer<Void> handle) {
  final _baseSpeedInMetersPerSecond_handle = _sdk_routing_DynamicSpeedInfo_get_field_baseSpeedInMetersPerSecond(handle);
  final _trafficSpeedInMetersPerSecond_handle = _sdk_routing_DynamicSpeedInfo_get_field_trafficSpeedInMetersPerSecond(handle);
  final _turnTimeInSeconds_handle = _sdk_routing_DynamicSpeedInfo_get_field_turnTimeInSeconds(handle);
  try {
    return DynamicSpeedInfo(
      (_baseSpeedInMetersPerSecond_handle), 
    
      (_trafficSpeedInMetersPerSecond_handle), 
    
      (_turnTimeInSeconds_handle)
    );
  } finally {
    (_baseSpeedInMetersPerSecond_handle);
    (_trafficSpeedInMetersPerSecond_handle);
    (_turnTimeInSeconds_handle);
  }
}

void sdk_routing_DynamicSpeedInfo_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_DynamicSpeedInfo_release_handle(handle);

// Nullable DynamicSpeedInfo

final _sdk_routing_DynamicSpeedInfo_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DynamicSpeedInfo_create_handle_nullable'));
final _sdk_routing_DynamicSpeedInfo_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DynamicSpeedInfo_release_handle_nullable'));
final _sdk_routing_DynamicSpeedInfo_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DynamicSpeedInfo_get_value_nullable'));

Pointer<Void> sdk_routing_DynamicSpeedInfo_toFfi_nullable(DynamicSpeedInfo value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_DynamicSpeedInfo_toFfi(value);
  final result = _sdk_routing_DynamicSpeedInfo_create_handle_nullable(_handle);
  sdk_routing_DynamicSpeedInfo_releaseFfiHandle(_handle);
  return result;
}

DynamicSpeedInfo sdk_routing_DynamicSpeedInfo_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_DynamicSpeedInfo_get_value_nullable(handle);
  final result = sdk_routing_DynamicSpeedInfo_fromFfi(_handle);
  sdk_routing_DynamicSpeedInfo_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_DynamicSpeedInfo_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_DynamicSpeedInfo_release_handle_nullable(handle);

// End of DynamicSpeedInfo "private" section.

