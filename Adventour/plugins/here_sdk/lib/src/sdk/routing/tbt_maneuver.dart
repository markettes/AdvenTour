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

class TbtManeuver {
  /// @nodoc
  int internaldistanceToNextManeuverInMeters;

  /// @nodoc
  int internalsectionIndex;

  /// @nodoc
  int internalrouteLinkIndex;


  TbtManeuver(this.internaldistanceToNextManeuverInMeters, this.internalsectionIndex, this.internalrouteLinkIndex);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! TbtManeuver) return false;
    TbtManeuver _other = other;
    return internaldistanceToNextManeuverInMeters == _other.internaldistanceToNextManeuverInMeters &&
        internalsectionIndex == _other.internalsectionIndex &&
        internalrouteLinkIndex == _other.internalrouteLinkIndex;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internaldistanceToNextManeuverInMeters.hashCode;
    result = 31 * result + internalsectionIndex.hashCode;
    result = 31 * result + internalrouteLinkIndex.hashCode;
    return result;
  }
}


// TbtManeuver "private" section, not exported.

final _sdk_routing_TbtManeuver_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint32, Int32),
    Pointer<Void> Function(int, int, int)
  >('here_sdk_sdk_routing_TbtManeuver_create_handle'));
final _sdk_routing_TbtManeuver_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuver_release_handle'));
final _sdk_routing_TbtManeuver_get_field_distanceToNextManeuverInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuver_get_field_distanceToNextManeuverInMeters'));
final _sdk_routing_TbtManeuver_get_field_sectionIndex = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuver_get_field_sectionIndex'));
final _sdk_routing_TbtManeuver_get_field_routeLinkIndex = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuver_get_field_routeLinkIndex'));

Pointer<Void> sdk_routing_TbtManeuver_toFfi(TbtManeuver value) {
  final _distanceToNextManeuverInMeters_handle = (value.internaldistanceToNextManeuverInMeters);
  final _sectionIndex_handle = (value.internalsectionIndex);
  final _routeLinkIndex_handle = (value.internalrouteLinkIndex);
  final _result = _sdk_routing_TbtManeuver_create_handle(_distanceToNextManeuverInMeters_handle, _sectionIndex_handle, _routeLinkIndex_handle);
  (_distanceToNextManeuverInMeters_handle);
  (_sectionIndex_handle);
  (_routeLinkIndex_handle);
  return _result;
}

TbtManeuver sdk_routing_TbtManeuver_fromFfi(Pointer<Void> handle) {
  final _distanceToNextManeuverInMeters_handle = _sdk_routing_TbtManeuver_get_field_distanceToNextManeuverInMeters(handle);
  final _sectionIndex_handle = _sdk_routing_TbtManeuver_get_field_sectionIndex(handle);
  final _routeLinkIndex_handle = _sdk_routing_TbtManeuver_get_field_routeLinkIndex(handle);
  try {
    return TbtManeuver(
      (_distanceToNextManeuverInMeters_handle), 
    
      (_sectionIndex_handle), 
    
      (_routeLinkIndex_handle)
    );
  } finally {
    (_distanceToNextManeuverInMeters_handle);
    (_sectionIndex_handle);
    (_routeLinkIndex_handle);
  }
}

void sdk_routing_TbtManeuver_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_TbtManeuver_release_handle(handle);

// Nullable TbtManeuver

final _sdk_routing_TbtManeuver_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuver_create_handle_nullable'));
final _sdk_routing_TbtManeuver_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuver_release_handle_nullable'));
final _sdk_routing_TbtManeuver_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TbtManeuver_get_value_nullable'));

Pointer<Void> sdk_routing_TbtManeuver_toFfi_nullable(TbtManeuver value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_TbtManeuver_toFfi(value);
  final result = _sdk_routing_TbtManeuver_create_handle_nullable(_handle);
  sdk_routing_TbtManeuver_releaseFfiHandle(_handle);
  return result;
}

TbtManeuver sdk_routing_TbtManeuver_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_TbtManeuver_get_value_nullable(handle);
  final result = sdk_routing_TbtManeuver_fromFfi(_handle);
  sdk_routing_TbtManeuver_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_TbtManeuver_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TbtManeuver_release_handle_nullable(handle);

// End of TbtManeuver "private" section.

