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

/// Describes a location in the world at a given time.

class Location {
  /// The geographic coordinates of the location.
  GeoCoordinates coordinates;

  /// Bearing (also known as course) is the device's horizontal direction of travel.
  /// Starts at 0 in the geographical north and rotates around the compass in a clockwise
  /// direction. This means for going north it is equal to 0, for northeast it is 45,
  /// for east it is 90 and so on. Note that this may be different from the orientation of
  /// the device. If it cannot be determined, the value is `null`. Otherwise, it is
  /// guaranteed to be in the range \[0, 360).
  double bearingInDegrees;

  /// Current speed of the device. If it cannot be determined, the value is `null`.
  double speedInMetersPerSecond;

  /// The time at which the location was determined.
  DateTime timestamp;

  /// The estimated horizontal accuracy. The actual location will lie with
  /// a probability of 68% within this radius of uncertainty.
  double horizontalAccuracyInMeters;

  /// Estimated vertical accuracy.
  /// Given that the received Location contains the altitude, the real value of the altitude
  /// is estimated to lie within the following range:
  /// \[altitude - vertical accuracy, altitude + vertical accuracy\] with 68% probability.
  /// For example, when the altitude is equal to 50 and the vertical accuracy
  /// is 8, then the actual value is most likely in the range \[42, 58\] at 68% probability.
  /// Available on iOS only.
  double verticalAccuracyInMeters;


  /// Creates a new Location instance from the provided GeoCoordinates, bearing, speed and
  /// timestamp values.

  /// [coordinates] The geographic coordinates of the location.

  /// [bearingInDegrees] Bearing (also known as course) is the device's horizontal direction of travel.
  /// Starts at 0 in the geographical north and rotates around the compass in a clockwise
  /// direction. This means for going north it is equal to 0, for northeast it is 45,
  /// for east it is 90 and so on. Note that this may be different from the orientation of
  /// the device. If it cannot be determined, the value is `null`. Otherwise, it is
  /// guaranteed to be in the range \[0, 360).

  /// [speedInMetersPerSecond] Current speed of the device. If it cannot be determined, the value is `null`.

  /// [timestamp] The time at which the location was determined.

  /// [horizontalAccuracyInMeters] The estimated horizontal accuracy. The actual location will lie with
  /// a probability of 68% within this radius of uncertainty.

  /// [verticalAccuracyInMeters] Estimated vertical accuracy.
  /// Given that the received Location contains the altitude, the real value of the altitude
  /// is estimated to lie within the following range:
  /// \[altitude - vertical accuracy, altitude + vertical accuracy\] with 68% probability.
  /// For example, when the altitude is equal to 50 and the vertical accuracy
  /// is 8, then the actual value is most likely in the range \[42, 58\] at 68% probability.
  /// Available on iOS only.

  Location(this.coordinates, this.bearingInDegrees, this.speedInMetersPerSecond, this.timestamp, this.horizontalAccuracyInMeters, this.verticalAccuracyInMeters);

  Location.withDefaults(GeoCoordinates coordinates, DateTime timestamp)
    : coordinates = coordinates, bearingInDegrees = null, speedInMetersPerSecond = null, timestamp = timestamp, horizontalAccuracyInMeters = null, verticalAccuracyInMeters = null;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! Location) return false;
    Location _other = other;
    return coordinates == _other.coordinates &&
        bearingInDegrees == _other.bearingInDegrees &&
        speedInMetersPerSecond == _other.speedInMetersPerSecond &&
        timestamp == _other.timestamp &&
        horizontalAccuracyInMeters == _other.horizontalAccuracyInMeters &&
        verticalAccuracyInMeters == _other.verticalAccuracyInMeters;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + coordinates.hashCode;
    result = 31 * result + bearingInDegrees.hashCode;
    result = 31 * result + speedInMetersPerSecond.hashCode;
    result = 31 * result + timestamp.hashCode;
    result = 31 * result + horizontalAccuracyInMeters.hashCode;
    result = 31 * result + verticalAccuracyInMeters.hashCode;
    return result;
  }
}


// Location "private" section, not exported.

