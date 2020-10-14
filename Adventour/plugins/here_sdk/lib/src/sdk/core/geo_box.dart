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
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;





final _expandedBy_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_expandedBy__Double_Double_Double_Double_return_release_handle'));
final _expandedBy_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_expandedBy__Double_Double_Double_Double_return_get_result'));
final _expandedBy_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_expandedBy__Double_Double_Double_Double_return_get_error'));
final _expandedBy_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_expandedBy__Double_Double_Double_Double_return_has_error'));


final _internalExpandedBy_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_internalExpandedBy__Double_Double_Double_Double_return_release_handle'));
final _internalExpandedBy_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_internalExpandedBy__Double_Double_Double_Double_return_get_result'));
final _internalExpandedBy_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_internalExpandedBy__Double_Double_Double_Double_return_get_error'));
final _internalExpandedBy_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_internalExpandedBy__Double_Double_Double_Double_return_has_error'));


/// Represents a bounding rectangle aligned with latitude and longitude.
///
/// Geographic area represented by this would be visualised as a rectangle
/// when using a normal cylindrical projection (such as Mercator).
@immutable
class GeoBox {
  /// South west corner coordinates.
  final GeoCoordinates southWestCorner;

  /// North east corner coordinates.
  final GeoCoordinates northEastCorner;


  const GeoBox(this.southWestCorner, this.northEastCorner);

