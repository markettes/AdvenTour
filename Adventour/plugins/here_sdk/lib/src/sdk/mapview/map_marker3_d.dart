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

import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/metadata.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker3_d_model.dart';
import 'package:here_sdk/src/sdk/mapview/point_data_source.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// MapMarker3D represents a 3D shape rendered on the map at specified geodetic coordinates.
///
/// It can have a solid color or be textured, depending on the data from [MapMarker3DModel].
/// It can be moved around a map by updating its coordinates.
/// Its orientation can be changed by updating its bearing, pitch and roll.
abstract class MapMarker3D {
  /// Creates an instance of a marker.
  /// [at] The marker's geographical coordinates.
  /// The marker's center will be placed on the location.
  /// The center is the origin of the mesh's local coordinate system as defined in its model.
  /// [model] The 3D model used to draw marker.
  factory MapMarker3D(GeoCoordinates at, MapMarker3DModel model) => MapMarker3D$Impl.$init(at, model);
  /// Creates an instance of a marker with scale factor.
  /// [at] The marker's geographical coordinates.
  /// The marker's center will be placed on the location.
  /// The center is the origin of the mesh's local coordinate system as defined in its model.
  /// [model] The 3D model used to render the marker.
  /// [scale] Scale factor to change the initial size of an object which is expressed in
  /// screen pixels inside [MapMarker3DModel].
  /// Default scale is 1, for a scale of 2, the model is 2x larger.
  /// For a scale of 0.5, its current size shrinks to half of its original size.
  factory MapMarker3D.withScale(GeoCoordinates at, MapMarker3DModel model, double scale) => MapMarker3D$Impl.withScale(at, model, scale);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();


  /// @nodoc
  internalgenerateGraphics(PointDataSource dataSource, int mapItemId);

  /// @nodoc
  internaldestroyGraphics();

  /// @nodoc
  int internalgetId();


  /// Gets the point on the map where the marker is centered.
  GeoCoordinates get coordinates;


  /// Sets the point on the map where the marker is centered.
  set coordinates(GeoCoordinates value);




  /// Gets the Metadata instance attached to this marker.
  /// This will be `null` if nothing has been attached before.
  Metadata get metadata;


  /// Sets the Metadata instance attached to this marker.
  set metadata(Metadata value);




  /// Gets the bearing in degrees, from the true North in clockwise direction.
  /// Bearing axis is perpendicular to ground and passes through the marker's location.
  double get bearing;


  /// Sets the bearing in degrees, from the true North in clockwise direction.
  /// Bearing axis is perpendicular to ground and passes through the marker's location.
  set bearing(double value);




  /// Gets the roll of the 3D map marker in degrees.
  double get roll;


  /// Sets the roll of the 3D map marker in degrees.
  set roll(double value);




  /// Gets the pitch of the 3D map marker in degrees.
  double get pitch;


  /// Sets the pitch of the 3D map marker in degrees.
  set pitch(double value);




  /// Gets the scale factor.
  double get scale;


  /// Sets the scale factor.
  set scale(double value);


}


// MapMarker3D "private" section, not exported.

final _sdk_mapview_MapMarker3D_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3D_copy_handle'));
final _sdk_mapview_MapMarker3D_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3D_release_handle'));
final _sdk_mapview_MapMarker3D_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapMarker3D_get_raw_pointer'));
final __are_equal = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3D_are_equal'));





class MapMarker3D$Impl implements MapMarker3D {
  @protected
  Pointer<Void> handle;