final _sdk_core_Location_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint64, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, int, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_Location_create_handle'));
final _sdk_core_Location_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_release_handle'));
final _sdk_core_Location_get_field_coordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_coordinates'));
final _sdk_core_Location_get_field_bearingInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_bearingInDegrees'));
final _sdk_core_Location_get_field_speedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_speedInMetersPerSecond'));
final _sdk_core_Location_get_field_timestamp = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_timestamp'));
final _sdk_core_Location_get_field_horizontalAccuracyInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_horizontalAccuracyInMeters'));
final _sdk_core_Location_get_field_verticalAccuracyInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_verticalAccuracyInMeters'));

Pointer<Void> sdk_core_Location_toFfi(Location value) {
  final _coordinates_handle = sdk_core_GeoCoordinates_toFfi(value.coordinates);
  final _bearingInDegrees_handle = Double_toFfi_nullable(value.bearingInDegrees);
  final _speedInMetersPerSecond_handle = Double_toFfi_nullable(value.speedInMetersPerSecond);
  final _timestamp_handle = Date_toFfi(value.timestamp);
  final _horizontalAccuracyInMeters_handle = Double_toFfi_nullable(value.horizontalAccuracyInMeters);
  final _verticalAccuracyInMeters_handle = Double_toFfi_nullable(value.verticalAccuracyInMeters);
  final _result = _sdk_core_Location_create_handle(_coordinates_handle, _bearingInDegrees_handle, _speedInMetersPerSecond_handle, _timestamp_handle, _horizontalAccuracyInMeters_handle, _verticalAccuracyInMeters_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle(_coordinates_handle);
  Double_releaseFfiHandle_nullable(_bearingInDegrees_handle);
  Double_releaseFfiHandle_nullable(_speedInMetersPerSecond_handle);
  Date_releaseFfiHandle(_timestamp_handle);
  Double_releaseFfiHandle_nullable(_horizontalAccuracyInMeters_handle);
  Double_releaseFfiHandle_nullable(_verticalAccuracyInMeters_handle);
  return _result;
}

Location sdk_core_Location_fromFfi(Pointer<Void> handle) {
  final _coordinates_handle = _sdk_core_Location_get_field_coordinates(handle);
  final _bearingInDegrees_handle = _sdk_core_Location_get_field_bearingInDegrees(handle);
  final _speedInMetersPerSecond_handle = _sdk_core_Location_get_field_speedInMetersPerSecond(handle);
  final _timestamp_handle = _sdk_core_Location_get_field_timestamp(handle);
  final _horizontalAccuracyInMeters_handle = _sdk_core_Location_get_field_horizontalAccuracyInMeters(handle);
  final _verticalAccuracyInMeters_handle = _sdk_core_Location_get_field_verticalAccuracyInMeters(handle);
  try {
    return Location(
      sdk_core_GeoCoordinates_fromFfi(_coordinates_handle), 
    
      Double_fromFfi_nullable(_bearingInDegrees_handle), 
    
      Double_fromFfi_nullable(_speedInMetersPerSecond_handle), 
    
      Date_fromFfi(_timestamp_handle), 
    
      Double_fromFfi_nullable(_horizontalAccuracyInMeters_handle), 
    
      Double_fromFfi_nullable(_verticalAccuracyInMeters_handle)
    );
  } finally {
    sdk_core_GeoCoordinates_releaseFfiHandle(_coordinates_handle);
    Double_releaseFfiHandle_nullable(_bearingInDegrees_handle);
    Double_releaseFfiHandle_nullable(_speedInMetersPerSecond_handle);
    Date_releaseFfiHandle(_timestamp_handle);
    Double_releaseFfiHandle_nullable(_horizontalAccuracyInMeters_handle);
    Double_releaseFfiHandle_nullable(_verticalAccuracyInMeters_handle);
  }
}

void sdk_core_Location_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_Location_release_handle(handle);

// Nullable Location

final _sdk_core_Location_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_create_handle_nullable'));
final _sdk_core_Location_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_release_handle_nullable'));
final _sdk_core_Location_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_value_nullable'));

Pointer<Void> sdk_core_Location_toFfi_nullable(Location value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_Location_toFfi(value);
  final result = _sdk_core_Location_create_handle_nullable(_handle);
  sdk_core_Location_releaseFfiHandle(_handle);
  return result;
}

Location sdk_core_Location_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_Location_get_value_nullable(handle);
  final result = sdk_core_Location_fromFfi(_handle);
  sdk_core_Location_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_Location_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_Location_release_handle_nullable(handle);

// End of Location "private" section.