  /// Creates a GeoBox which encompases all coordinates from the list
  /// Provided list must contain at leat two points.
  /// [geoCoordinates] List of coordinates to encompass inside bounding box
  /// Returns [GeoBox]. GeoBox containing all supplied coordinates, or `null` if less than two coordinates were provided
  static GeoBox containingGeoCoordinates(List<GeoCoordinates> geoCoordinates) {
    final _containingGeoCoordinates_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_GeoBox_containing__ListOf_1sdk_1core_1GeoCoordinates'));
    final _geoCoordinates_handle = core_types_ListOf_sdk_core_GeoCoordinates_toFfi(geoCoordinates);
    final __result_handle = _containingGeoCoordinates_ffi(__lib.LibraryContext.isolateId, _geoCoordinates_handle);
    core_types_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_geoCoordinates_handle);
    try {
      return sdk_core_GeoBox_fromFfi_nullable(__result_handle);
    } finally {
      sdk_core_GeoBox_releaseFfiHandle_nullable(__result_handle);
    }
  }

  /// Determines whether this GeoBox intersects with the passed GeoBox.
  /// [geoBox] A GeoBox to check for intersection.
  /// Returns [bool]. true if intersects with the GeoBox, false otherwise.
  bool intersects(GeoBox geoBox) {
    final _intersects_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoBox_intersects__GeoBox'));
    final _geoBox_handle = sdk_core_GeoBox_toFfi(geoBox);
    final _handle = sdk_core_GeoBox_toFfi(this);
    final __result_handle = _intersects_ffi(_handle, __lib.LibraryContext.isolateId, _geoBox_handle);
    sdk_core_GeoBox_releaseFfiHandle(_handle);
    sdk_core_GeoBox_releaseFfiHandle(_geoBox_handle);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }

  /// Determines whether the specified GeoBox is covered entirely by this GeoBox.
  /// [geoBox] A GeoBox to check for containment within this GeoBox.
  /// Returns [bool]. true if covered by the GeoBox, false otherwise.
  bool containsGeoBox(GeoBox geoBox) {
    final _containsGeoBox_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoBox_contains__GeoBox'));
    final _geoBox_handle = sdk_core_GeoBox_toFfi(geoBox);
    final _handle = sdk_core_GeoBox_toFfi(this);
    final __result_handle = _containsGeoBox_ffi(_handle, __lib.LibraryContext.isolateId, _geoBox_handle);
    sdk_core_GeoBox_releaseFfiHandle(_handle);
    sdk_core_GeoBox_releaseFfiHandle(_geoBox_handle);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }

  /// Determines whether the specified GeoCoordinates is contained within this GeoBox.
  /// [geoCoordinates] A GeoCoordinates to check for containment within this GeoBox.
  /// Returns [bool]. true if contained within the GeoBox, false otherwise.
  bool containsGeoCoordinates(GeoCoordinates geoCoordinates) {
    final _containsGeoCoordinates_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoBox_contains__GeoCoordinates'));
    final _geoCoordinates_handle = sdk_core_GeoCoordinates_toFfi(geoCoordinates);
    final _handle = sdk_core_GeoBox_toFfi(this);
    final __result_handle = _containsGeoCoordinates_ffi(_handle, __lib.LibraryContext.isolateId, _geoCoordinates_handle);
    sdk_core_GeoBox_releaseFfiHandle(_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_geoCoordinates_handle);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }

  /// Creates a GeoBox which is expanded by a fixed distance.
  ///
  /// Throws an InstantiationError if It's not possible to create a valid
  /// GeoBox with the given arguments.
  /// [southMeters] Distance in the south direction in meters to expand the GeoBox.
  /// [westMeters] Distance in the west direction in meters to expand the GeoBox.
  /// [northMeters] Distance in the north direction in meters to expand the GeoBox.
  /// [eastMeters] Distance in the east direction in meters to expand the GeoBox.
  /// Returns [GeoBox]. The expanded GeoBox.
  /// Throws [InstantiationException]. Instantiation error.
  GeoBox expandedBy(double southMeters, double westMeters, double northMeters, double eastMeters) {
    final _expandedBy_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Double, Double, Double, Double), Pointer<Void> Function(Pointer<Void>, int, double, double, double, double)>('here_sdk_sdk_core_GeoBox_expandedBy__Double_Double_Double_Double'));
    final _southMeters_handle = (southMeters);
    final _westMeters_handle = (westMeters);
    final _northMeters_handle = (northMeters);
    final _eastMeters_handle = (eastMeters);
    final _handle = sdk_core_GeoBox_toFfi(this);
    final __call_result_handle = _expandedBy_ffi(_handle, __lib.LibraryContext.isolateId, _southMeters_handle, _westMeters_handle, _northMeters_handle, _eastMeters_handle);
    sdk_core_GeoBox_releaseFfiHandle(_handle);
    (_southMeters_handle);
    (_westMeters_handle);
    (_northMeters_handle);
    (_eastMeters_handle);
    if (_expandedBy_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _expandedBy_return_get_error(__call_result_handle);
        _expandedBy_return_release_handle(__call_result_handle);
        try {
          throw InstantiationException(sdk_core_errors_InstantiationErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_core_errors_InstantiationErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _expandedBy_return_get_result(__call_result_handle);
    _expandedBy_return_release_handle(__call_result_handle);
    try {
      return sdk_core_GeoBox_fromFfi(__result_handle);
    } finally {
      sdk_core_GeoBox_releaseFfiHandle(__result_handle);
    }
  }

  /// Creates a GeoBox which is expanded by a fixed distance.
  ///
  /// Throws an InstantiationError if It's not possible to create a valid
  /// GeoBox with the given arguments.
  /// [southMeters] Distance in the south direction in meters to expand the GeoBox.
  /// [westMeters] Distance in the west direction in meters to expand the GeoBox.
  /// [northMeters] Distance in the north direction in meters to expand the GeoBox.
  /// [eastMeters] Distance in the east direction in meters to expand the GeoBox.
  /// Returns [GeoBox]. The expanded GeoBox.
  /// Throws [InstantiationException]. Instantiation error.
  /// @nodoc
  GeoBox internalinternalExpandedBy(double southMeters, double westMeters, double northMeters, double eastMeters) {
    final _internalExpandedBy_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Double, Double, Double, Double), Pointer<Void> Function(Pointer<Void>, int, double, double, double, double)>('here_sdk_sdk_core_GeoBox_internalExpandedBy__Double_Double_Double_Double'));
    final _southMeters_handle = (southMeters);
    final _westMeters_handle = (westMeters);
    final _northMeters_handle = (northMeters);
    final _eastMeters_handle = (eastMeters);
    final _handle = sdk_core_GeoBox_toFfi(this);
    final __call_result_handle = _internalExpandedBy_ffi(_handle, __lib.LibraryContext.isolateId, _southMeters_handle, _westMeters_handle, _northMeters_handle, _eastMeters_handle);
    sdk_core_GeoBox_releaseFfiHandle(_handle);
    (_southMeters_handle);
    (_westMeters_handle);
    (_northMeters_handle);
    (_eastMeters_handle);
    if (_internalExpandedBy_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _internalExpandedBy_return_get_error(__call_result_handle);
        _internalExpandedBy_return_release_handle(__call_result_handle);
        try {
          throw InstantiationException(sdk_core_errors_InstantiationErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_core_errors_InstantiationErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _internalExpandedBy_return_get_result(__call_result_handle);
    _internalExpandedBy_return_release_handle(__call_result_handle);
    try {
      return sdk_core_GeoBox_fromFfi(__result_handle);
    } finally {
      sdk_core_GeoBox_releaseFfiHandle(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! GeoBox) return false;
    GeoBox _other = other;
    return southWestCorner == _other.southWestCorner &&
        northEastCorner == _other.northEastCorner;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + southWestCorner.hashCode;
    result = 31 * result + northEastCorner.hashCode;
    return result;
  }
}


// GeoBox "private" section, not exported.

final _sdk_core_GeoBox_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_create_handle'));
final _sdk_core_GeoBox_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_release_handle'));
final _sdk_core_GeoBox_get_field_southWestCorner = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_get_field_southWestCorner'));
final _sdk_core_GeoBox_get_field_northEastCorner = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_get_field_northEastCorner'));

Pointer<Void> sdk_core_GeoBox_toFfi(GeoBox value) {
  final _southWestCorner_handle = sdk_core_GeoCoordinates_toFfi(value.southWestCorner);
  final _northEastCorner_handle = sdk_core_GeoCoordinates_toFfi(value.northEastCorner);
  final _result = _sdk_core_GeoBox_create_handle(_southWestCorner_handle, _northEastCorner_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle(_southWestCorner_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle(_northEastCorner_handle);
  return _result;
}

GeoBox sdk_core_GeoBox_fromFfi(Pointer<Void> handle) {
  final _southWestCorner_handle = _sdk_core_GeoBox_get_field_southWestCorner(handle);
  final _northEastCorner_handle = _sdk_core_GeoBox_get_field_northEastCorner(handle);
  try {
    return GeoBox(
      sdk_core_GeoCoordinates_fromFfi(_southWestCorner_handle), 
    
      sdk_core_GeoCoordinates_fromFfi(_northEastCorner_handle)
    );
  } finally {
    sdk_core_GeoCoordinates_releaseFfiHandle(_southWestCorner_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_northEastCorner_handle);
  }
}

void sdk_core_GeoBox_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_GeoBox_release_handle(handle);

// Nullable GeoBox

final _sdk_core_GeoBox_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_create_handle_nullable'));
final _sdk_core_GeoBox_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_release_handle_nullable'));
final _sdk_core_GeoBox_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_get_value_nullable'));

Pointer<Void> sdk_core_GeoBox_toFfi_nullable(GeoBox value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_GeoBox_toFfi(value);
  final result = _sdk_core_GeoBox_create_handle_nullable(_handle);
  sdk_core_GeoBox_releaseFfiHandle(_handle);
  return result;
}

GeoBox sdk_core_GeoBox_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_GeoBox_get_value_nullable(handle);
  final result = sdk_core_GeoBox_fromFfi(_handle);
  sdk_core_GeoBox_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_GeoBox_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_GeoBox_release_handle_nullable(handle);

// End of GeoBox "private" section.