  MapMarker3D$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_MapMarker3D_get_raw_pointer(handle));
    _sdk_mapview_MapMarker3D_release_handle(handle);
    handle = null;
  }


  MapMarker3D$Impl.$init(GeoCoordinates at, MapMarker3DModel model) : handle = _$init(at, model) {
    __lib.reverseCache[_sdk_mapview_MapMarker3D_get_raw_pointer(handle)] = this;
  }


  MapMarker3D$Impl.withScale(GeoCoordinates at, MapMarker3DModel model, double scale) : handle = _withScale(at, model, scale) {
    __lib.reverseCache[_sdk_mapview_MapMarker3D_get_raw_pointer(handle)] = this;
  }

  static Pointer<Void> _$init(GeoCoordinates at, MapMarker3DModel model) {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3D_make__GeoCoordinates_MapMarker3DModel'));
    final _at_handle = sdk_core_GeoCoordinates_toFfi(at);
    final _model_handle = sdk_mapview_MapMarker3DModel_toFfi(model);
    final __result_handle = _$init_ffi(__lib.LibraryContext.isolateId, _at_handle, _model_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_at_handle);
    sdk_mapview_MapMarker3DModel_releaseFfiHandle(_model_handle);
    return __result_handle;
  }

  static Pointer<Void> _withScale(GeoCoordinates at, MapMarker3DModel model, double scale) {
    final _withScale_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Double), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, double)>('here_sdk_sdk_mapview_MapMarker3D_make__GeoCoordinates_MapMarker3DModel_Double'));
    final _at_handle = sdk_core_GeoCoordinates_toFfi(at);
    final _model_handle = sdk_mapview_MapMarker3DModel_toFfi(model);
    final _scale_handle = (scale);
    final __result_handle = _withScale_ffi(__lib.LibraryContext.isolateId, _at_handle, _model_handle, _scale_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_at_handle);
    sdk_mapview_MapMarker3DModel_releaseFfiHandle(_model_handle);
    (_scale_handle);
    return __result_handle;
  }

  @override
  internalgenerateGraphics(PointDataSource dataSource, int mapItemId) {
    final _generateGraphics_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Int64), void Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker3D_generateGraphics__PointDataSource_Long'));
    final _dataSource_handle = sdk_mapview_PointDataSource_toFfi(dataSource);
    final _mapItemId_handle = (mapItemId);
    final _handle = this.handle;
    final __result_handle = _generateGraphics_ffi(_handle, __lib.LibraryContext.isolateId, _dataSource_handle, _mapItemId_handle);
    sdk_mapview_PointDataSource_releaseFfiHandle(_dataSource_handle);
    (_mapItemId_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internaldestroyGraphics() {
    final _destroyGraphics_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker3D_destroyGraphics'));
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
    final _getId_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker3D_getId'));
    final _handle = this.handle;
    final __result_handle = _getId_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  GeoCoordinates get coordinates {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker3D_coordinates_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_core_GeoCoordinates_fromFfi(__result_handle);
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle(__result_handle);
    }
  }

  @override
  set coordinates(GeoCoordinates value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3D_coordinates_set__GeoCoordinates'));
    final _value_handle = sdk_core_GeoCoordinates_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  Metadata get metadata {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker3D_metadata_get'));
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
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3D_metadata_set__Metadata'));
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
  double get bearing {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker3D_bearing_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  set bearing(double value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapMarker3D_bearing_set__Double'));
    final _value_handle = (value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    (_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  double get roll {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker3D_roll_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  set roll(double value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapMarker3D_roll_set__Double'));
    final _value_handle = (value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    (_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  double get pitch {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker3D_pitch_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  set pitch(double value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapMarker3D_pitch_set__Double'));
    final _value_handle = (value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    (_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  double get scale {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker3D_scale_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  set scale(double value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapMarker3D_scale_set__Double'));
    final _value_handle = (value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    (_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! MapMarker3D$Impl) return false;
    return __are_equal((this as MapMarker3D$Impl).handle, other.handle) != 0;
  }

}

Pointer<Void> sdk_mapview_MapMarker3D_toFfi(MapMarker3D value) =>
  _sdk_mapview_MapMarker3D_copy_handle((value as MapMarker3D$Impl).handle);

MapMarker3D sdk_mapview_MapMarker3D_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_MapMarker3D_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as MapMarker3D;
  if (instance != null) return instance;

  final _copied_handle = _sdk_mapview_MapMarker3D_copy_handle(handle);
  final result = MapMarker3D$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_MapMarker3D_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapMarker3D_release_handle(handle);

Pointer<Void> sdk_mapview_MapMarker3D_toFfi_nullable(MapMarker3D value) =>
  value != null ? sdk_mapview_MapMarker3D_toFfi(value) : Pointer<Void>.fromAddress(0);

MapMarker3D sdk_mapview_MapMarker3D_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapMarker3D_fromFfi(handle) : null;

void sdk_mapview_MapMarker3D_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapMarker3D_release_handle(handle);

// End of MapMarker3D "private" section.

