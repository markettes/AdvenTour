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
import 'package:here_sdk/src/sdk/routing/waypoint_type.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents a waypoint, used as input for route calculation.

class Waypoint {
  /// The waypoint's geographic coordinates.
  GeoCoordinates coordinates;

  /// Defines how a waypoint should be considered for route calculation.
  /// The default waypoint type is [WaypointType.stopover].
  WaypointType type;

  /// The maximum allowed distance from the waypoint that the calculated
  /// route may pass through. For example, to drive past a city without necessarily going
  /// into the city center, you can specify the coordinates of the center and a transit
  /// radius of 5000m. The default transit radius is zero.
  int transitRadiusInMeters;

  /// The duration in seconds that should be spent at a waypoint of type [WaypointType.stopover].
  /// Impacts time-aware calculations.
  /// Ignored for waypoints of type [WaypointType.passThrough].
  /// The default duration is zero.
  int durationInSeconds;

  /// Optional heading angle referenced by true north, clockwise specifying
  /// the direction of travel. The heading direction may help the routing algorithm to select
  /// the best direction, for example, when multiple directions are possible at a road junction.
  /// North is 0 degrees, East is 90 degrees, South is 180 degrees, and West is 270 degrees.
  /// The value must be in the range \[0, 360\] when specified. By default, or when `null` is set,
  /// heading is ignored for route calculation.
  double headingInDegrees;


  Waypoint(this.coordinates, this.type, this.transitRadiusInMeters, this.durationInSeconds, this.headingInDegrees);

  Waypoint.withDefaults(GeoCoordinates coordinates)
    : coordinates = coordinates, type = WaypointType.stopover, transitRadiusInMeters = 0, durationInSeconds = 0, headingInDegrees = null;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! Waypoint) return false;
    Waypoint _other = other;
    return coordinates == _other.coordinates &&
        type == _other.type &&
        transitRadiusInMeters == _other.transitRadiusInMeters &&
        durationInSeconds == _other.durationInSeconds &&
        headingInDegrees == _other.headingInDegrees;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + coordinates.hashCode;
    result = 31 * result + type.hashCode;
    result = 31 * result + transitRadiusInMeters.hashCode;
    result = 31 * result + durationInSeconds.hashCode;
    result = 31 * result + headingInDegrees.hashCode;
    return result;
  }
}


// Waypoint "private" section, not exported.

final _sdk_routing_Waypoint_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint32, Int32, Int32, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, int, int, int, Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_create_handle'));
final _sdk_routing_Waypoint_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_release_handle'));
final _sdk_routing_Waypoint_get_field_coordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_field_coordinates'));
final _sdk_routing_Waypoint_get_field_type = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_field_type'));
final _sdk_routing_Waypoint_get_field_transitRadiusInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_field_transitRadiusInMeters'));
final _sdk_routing_Waypoint_get_field_durationInSeconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_field_durationInSeconds'));
final _sdk_routing_Waypoint_get_field_headingInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_field_headingInDegrees'));

Pointer<Void> sdk_routing_Waypoint_toFfi(Waypoint value) {
  final _coordinates_handle = sdk_core_GeoCoordinates_toFfi(value.coordinates);
  final _type_handle = sdk_routing_WaypointType_toFfi(value.type);
  final _transitRadiusInMeters_handle = (value.transitRadiusInMeters);
  final _durationInSeconds_handle = (value.durationInSeconds);
  final _headingInDegrees_handle = Double_toFfi_nullable(value.headingInDegrees);
  final _result = _sdk_routing_Waypoint_create_handle(_coordinates_handle, _type_handle, _transitRadiusInMeters_handle, _durationInSeconds_handle, _headingInDegrees_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle(_coordinates_handle);
  sdk_routing_WaypointType_releaseFfiHandle(_type_handle);
  (_transitRadiusInMeters_handle);
  (_durationInSeconds_handle);
  Double_releaseFfiHandle_nullable(_headingInDegrees_handle);
  return _result;
}

Waypoint sdk_routing_Waypoint_fromFfi(Pointer<Void> handle) {
  final _coordinates_handle = _sdk_routing_Waypoint_get_field_coordinates(handle);
  final _type_handle = _sdk_routing_Waypoint_get_field_type(handle);
  final _transitRadiusInMeters_handle = _sdk_routing_Waypoint_get_field_transitRadiusInMeters(handle);
  final _durationInSeconds_handle = _sdk_routing_Waypoint_get_field_durationInSeconds(handle);
  final _headingInDegrees_handle = _sdk_routing_Waypoint_get_field_headingInDegrees(handle);
  try {
    return Waypoint(
      sdk_core_GeoCoordinates_fromFfi(_coordinates_handle), 
    
      sdk_routing_WaypointType_fromFfi(_type_handle), 
    
      (_transitRadiusInMeters_handle), 
    
      (_durationInSeconds_handle), 
    
      Double_fromFfi_nullable(_headingInDegrees_handle)
    );
  } finally {
    sdk_core_GeoCoordinates_releaseFfiHandle(_coordinates_handle);
    sdk_routing_WaypointType_releaseFfiHandle(_type_handle);
    (_transitRadiusInMeters_handle);
    (_durationInSeconds_handle);
    Double_releaseFfiHandle_nullable(_headingInDegrees_handle);
  }
}

void sdk_routing_Waypoint_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_Waypoint_release_handle(handle);

// Nullable Waypoint

final _sdk_routing_Waypoint_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_create_handle_nullable'));
final _sdk_routing_Waypoint_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_release_handle_nullable'));
final _sdk_routing_Waypoint_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_value_nullable'));

Pointer<Void> sdk_routing_Waypoint_toFfi_nullable(Waypoint value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_Waypoint_toFfi(value);
  final result = _sdk_routing_Waypoint_create_handle_nullable(_handle);
  sdk_routing_Waypoint_releaseFfiHandle(_handle);
  return result;
}

Waypoint sdk_routing_Waypoint_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_Waypoint_get_value_nullable(handle);
  final result = sdk_routing_Waypoint_fromFfi(_handle);
  sdk_routing_Waypoint_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_Waypoint_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_Waypoint_release_handle_nullable(handle);

// End of Waypoint "private" section.

