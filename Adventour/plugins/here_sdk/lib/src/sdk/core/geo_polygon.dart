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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/geo_circle.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

final _$init_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_make__ListOf_1sdk_1core_1GeoCoordinates_return_release_handle'));
final _$init_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_make__ListOf_1sdk_1core_1GeoCoordinates_return_get_result'));
final _$init_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_make__ListOf_1sdk_1core_1GeoCoordinates_return_get_error'));
final _$init_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_make__ListOf_1sdk_1core_1GeoCoordinates_return_has_error'));



/// Represents a GeoPolygon area as a series of geographic coordinates.
///
/// An instance of this class, initialized with appropriate vertices.
///
/// **Note:**
/// The coordinates are connected on the boundary of the polygon in clockwise order as they appear in the list.
/// For closing the polygon shape, the last coordinate is connected
/// with the first coordinate, so that the enclosed area can be filled.
/// A self-intersecting or counter-clockwise sequence of coordinates can lead to undesired results.
@immutable
class GeoPolygon {
  /// The list of geographic coordinates representing the vertices of the polygon in clockwise order.
  final List<GeoCoordinates> vertices;


  const GeoPolygon._(this.vertices);
  GeoPolygon._copy(GeoPolygon _other) : this._(_other.vertices);

  /// Constructs a GeoPolygon from the provided vertices.
  ///
  /// Throws InstantiationError if the number of vertices is less than three.
  /// [vertices] List of vertices representing the polygon in clockwise order.
  /// Throws [InstantiationException]. Instantiation error.
  GeoPolygon(List<GeoCoordinates> vertices) : this._copy(_$init(vertices));

  /// Constructs a GeoPolygon from GeoCircle.
  /// [geoCircle] [GeoCircle] to be converted into [GeoPolygon]
  GeoPolygon.withGeoCircle(GeoCircle geoCircle) : this._copy(_withGeoCircle(geoCircle));

  /// Constructs a GeoPolygon from the provided vertices.
  ///
  /// Throws InstantiationError if the number of vertices is less than three.
  /// [vertices] List of vertices representing the polygon in clockwise order.
  /// Throws [InstantiationException]. Instantiation error.
  static GeoPolygon _$init(List<GeoCoordinates> vertices) {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_GeoPolygon_make__ListOf_1sdk_1core_1GeoCoordinates'));
    final _vertices_handle = heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(vertices);
    final __call_result_handle = _$init_ffi(__lib.LibraryContext.isolateId, _vertices_handle);
    heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_vertices_handle);
    if (_$init_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _$init_return_get_error(__call_result_handle);
        _$init_return_release_handle(__call_result_handle);
        try {
          throw InstantiationException(sdk_core_errors_InstantiationErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_core_errors_InstantiationErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _$init_return_get_result(__call_result_handle);
    _$init_return_release_handle(__call_result_handle);
    try {
      return sdk_core_GeoPolygon_fromFfi(__result_handle);
    } finally {
      sdk_core_GeoPolygon_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a GeoPolygon from GeoCircle.
  /// [geoCircle] [GeoCircle] to be converted into [GeoPolygon]
  static GeoPolygon _withGeoCircle(GeoCircle geoCircle) {
    final _withGeoCircle_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_GeoPolygon_make__GeoCircle'));
    final _geoCircle_handle = sdk_core_GeoCircle_toFfi(geoCircle);
    final __result_handle = _withGeoCircle_ffi(__lib.LibraryContext.isolateId, _geoCircle_handle);
    sdk_core_GeoCircle_releaseFfiHandle(_geoCircle_handle);
    try {
      return sdk_core_GeoPolygon_fromFfi(__result_handle);
    } finally {
      sdk_core_GeoPolygon_releaseFfiHandle(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! GeoPolygon) return false;
    GeoPolygon _other = other;
    return DeepCollectionEquality().equals(vertices, _other.vertices);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(vertices);
    return result;
  }
}


// GeoPolygon "private" section, not exported.

final _sdk_core_GeoPolygon_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_create_handle'));
final _sdk_core_GeoPolygon_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_release_handle'));
final _sdk_core_GeoPolygon_get_field_vertices = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_get_field_vertices'));

Pointer<Void> sdk_core_GeoPolygon_toFfi(GeoPolygon value) {
  final _vertices_handle = heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(value.vertices);
  final _result = _sdk_core_GeoPolygon_create_handle(_vertices_handle);
  heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_vertices_handle);
  return _result;
}

GeoPolygon sdk_core_GeoPolygon_fromFfi(Pointer<Void> handle) {
  final _vertices_handle = _sdk_core_GeoPolygon_get_field_vertices(handle);
  try {
    return GeoPolygon._(
      heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(_vertices_handle)
    );
  } finally {
    heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_vertices_handle);
  }
}

void sdk_core_GeoPolygon_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_GeoPolygon_release_handle(handle);

// Nullable GeoPolygon

final _sdk_core_GeoPolygon_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_create_handle_nullable'));
final _sdk_core_GeoPolygon_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_release_handle_nullable'));
final _sdk_core_GeoPolygon_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoPolygon_get_value_nullable'));

Pointer<Void> sdk_core_GeoPolygon_toFfi_nullable(GeoPolygon value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_GeoPolygon_toFfi(value);
  final result = _sdk_core_GeoPolygon_create_handle_nullable(_handle);
  sdk_core_GeoPolygon_releaseFfiHandle(_handle);
  return result;
}

GeoPolygon sdk_core_GeoPolygon_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_GeoPolygon_get_value_nullable(handle);
  final result = sdk_core_GeoPolygon_fromFfi(_handle);
  sdk_core_GeoPolygon_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_GeoPolygon_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_GeoPolygon_release_handle_nullable(handle);

// End of GeoPolygon "private" section.

