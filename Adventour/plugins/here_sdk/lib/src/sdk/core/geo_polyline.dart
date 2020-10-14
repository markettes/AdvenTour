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

final _make_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolyline_make__ListOf_1sdk_1core_1GeoCoordinates_return_release_handle'));
final _make_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolyline_make__ListOf_1sdk_1core_1GeoCoordinates_return_get_result'));
final _make_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolyline_make__ListOf_1sdk_1core_1GeoCoordinates_return_get_error'));
final _make_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolyline_make__ListOf_1sdk_1core_1GeoCoordinates_return_has_error'));




/// A list of geographic coordinates representing the vertices of a polyline.
///
/// An instance of this class, initialized with appropriate vertices.
/// Represents a GeoPolyline as a series of geographic coordinates.
@immutable
class GeoPolyline {
  /// The list of vertices representing the polyline.
  final List<GeoCoordinates> vertices;


  const GeoPolyline._(this.vertices);
  GeoPolyline._copy(GeoPolyline _other) : this._(_other.vertices);

  /// Constructs a GeoPolyline from the provided vertices.
  ///
  /// Throws an InstantiationError if the number of vertices is less than two.
  /// [vertices] List of vertices representing the polyline.
  /// Throws [InstantiationException]. Instantiation error.
  GeoPolyline(List<GeoCoordinates> vertices) : this._copy(_make(vertices));

  /// Constructs a GeoPolyline from the provided vertices.
  ///
  /// Throws an InstantiationError if the number of vertices is less than two.
  /// [vertices] List of vertices representing the polyline.
  /// Throws [InstantiationException]. Instantiation error.
  static GeoPolyline _make(List<GeoCoordinates> vertices) {
    final _make_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_GeoPolyline_make__ListOf_1sdk_1core_1GeoCoordinates'));
    final _vertices_handle = heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(vertices);
    final __call_result_handle = _make_ffi(__lib.LibraryContext.isolateId, _vertices_handle);
    heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_vertices_handle);
    if (_make_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _make_return_get_error(__call_result_handle);
        _make_return_release_handle(__call_result_handle);
        try {
          throw InstantiationException(sdk_core_errors_InstantiationErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_core_errors_InstantiationErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _make_return_get_result(__call_result_handle);
    _make_return_release_handle(__call_result_handle);
    try {
      return sdk_core_GeoPolyline_fromFfi(__result_handle);
    } finally {
      sdk_core_GeoPolyline_releaseFfiHandle(__result_handle);
    }
  }

  /// Returns the index of the nearest vertex to the given point.
  /// [point] Coordinates of the point.
  /// Returns [int]. Index of the closest vertex of the polyline.
  int getNearestIndexTo(GeoCoordinates point) {
    final _getNearestIndexTo_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoPolyline_getNearestIndexTo__GeoCoordinates'));
    final _point_handle = sdk_core_GeoCoordinates_toFfi(point);
    final _handle = sdk_core_GeoPolyline_toFfi(this);
    final __result_handle = _getNearestIndexTo_ffi(_handle, __lib.LibraryContext.isolateId, _point_handle);
    sdk_core_GeoPolyline_releaseFfiHandle(_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_point_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  /// Returns the coordinates of the nearest vertex to the given point.
  /// [point] Coordinates of the point.
  /// Returns [GeoCoordinates]. Coordinates of the nearest vertex.
  /// @nodoc
  GeoCoordinates internalgetNearestTo(GeoCoordinates point) {
    final _getNearestTo_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoPolyline_getNearestTo__GeoCoordinates'));
    final _point_handle = sdk_core_GeoCoordinates_toFfi(point);
    final _handle = sdk_core_GeoPolyline_toFfi(this);
    final __result_handle = _getNearestTo_ffi(_handle, __lib.LibraryContext.isolateId, _point_handle);
    sdk_core_GeoPolyline_releaseFfiHandle(_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_point_handle);
    try {
      return sdk_core_GeoCoordinates_fromFfi(__result_handle);
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! GeoPolyline) return false;
    GeoPolyline _other = other;
    return DeepCollectionEquality().equals(vertices, _other.vertices);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(vertices);
    return result;
  }
}


// GeoPolyline "private" section, not exported.

final _sdk_core_GeoPolyline_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolyline_create_handle'));
final _sdk_core_GeoPolyline_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolyline_release_handle'));
final _sdk_core_GeoPolyline_get_field_vertices = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolyline_get_field_vertices'));

Pointer<Void> sdk_core_GeoPolyline_toFfi(GeoPolyline value) {
  final _vertices_handle = heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(value.vertices);
  final _result = _sdk_core_GeoPolyline_create_handle(_vertices_handle);
  heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_vertices_handle);
  return _result;
}

GeoPolyline sdk_core_GeoPolyline_fromFfi(Pointer<Void> handle) {
  final _vertices_handle = _sdk_core_GeoPolyline_get_field_vertices(handle);
  try {
    return GeoPolyline._(
      heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(_vertices_handle)
    );
  } finally {
    heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_vertices_handle);
  }
}

void sdk_core_GeoPolyline_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_GeoPolyline_release_handle(handle);

// Nullable GeoPolyline

final _sdk_core_GeoPolyline_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolyline_create_handle_nullable'));
final _sdk_core_GeoPolyline_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolyline_release_handle_nullable'));
final _sdk_core_GeoPolyline_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolyline_get_value_nullable'));

Pointer<Void> sdk_core_GeoPolyline_toFfi_nullable(GeoPolyline value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_GeoPolyline_toFfi(value);
  final result = _sdk_core_GeoPolyline_create_handle_nullable(_handle);
  sdk_core_GeoPolyline_releaseFfiHandle(_handle);
  return result;
}

GeoPolyline sdk_core_GeoPolyline_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_GeoPolyline_get_value_nullable(handle);
  final result = sdk_core_GeoPolyline_fromFfi(_handle);
  sdk_core_GeoPolyline_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_GeoPolyline_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_GeoPolyline_release_handle_nullable(handle);

// End of GeoPolyline "private" section.

