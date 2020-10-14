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

import 'dart:ui' as ui;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/color.dart';
import 'package:here_sdk/src/sdk/core/geo_polygon.dart';
import 'package:here_sdk/src/sdk/core/metadata.dart';
import 'package:here_sdk/src/sdk/mapview/polygon_data_source.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// A visual representation of a polygon on the map.
///
/// Can be used to visualize areas of all shapes
/// and sizes. The geometry to be visualized is represented by an instance of [GeoPolygon].
/// To display circular areas (for example, a position accuracy indicator) use a GeoPolygon
/// created from a [GeoCircle] using [withGeoCircle]
///
/// To display the map polygon, it needs to be added to the scene using [addMapPolygon].
/// To stop displaying it, remove it from the scene using [removeMapPolygon].
abstract class MapPolygon {
  /// Creates a new MapPolygon instance containing the geometry passed in.
  /// [geometry] The list of vertices representing the polygon. The coordinates
  /// have to be ordered clockwise to create a closed polygon.
  /// [color] The fill color for the polygon
  factory MapPolygon(GeoPolygon geometry, ui.Color color) => MapPolygon$Impl.$init(geometry, color);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Updates the list of vertices that represent the polygon.
  /// [geometry] The updated list of vertices representing the polygon.
  updateGeometry(GeoPolygon geometry);

  /// @nodoc
  internalgenerateGraphics(PolygonDataSource dataSource, int mapItemId);

  /// @nodoc
  internaldestroyGraphics();

  /// @nodoc
  int internalgetId();


  /// Gets the Metadata instance attached to this polygon.
  /// This will be `null` if nothing has been attached before.
  Metadata get metadata;


  /// Sets the Metadata instance attached to this polygon.
  set metadata(Metadata value);


}


// MapPolygon "private" section, not exported.

final _sdk_mapview_MapPolygon_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolygon_copy_handle'));
final _sdk_mapview_MapPolygon_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolygon_release_handle'));
final _sdk_mapview_MapPolygon_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapPolygon_get_raw_pointer'));
final __are_equal = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolygon_are_equal'));





class MapPolygon$Impl implements MapPolygon {
  @protected
  Pointer<Void> handle;

  MapPolygon$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_MapPolygon_get_raw_pointer(handle));
    _sdk_mapview_MapPolygon_release_handle(handle);
    handle = null;
  }


  MapPolygon$Impl.$init(GeoPolygon geometry, ui.Color color) : handle = _$init(geometry, color) {
    __lib.reverseCache[_sdk_mapview_MapPolygon_get_raw_pointer(handle)] = this;
  }

  static Pointer<Void> _$init(GeoPolygon geometry, ui.Color color) {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolygon_make__GeoPolygon_Color'));
    final _geometry_handle = sdk_core_GeoPolygon_toFfi(geometry);
    final _color_handle = sdk_core_Color_toFfi(color);
    final __result_handle = _$init_ffi(__lib.LibraryContext.isolateId, _geometry_handle, _color_handle);
    sdk_core_GeoPolygon_releaseFfiHandle(_geometry_handle);
    sdk_core_Color_releaseFfiHandle(_color_handle);
    return __result_handle;
  }

  @override
  updateGeometry(GeoPolygon geometry) {
    final _updateGeometry_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolygon_updateGeometry__GeoPolygon'));
    final _geometry_handle = sdk_core_GeoPolygon_toFfi(geometry);
    final _handle = this.handle;
    final __result_handle = _updateGeometry_ffi(_handle, __lib.LibraryContext.isolateId, _geometry_handle);
    sdk_core_GeoPolygon_releaseFfiHandle(_geometry_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internalgenerateGraphics(PolygonDataSource dataSource, int mapItemId) {
    final _generateGraphics_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Int64), void Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolygon_generateGraphics__PolygonDataSource_Long'));
    final _dataSource_handle = sdk_mapview_PolygonDataSource_toFfi(dataSource);
    final _mapItemId_handle = (mapItemId);
    final _handle = this.handle;
    final __result_handle = _generateGraphics_ffi(_handle, __lib.LibraryContext.isolateId, _dataSource_handle, _mapItemId_handle);
    sdk_mapview_PolygonDataSource_releaseFfiHandle(_dataSource_handle);
    (_mapItemId_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internaldestroyGraphics() {
    final _destroyGraphics_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolygon_destroyGraphics'));
    final _handle = this.handle;
    final __result_handle = _destroyGraphics_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  int internalgetId() {
    final _getId_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolygon_getId'));
    final _handle = this.handle;
    final __result_handle = _getId_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  Metadata get metadata {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolygon_metadata_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_core_Metadata_fromFfi_nullable(__result_handle);
    } finally {
      sdk_core_Metadata_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  set metadata(Metadata value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolygon_metadata_set__Metadata'));
    final _value_handle = sdk_core_Metadata_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_core_Metadata_releaseFfiHandle_nullable(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! MapPolygon$Impl) return false;
    return __are_equal((this as MapPolygon$Impl).handle, other.handle) != 0;
  }

}

Pointer<Void> sdk_mapview_MapPolygon_toFfi(MapPolygon value) =>
  _sdk_mapview_MapPolygon_copy_handle((value as MapPolygon$Impl).handle);

MapPolygon sdk_mapview_MapPolygon_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_MapPolygon_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as MapPolygon;
  if (instance != null) return instance;

  final _copied_handle = _sdk_mapview_MapPolygon_copy_handle(handle);
  final result = MapPolygon$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_MapPolygon_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapPolygon_release_handle(handle);

Pointer<Void> sdk_mapview_MapPolygon_toFfi_nullable(MapPolygon value) =>
  value != null ? sdk_mapview_MapPolygon_toFfi(value) : Pointer<Void>.fromAddress(0);

MapPolygon sdk_mapview_MapPolygon_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapPolygon_fromFfi(handle) : null;

void sdk_mapview_MapPolygon_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapPolygon_release_handle(handle);

// End of MapPolygon "private" section.

