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
import 'package:here_sdk/src/sdk/core/anchor2_d.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/metadata.dart';
import 'package:here_sdk/src/sdk/mapview/map_image.dart';
import 'package:here_sdk/src/sdk/mapview/point_data_source.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// MapMarker is used to draw images on the map, for example to mark a specific location.
///
/// By default, the marker is centered on the given geographic coordinates.
/// Markers keep their size regardless of the current zoom level of the map view.
///
/// The image to be displayed is represented by [MapImage] object. For performance reasons,
/// it is highly recommended to reuse a single instance of the image when creating multiple
/// identical markers.
///
/// To display the map marker, it needs to be added to the scene using [addMapMarker].
/// To stop displaying it, remove it from the scene using [removeMapMarker].
abstract class MapMarker {
  /// Creates an instance of a marker at given coordinates, represented by specified image.
  /// [at] The marker's geographical coordinates.
  /// [image] The image to draw on the map.
  factory MapMarker(GeoCoordinates at, MapImage image) => MapMarker$Impl.$init(at, image);
  /// Creates an instance of a marker at given coordinates, represented by specified image,
  /// with anchor point specifying how the image is positioned relative to the marker's coordinates.
  ///
  /// The anchor is a way of specifying position offset relative to image's dimensions on the screen.
  /// For example, (0, 0) places the top-left corner of the image at the marker's coordinates.
  /// (1, 1) would place the bottom-right corner of the image at the marker's coordinates.
  /// (0.5, 0.5) which is the default value would center the image at the marker's coordinates.
  /// Values outside the 0..1 range are also allowed, for example (0.5, 2) would display the image
  /// centered horizontally with its bottom edge above the marker's coordinates at the distance
  /// in pixels that is equal to the height of the image.
  /// [at] The marker's geographical coordinates.
  /// [image] The image to draw on the map.
  /// [anchor] The anchor point for the marker image which specifies the position offset relative
  /// to the marker's coordinates.
  factory MapMarker.withAnchor(GeoCoordinates at, MapImage image, Anchor2D anchor) => MapMarker$Impl.withAnchor(at, image, anchor);

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


  /// Gets the point on the map where the marker is drawn.
  GeoCoordinates get coordinates;


  /// Sets the point on the map where the marker is drawn.
  set coordinates(GeoCoordinates value);




  /// Gets the Metadata instance attached to this marker.
  /// This will be `null` if nothing has been attached before.
  Metadata get metadata;


  /// Sets the Metadata instance attached to this marker.
  set metadata(Metadata value);




  /// Gets MapMarker draw order. The default value is 0.
  int get drawOrder;


  /// Sets MapMarker draw order. Markers with higher draw order value are drawn
  /// on top of markers with lower draw order. In case multiple markers have the same draw order value
  /// then the order in which they were added to the scene matters. Last added marker is drawn on top.
  /// Allowed range is \[0, 1023\]. Values outside this range will be clamped.
  set drawOrder(int value);




  /// Gets currently use map image
  MapImage get image;


  /// Sets map image used to represent marker on screen
  set image(MapImage value);


}


// MapMarker "private" section, not exported.

final _sdk_mapview_MapMarker_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker_copy_handle'));
final _sdk_mapview_MapMarker_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker_release_handle'));
final _sdk_mapview_MapMarker_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapMarker_get_raw_pointer'));
final __are_equal = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker_are_equal'));





class MapMarker$Impl implements MapMarker {
  @protected
  Pointer<Void> handle;

  MapMarker$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_MapMarker_get_raw_pointer(handle));
    _sdk_mapview_MapMarker_release_handle(handle);
    handle = null;
  }


  MapMarker$Impl.$init(GeoCoordinates at, MapImage image) : handle = _$init(at, image) {
    __lib.reverseCache[_sdk_mapview_MapMarker_get_raw_pointer(handle)] = this;
  }


  MapMarker$Impl.withAnchor(GeoCoordinates at, MapImage image, Anchor2D anchor) : handle = _withAnchor(at, image, anchor) {
    __lib.reverseCache[_sdk_mapview_MapMarker_get_raw_pointer(handle)] = this;
  }

  static Pointer<Void> _$init(GeoCoordinates at, MapImage image) {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker_make__GeoCoordinates_MapImage'));
    final _at_handle = sdk_core_GeoCoordinates_toFfi(at);
    final _image_handle = sdk_mapview_MapImage_toFfi(image);
    final __result_handle = _$init_ffi(__lib.LibraryContext.isolateId, _at_handle, _image_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_at_handle);
    sdk_mapview_MapImage_releaseFfiHandle(_image_handle);
    return __result_handle;
  }

  static Pointer<Void> _withAnchor(GeoCoordinates at, MapImage image, Anchor2D anchor) {
    final _withAnchor_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker_make__GeoCoordinates_MapImage_Anchor2D'));
    final _at_handle = sdk_core_GeoCoordinates_toFfi(at);
    final _image_handle = sdk_mapview_MapImage_toFfi(image);
    final _anchor_handle = sdk_core_Anchor2D_toFfi(anchor);
    final __result_handle = _withAnchor_ffi(__lib.LibraryContext.isolateId, _at_handle, _image_handle, _anchor_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_at_handle);
    sdk_mapview_MapImage_releaseFfiHandle(_image_handle);
    sdk_core_Anchor2D_releaseFfiHandle(_anchor_handle);
    return __result_handle;
  }

  @override
  internalgenerateGraphics(PointDataSource dataSource, int mapItemId) {
    final _generateGraphics_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Int64), void Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker_generateGraphics__PointDataSource_Long'));
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
    final _destroyGraphics_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker_destroyGraphics'));
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
    final _getId_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker_getId'));
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
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker_coordinates_get'));
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
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker_coordinates_set__GeoCoordinates'));
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
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker_metadata_get'));
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
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker_metadata_set__Metadata'));
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
  int get drawOrder {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker_drawOrder_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  set drawOrder(int value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapMarker_drawOrder_set__Int'));
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
  MapImage get image {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker_image_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_mapview_MapImage_fromFfi(__result_handle);
    } finally {
      sdk_mapview_MapImage_releaseFfiHandle(__result_handle);
    }
  }

  @override
  set image(MapImage value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker_image_set__MapImage'));
    final _value_handle = sdk_mapview_MapImage_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_mapview_MapImage_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! MapMarker$Impl) return false;
    return __are_equal((this as MapMarker$Impl).handle, other.handle) != 0;
  }

}

Pointer<Void> sdk_mapview_MapMarker_toFfi(MapMarker value) =>
  _sdk_mapview_MapMarker_copy_handle((value as MapMarker$Impl).handle);

MapMarker sdk_mapview_MapMarker_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_MapMarker_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as MapMarker;
  if (instance != null) return instance;

  final _copied_handle = _sdk_mapview_MapMarker_copy_handle(handle);
  final result = MapMarker$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_MapMarker_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapMarker_release_handle(handle);

Pointer<Void> sdk_mapview_MapMarker_toFfi_nullable(MapMarker value) =>
  value != null ? sdk_mapview_MapMarker_toFfi(value) : Pointer<Void>.fromAddress(0);

MapMarker sdk_mapview_MapMarker_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapMarker_fromFfi(handle) : null;

void sdk_mapview_MapMarker_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapMarker_release_handle(handle);

// End of MapMarker "private" section.

