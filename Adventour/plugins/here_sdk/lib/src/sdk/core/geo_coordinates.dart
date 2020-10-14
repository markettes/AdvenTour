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





/// Represents geographical coordinates in 3D space.
@immutable
class GeoCoordinates {
  /// Latitude in degrees.
  final double latitude;

  /// Longitude in degrees.
  final double longitude;

  /// Optional altitude in meters.
  /// By convention, on iOS devices, altitude is set as meters relative to the
  /// mean sea level.
  /// On Android devices, altitude is set as meters relative to the WGS 84
  /// reference ellipsoid.
  final double altitude;


  const GeoCoordinates._(this.latitude, this.longitude, this.altitude);
  GeoCoordinates._copy(GeoCoordinates _other) : this._(_other.latitude, _other.longitude, _other.altitude);

  /// Constructs a GeoCoordinates from the provided lat, long, alt values.
  ///
  /// Corrects values of lat and long if they exceed the ranges.
  /// [latitude] Latitude in degrees. Positive value means Northern hemisphere.
  /// If the value is out of range of \[-90.0, 90.0\] it's clamped to that range.
  /// NaN value is converted to 0.0.
  /// [longitude] Longitude in degrees. Positive value means Eastern hemisphere.
  /// If the value is out of range of \[-180.0, 180.0\] it's replaced with a value
  /// within the range, representing effectively the same meridian.
  /// NaN value is converted to 0.0.
  /// [altitude] Altitude in meters. NaN value is converted to `null`.
  GeoCoordinates.withAltitude(double latitude, double longitude, double altitude) : this._copy(_withAltitude(latitude, longitude, altitude));


  /// [latitude] Latitude in degrees. Positive value means Northern hemisphere.
  /// If the value is out of range of \[-90.0, 90.0\] it's clamped to that range.
  /// NaN value is converted to 0.0.
  /// [longitude] Longitude in degrees. Positive value means Eastern hemisphere.
  /// If the value is out of range of \[-180.0, 180.0\] it's replaced with a value
  /// within the range, representing effectively the same meridian.
  /// NaN value is converted to 0.0.
  GeoCoordinates(double latitude, double longitude) : this._copy(_$init(latitude, longitude));

  /// Computes distance (in meters) along the great circle between two points.
  ///
  /// This method ignores altitude of both points.
  /// [point] Coordinates of the point to which the distance is computed.
  /// Returns [double]. distance in meters.
  double distanceTo(GeoCoordinates point) {
    final _distanceTo_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Pointer<Void>), double Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoCoordinates_distanceTo__GeoCoordinates'));
    final _point_handle = sdk_core_GeoCoordinates_toFfi(point);
    final _handle = sdk_core_GeoCoordinates_toFfi(this);
    final __result_handle = _distanceTo_ffi(_handle, __lib.LibraryContext.isolateId, _point_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_point_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  /// Computes distance (in meters) along the great circle between two points.
  ///
  /// This method ignores altitude of both points.
  /// [point] Coordinates of the point to which the distance is computed.
  /// Returns [double]. distance in meters.
  /// @nodoc
  double internalinternalDistanceTo(GeoCoordinates point) {
    final _internalDistanceTo_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Pointer<Void>), double Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoCoordinates_internalDistanceTo__GeoCoordinates'));
    final _point_handle = sdk_core_GeoCoordinates_toFfi(point);
    final _handle = sdk_core_GeoCoordinates_toFfi(this);
    final __result_handle = _internalDistanceTo_ffi(_handle, __lib.LibraryContext.isolateId, _point_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_point_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  /// Constructs a GeoCoordinates from the provided lat, long, alt values.
  ///
  /// Corrects values of lat and long if they exceed the ranges.
  /// [latitude] Latitude in degrees. Positive value means Northern hemisphere.
  /// If the value is out of range of \[-90.0, 90.0\] it's clamped to that range.
  /// NaN value is converted to 0.0.
  /// [longitude] Longitude in degrees. Positive value means Eastern hemisphere.
  /// If the value is out of range of \[-180.0, 180.0\] it's replaced with a value
  /// within the range, representing effectively the same meridian.
  /// NaN value is converted to 0.0.
  /// [altitude] Altitude in meters. NaN value is converted to `null`.
  static GeoCoordinates _withAltitude(double latitude, double longitude, double altitude) {
    final _withAltitude_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double, Double), Pointer<Void> Function(int, double, double, double)>('here_sdk_sdk_core_GeoCoordinates_make__Double_Double_Double'));
    final _latitude_handle = (latitude);
    final _longitude_handle = (longitude);
    final _altitude_handle = (altitude);
    final __result_handle = _withAltitude_ffi(__lib.LibraryContext.isolateId, _latitude_handle, _longitude_handle, _altitude_handle);
    (_latitude_handle);
    (_longitude_handle);
    (_altitude_handle);
    try {
      return sdk_core_GeoCoordinates_fromFfi(__result_handle);
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle(__result_handle);
    }
  }


