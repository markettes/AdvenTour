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
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;



/// Represents a circle area in 2D space.
///
/// An instance of this class can be used during the creation of the MapCircle
/// to represent a circle on the map.
@immutable
class GeoCircle {
  /// Center of circle.
  final GeoCoordinates center;

  /// Radius in meters.
  final double radiusInMeters;


  const GeoCircle._(this.center, this.radiusInMeters);
  GeoCircle._copy(GeoCircle _other) : this._(_other.center, _other.radiusInMeters);

  /// Creates a new instance of a GeoCircle.
  /// [center] Center of circle.
  /// [radiusInMeters] Radius in meters.
  @Deprecated("Will be removed in v4.5.0, use the variant that accepts a Double instead.")

  GeoCircle.withFloat(GeoCoordinates center, double radiusInMeters) : this._copy(_withFloat(center, radiusInMeters));

  /// Creates a new instance of a GeoCircle.
  /// [center] Center of circle.
  /// [radiusInMeters] Radius in meters.
  GeoCircle(GeoCoordinates center, double radiusInMeters) : this._copy(_$init(center, radiusInMeters));

  /// Creates a new instance of a GeoCircle.
  /// [center] Center of circle.
  /// [radiusInMeters] Radius in meters.
  @Deprecated("Will be removed in v4.5.0, use the variant that accepts a Double instead.")

  static GeoCircle _withFloat(GeoCoordinates center, double radiusInMeters) {
    final _withFloat_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Float), Pointer<Void> Function(int, Pointer<Void>, double)>('here_sdk_sdk_core_GeoCircle_make__GeoCoordinates_Float'));
    final _center_handle = sdk_core_GeoCoordinates_toFfi(center);
    final _radiusInMeters_handle = (radiusInMeters);
    final __result_handle = _withFloat_ffi(__lib.LibraryContext.isolateId, _center_handle, _radiusInMeters_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_center_handle);
    (_radiusInMeters_handle);
    try {
      return sdk_core_GeoCircle_fromFfi(__result_handle);
    } finally {
      sdk_core_GeoCircle_releaseFfiHandle(__result_handle);
    }
  }

  /// Creates a new instance of a GeoCircle.
  /// [center] Center of circle.
  /// [radiusInMeters] Radius in meters.
  static GeoCircle _$init(GeoCoordinates center, double radiusInMeters) {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Double), Pointer<Void> Function(int, Pointer<Void>, double)>('here_sdk_sdk_core_GeoCircle_make__GeoCoordinates_Double'));
    final _center_handle = sdk_core_GeoCoordinates_toFfi(center);
    final _radiusInMeters_handle = (radiusInMeters);
    final __result_handle = _$init_ffi(__lib.LibraryContext.isolateId, _center_handle, _radiusInMeters_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_center_handle);
    (_radiusInMeters_handle);
    try {
      return sdk_core_GeoCircle_fromFfi(__result_handle);
    } finally {
      sdk_core_GeoCircle_releaseFfiHandle(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! GeoCircle) return false;
    GeoCircle _other = other;
    return center == _other.center &&
        radiusInMeters == _other.radiusInMeters;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + center.hashCode;
    result = 31 * result + radiusInMeters.hashCode;
    return result;
  }
}


// GeoCircle "private" section, not exported.

final _sdk_core_GeoCircle_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Double),
    Pointer<Void> Function(Pointer<Void>, double)
  >('here_sdk_sdk_core_GeoCircle_create_handle'));
final _sdk_core_GeoCircle_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCircle_release_handle'));
final _sdk_core_GeoCircle_get_field_center = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCircle_get_field_center'));
final _sdk_core_GeoCircle_get_field_radiusInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCircle_get_field_radiusInMeters'));

Pointer<Void> sdk_core_GeoCircle_toFfi(GeoCircle value) {
  final _center_handle = sdk_core_GeoCoordinates_toFfi(value.center);
  final _radiusInMeters_handle = (value.radiusInMeters);
  final _result = _sdk_core_GeoCircle_create_handle(_center_handle, _radiusInMeters_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle(_center_handle);
  (_radiusInMeters_handle);
  return _result;
}

GeoCircle sdk_core_GeoCircle_fromFfi(Pointer<Void> handle) {
  final _center_handle = _sdk_core_GeoCircle_get_field_center(handle);
  final _radiusInMeters_handle = _sdk_core_GeoCircle_get_field_radiusInMeters(handle);
  try {
    return GeoCircle._(
      sdk_core_GeoCoordinates_fromFfi(_center_handle), 
    
      (_radiusInMeters_handle)
    );
  } finally {
    sdk_core_GeoCoordinates_releaseFfiHandle(_center_handle);
    (_radiusInMeters_handle);
  }
}

void sdk_core_GeoCircle_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_GeoCircle_release_handle(handle);

// Nullable GeoCircle

final _sdk_core_GeoCircle_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCircle_create_handle_nullable'));
final _sdk_core_GeoCircle_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCircle_release_handle_nullable'));
final _sdk_core_GeoCircle_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCircle_get_value_nullable'));

Pointer<Void> sdk_core_GeoCircle_toFfi_nullable(GeoCircle value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_GeoCircle_toFfi(value);
  final result = _sdk_core_GeoCircle_create_handle_nullable(_handle);
  sdk_core_GeoCircle_releaseFfiHandle(_handle);
  return result;
}

GeoCircle sdk_core_GeoCircle_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_GeoCircle_get_value_nullable(handle);
  final result = sdk_core_GeoCircle_fromFfi(_handle);
  sdk_core_GeoCircle_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_GeoCircle_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_GeoCircle_release_handle_nullable(handle);

// End of GeoCircle "private" section.

