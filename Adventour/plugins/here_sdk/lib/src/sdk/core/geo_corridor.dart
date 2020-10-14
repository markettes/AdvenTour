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
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;



/// A geographical area that wraps around a geographical polyline with a given distance.
///
/// The corridor has round edges at the endpoints of the polyline. The distance from
/// any point of the polyline to the closest border of the corridor is always the same.
@immutable
class GeoCorridor {
  /// The polyline passing through the middle of the corridor.
  final List<GeoCoordinates> polyline;

  /// The shortest distance from any point on the polyline to the border of the corridor.
  final int radiusInMeters;


  const GeoCorridor._(this.polyline, this.radiusInMeters);
  GeoCorridor._copy(GeoCorridor _other) : this._(_other.polyline, _other.radiusInMeters);

  /// Constructs a GeoCorridor from the provided polyline and radius in meters.
  ///
  /// The given radius is truncated to an integer value.
  /// [polyline] The polyline passing through the middle of the corridor.
  /// [radiusInMeters] The shortest distance from any point on the polyline to the border of the corridor.
  @Deprecated("Will be removed in v4.7.0. The constructor with radius as integer should be used instead.")

  GeoCorridor.withRadiusAsDouble(List<GeoCoordinates> polyline, double radiusInMeters) : this._copy(_withRadiusAsDouble(polyline, radiusInMeters));

  /// Constructs a GeoCorridor from the provided polyline and radius in meters.
  /// [polyline] The polyline passing through the middle of the corridor.
  /// [radiusInMeters] The shortest distance from any point on the polyline to the border of the corridor.
  GeoCorridor.withRadius(List<GeoCoordinates> polyline, int radiusInMeters) : this._copy(_withRadius(polyline, radiusInMeters));

  /// Constructs a GeoCorridor from the provided polyline and radius in meters.
  ///
  /// The given radius is truncated to an integer value.
  /// [polyline] The polyline passing through the middle of the corridor.
  /// [radiusInMeters] The shortest distance from any point on the polyline to the border of the corridor.
  @Deprecated("Will be removed in v4.7.0. The constructor with radius as integer should be used instead.")

  static GeoCorridor _withRadiusAsDouble(List<GeoCoordinates> polyline, double radiusInMeters) {
    final _withRadiusAsDouble_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Double), Pointer<Void> Function(int, Pointer<Void>, double)>('here_sdk_sdk_core_GeoCorridor_make__ListOf_1sdk_1core_1GeoCoordinates_Double'));
    final _polyline_handle = heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(polyline);
    final _radiusInMeters_handle = (radiusInMeters);
    final __result_handle = _withRadiusAsDouble_ffi(__lib.LibraryContext.isolateId, _polyline_handle, _radiusInMeters_handle);
    heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_polyline_handle);
    (_radiusInMeters_handle);
    try {
      return sdk_core_GeoCorridor_fromFfi(__result_handle);
    } finally {
      sdk_core_GeoCorridor_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a GeoCorridor from the provided polyline and radius in meters.
  /// [polyline] The polyline passing through the middle of the corridor.
  /// [radiusInMeters] The shortest distance from any point on the polyline to the border of the corridor.
  static GeoCorridor _withRadius(List<GeoCoordinates> polyline, int radiusInMeters) {
    final _withRadius_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Int32), Pointer<Void> Function(int, Pointer<Void>, int)>('here_sdk_sdk_core_GeoCorridor_make__ListOf_1sdk_1core_1GeoCoordinates_Int'));
    final _polyline_handle = heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(polyline);
    final _radiusInMeters_handle = (radiusInMeters);
    final __result_handle = _withRadius_ffi(__lib.LibraryContext.isolateId, _polyline_handle, _radiusInMeters_handle);
    heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_polyline_handle);
    (_radiusInMeters_handle);
    try {
      return sdk_core_GeoCorridor_fromFfi(__result_handle);
    } finally {
      sdk_core_GeoCorridor_releaseFfiHandle(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! GeoCorridor) return false;
    GeoCorridor _other = other;
    return DeepCollectionEquality().equals(polyline, _other.polyline) &&
        radiusInMeters == _other.radiusInMeters;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(polyline);
    result = 31 * result + radiusInMeters.hashCode;
    return result;
  }
}


// GeoCorridor "private" section, not exported.

final _sdk_core_GeoCorridor_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32),
    Pointer<Void> Function(Pointer<Void>, int)
  >('here_sdk_sdk_core_GeoCorridor_create_handle'));
final _sdk_core_GeoCorridor_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_release_handle'));
final _sdk_core_GeoCorridor_get_field_polyline = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_get_field_polyline'));
final _sdk_core_GeoCorridor_get_field_radiusInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_get_field_radiusInMeters'));

Pointer<Void> sdk_core_GeoCorridor_toFfi(GeoCorridor value) {
  final _polyline_handle = heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(value.polyline);
  final _radiusInMeters_handle = (value.radiusInMeters);
  final _result = _sdk_core_GeoCorridor_create_handle(_polyline_handle, _radiusInMeters_handle);
  heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_polyline_handle);
  (_radiusInMeters_handle);
  return _result;
}

GeoCorridor sdk_core_GeoCorridor_fromFfi(Pointer<Void> handle) {
  final _polyline_handle = _sdk_core_GeoCorridor_get_field_polyline(handle);
  final _radiusInMeters_handle = _sdk_core_GeoCorridor_get_field_radiusInMeters(handle);
  try {
    return GeoCorridor._(
      heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(_polyline_handle), 
    
      (_radiusInMeters_handle)
    );
  } finally {
    heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_polyline_handle);
    (_radiusInMeters_handle);
  }
}

void sdk_core_GeoCorridor_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_GeoCorridor_release_handle(handle);

// Nullable GeoCorridor

final _sdk_core_GeoCorridor_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_create_handle_nullable'));
final _sdk_core_GeoCorridor_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_release_handle_nullable'));
final _sdk_core_GeoCorridor_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_get_value_nullable'));

Pointer<Void> sdk_core_GeoCorridor_toFfi_nullable(GeoCorridor value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_GeoCorridor_toFfi(value);
  final result = _sdk_core_GeoCorridor_create_handle_nullable(_handle);
  sdk_core_GeoCorridor_releaseFfiHandle(_handle);
  return result;
}

GeoCorridor sdk_core_GeoCorridor_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_GeoCorridor_get_value_nullable(handle);
  final result = sdk_core_GeoCorridor_fromFfi(_handle);
  sdk_core_GeoCorridor_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_GeoCorridor_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_GeoCorridor_release_handle_nullable(handle);

// End of GeoCorridor "private" section.