  /// [latitude] Latitude in degrees. Positive value means Northern hemisphere.
  /// If the value is out of range of \[-90.0, 90.0\] it's clamped to that range.
  /// NaN value is converted to 0.0.
  /// [longitude] Longitude in degrees. Positive value means Eastern hemisphere.
  /// If the value is out of range of \[-180.0, 180.0\] it's replaced with a value
  /// within the range, representing effectively the same meridian.
  /// NaN value is converted to 0.0.
  static GeoCoordinates _$init(double latitude, double longitude) {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('here_sdk_sdk_core_GeoCoordinates_make__Double_Double'));
    final _latitude_handle = (latitude);
    final _longitude_handle = (longitude);
    final __result_handle = _$init_ffi(__lib.LibraryContext.isolateId, _latitude_handle, _longitude_handle);
    (_latitude_handle);
    (_longitude_handle);
    try {
      return sdk_core_GeoCoordinates_fromFfi(__result_handle);
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! GeoCoordinates) return false;
    GeoCoordinates _other = other;
    return latitude == _other.latitude &&
        longitude == _other.longitude &&
        altitude == _other.altitude;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + latitude.hashCode;
    result = 31 * result + longitude.hashCode;
    result = 31 * result + altitude.hashCode;
    return result;
  }
}


// GeoCoordinates "private" section, not exported.

final _sdk_core_GeoCoordinates_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Pointer<Void>),
    Pointer<Void> Function(double, double, Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_create_handle'));
final _sdk_core_GeoCoordinates_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_release_handle'));
final _sdk_core_GeoCoordinates_get_field_latitude = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_get_field_latitude'));
final _sdk_core_GeoCoordinates_get_field_longitude = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_get_field_longitude'));
final _sdk_core_GeoCoordinates_get_field_altitude = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_get_field_altitude'));

Pointer<Void> sdk_core_GeoCoordinates_toFfi(GeoCoordinates value) {
  final _latitude_handle = (value.latitude);
  final _longitude_handle = (value.longitude);
  final _altitude_handle = Double_toFfi_nullable(value.altitude);
  final _result = _sdk_core_GeoCoordinates_create_handle(_latitude_handle, _longitude_handle, _altitude_handle);
  (_latitude_handle);
  (_longitude_handle);
  Double_releaseFfiHandle_nullable(_altitude_handle);
  return _result;
}

GeoCoordinates sdk_core_GeoCoordinates_fromFfi(Pointer<Void> handle) {
  final _latitude_handle = _sdk_core_GeoCoordinates_get_field_latitude(handle);
  final _longitude_handle = _sdk_core_GeoCoordinates_get_field_longitude(handle);
  final _altitude_handle = _sdk_core_GeoCoordinates_get_field_altitude(handle);
  try {
    return GeoCoordinates._(
      (_latitude_handle), 
    
      (_longitude_handle), 
    
      Double_fromFfi_nullable(_altitude_handle)
    );
  } finally {
    (_latitude_handle);
    (_longitude_handle);
    Double_releaseFfiHandle_nullable(_altitude_handle);
  }
}

void sdk_core_GeoCoordinates_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_GeoCoordinates_release_handle(handle);

// Nullable GeoCoordinates

final _sdk_core_GeoCoordinates_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_create_handle_nullable'));
final _sdk_core_GeoCoordinates_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_release_handle_nullable'));
final _sdk_core_GeoCoordinates_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_get_value_nullable'));

Pointer<Void> sdk_core_GeoCoordinates_toFfi_nullable(GeoCoordinates value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_GeoCoordinates_toFfi(value);
  final result = _sdk_core_GeoCoordinates_create_handle_nullable(_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

GeoCoordinates sdk_core_GeoCoordinates_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_GeoCoordinates_get_value_nullable(handle);
  final result = sdk_core_GeoCoordinates_fromFfi(_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_GeoCoordinates_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_GeoCoordinates_release_handle_nullable(handle);

// End of GeoCoordinates "private" section.

