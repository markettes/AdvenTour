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
import 'package:here_sdk/src/sdk/core/geo_polyline.dart';
import 'package:here_sdk/src/sdk/core/metadata.dart';
import 'package:here_sdk/src/sdk/mapview/line_cap.dart';
import 'package:here_sdk/src/sdk/mapview/line_data_source.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// A visual representation of a line on the map.
///
/// The geometry to be visualized is represented
/// by an instance of [GeoPolyline].
///
/// To display the map polyline, it needs to be added to the scene using [addMapPolyline].
/// To stop displaying it, remove it from the scene using [removeMapPolyline].
abstract class MapPolyline {
  /// Creates a new MapPolyline instance containing the geometry passed in.
  /// [geometry] The list of vertices representing the polyline.
  /// [widthInPixels] The width in pixels in which to render the polyline.
  /// [color] The color with which to render the polyline. The alpha value of the color
  /// is currently ignored and set to 255 (solid).
  factory MapPolyline(GeoPolyline geometry, double widthInPixels, ui.Color color) => MapPolyline$Impl.$init(geometry, widthInPixels, color);
  /// Creates a new MapPolyline instance with an outline.
  ///
  /// The width of the outline comes on top of the polyline width, meaning that a line of
  /// width 10 and outline width of 2 will have a total width of 14 pixels.
  /// [geometry] The list of vertices representing the polyline.
  /// [widthInPixels] The width in pixels in which to render the polyline.
  /// [color] The color with which to render the polyline. The alpha value of the color is
  /// currently ignored and set to 255 (solid).
  /// [outlineWidthInPixels] The width in pixels of the outline on one side of the polyline. The total width of
  /// the polyline will thus be width_in_pixels + 2 * outline_width_in_pixels.
  /// [outlineColor] The color used to render the outline. The alpha value of the color is
  /// currently ignored and set to 255 (solid).
  factory MapPolyline.withOutlineWidthInPixelsAndOutlineColor(GeoPolyline geometry, double widthInPixels, ui.Color color, double outlineWidthInPixels, ui.Color outlineColor) => MapPolyline$Impl.withOutlineWidthInPixelsAndOutlineColor(geometry, widthInPixels, color, outlineWidthInPixels, outlineColor);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Updates the list of vertices that represent the polyline.
  /// [geometry] The updated list of vertices representing the polyline.
  updateGeometry(GeoPolyline geometry);

  /// @nodoc
  internalgenerateGraphics(LineDataSource dataSource, int mapItemId);

  /// @nodoc
  internaldestroyGraphics();

  /// @nodoc
  int internalgetId();


  /// Gets the Metadata instance attached to this polyline.
  /// This will be  if nothing has been
  /// attached before.
  Metadata get metadata;


  /// Sets the Metadata instance attached to this polyline.
  set metadata(Metadata value);




  /// Returns the line caps style of this polyline.
  LineCap get lineCap;


  /// Sets the line caps style.
  set lineCap(LineCap value);




  /// Gets the color of the line.
  ui.Color get lineColor;


  /// Sets the color of the line. Transparency (alpha channel) is not supported
  /// and is always set to 255, regardless of the input value.
  set lineColor(ui.Color value);




  /// Gets the width of the line in pixels.
  double get lineWidth;


  /// Sets the width of the line in pixels. Trying to set to a value of 0 or less
  /// has no effect.
  set lineWidth(double value);




  /// Gets the color of the outline.
  ui.Color get outlineColor;


  /// Sets the color of the outline. Transparency (alpha channel) is not supported
  /// and is always set to 255, regardless of the input value.
  set outlineColor(ui.Color value);




  /// Gets the width the outline in pixels. 0 if there is no outline.
  double get outlineWidth;


  /// Sets the width the outline in pixels. 0 to remove the outline. Trying to set
  /// negative value has no effect.
  set outlineWidth(double value);




  /// Gets MapPolyline draw order. Default value is 0.
  int get drawOrder;


  /// Sets MapPolyline draw order. Polylines with higher draw order value are drawn
  /// on top of polylines with lower draw order. In case multiple polylines have the same draw order value
  /// then the order in which they were added to the scene matters. Last added polyline is drawn on top.
  /// Allowed range is 0-1023. Values outside this range will be clamped.
  set drawOrder(int value);


}


// MapPolyline "private" section, not exported.

final _sdk_mapview_MapPolyline_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_copy_handle'));
final _sdk_mapview_MapPolyline_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_release_handle'));
final _sdk_mapview_MapPolyline_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapPolyline_get_raw_pointer'));
final __are_equal = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_are_equal'));






class MapPolyline$Impl implements MapPolyline {
  @protected
  Pointer<Void> handle;

  MapPolyline$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_MapPolyline_get_raw_pointer(handle));
    _sdk_mapview_MapPolyline_release_handle(handle);
    handle = null;
  }


  MapPolyline$Impl.$init(GeoPolyline geometry, double widthInPixels, ui.Color color) : handle = _$init(geometry, widthInPixels, color) {
    __lib.reverseCache[_sdk_mapview_MapPolyline_get_raw_pointer(handle)] = this;
  }


  MapPolyline$Impl.withOutlineWidthInPixelsAndOutlineColor(GeoPolyline geometry, double widthInPixels, ui.Color color, double outlineWidthInPixels, ui.Color outlineColor) : handle = _withOutlineWidthInPixelsAndOutlineColor(geometry, widthInPixels, color, outlineWidthInPixels, outlineColor) {
    __lib.reverseCache[_sdk_mapview_MapPolyline_get_raw_pointer(handle)] = this;
  }

  static Pointer<Void> _$init(GeoPolyline geometry, double widthInPixels, ui.Color color) {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Double, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_make__GeoPolyline_Double_Color'));
    final _geometry_handle = sdk_core_GeoPolyline_toFfi(geometry);
    final _widthInPixels_handle = (widthInPixels);
    final _color_handle = sdk_core_Color_toFfi(color);
    final __result_handle = _$init_ffi(__lib.LibraryContext.isolateId, _geometry_handle, _widthInPixels_handle, _color_handle);
    sdk_core_GeoPolyline_releaseFfiHandle(_geometry_handle);
    (_widthInPixels_handle);
    sdk_core_Color_releaseFfiHandle(_color_handle);
    return __result_handle;
  }

  static Pointer<Void> _withOutlineWidthInPixelsAndOutlineColor(GeoPolyline geometry, double widthInPixels, ui.Color color, double outlineWidthInPixels, ui.Color outlineColor) {
    final _withOutlineWidthInPixelsAndOutlineColor_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Double, Pointer<Void>, Double, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, double, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_make__GeoPolyline_Double_Color_Double_Color'));
    final _geometry_handle = sdk_core_GeoPolyline_toFfi(geometry);
    final _widthInPixels_handle = (widthInPixels);
    final _color_handle = sdk_core_Color_toFfi(color);
    final _outlineWidthInPixels_handle = (outlineWidthInPixels);
    final _outlineColor_handle = sdk_core_Color_toFfi(outlineColor);
    final __result_handle = _withOutlineWidthInPixelsAndOutlineColor_ffi(__lib.LibraryContext.isolateId, _geometry_handle, _widthInPixels_handle, _color_handle, _outlineWidthInPixels_handle, _outlineColor_handle);
    sdk_core_GeoPolyline_releaseFfiHandle(_geometry_handle);
    (_widthInPixels_handle);
    sdk_core_Color_releaseFfiHandle(_color_handle);
    (_outlineWidthInPixels_handle);
    sdk_core_Color_releaseFfiHandle(_outlineColor_handle);
    return __result_handle;
  }

  @override
  updateGeometry(GeoPolyline geometry) {
    final _updateGeometry_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_updateGeometry__GeoPolyline'));
    final _geometry_handle = sdk_core_GeoPolyline_toFfi(geometry);
    final _handle = this.handle;
    final __result_handle = _updateGeometry_ffi(_handle, __lib.LibraryContext.isolateId, _geometry_handle);
    sdk_core_GeoPolyline_releaseFfiHandle(_geometry_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internalgenerateGraphics(LineDataSource dataSource, int mapItemId) {
    final _generateGraphics_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Int64), void Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_generateGraphics__LineDataSource_Long'));
    final _dataSource_handle = sdk_mapview_LineDataSource_toFfi(dataSource);
    final _mapItemId_handle = (mapItemId);
    final _handle = this.handle;
    final __result_handle = _generateGraphics_ffi(_handle, __lib.LibraryContext.isolateId, _dataSource_handle, _mapItemId_handle);
    sdk_mapview_LineDataSource_releaseFfiHandle(_dataSource_handle);
    (_mapItemId_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internaldestroyGraphics() {
    final _destroyGraphics_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_destroyGraphics'));
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
    final _getId_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_getId'));
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
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_metadata_get'));
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
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_metadata_set__Metadata'));
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
  LineCap get lineCap {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_lineCap_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_mapview_LineCap_fromFfi(__result_handle);
    } finally {
      sdk_mapview_LineCap_releaseFfiHandle(__result_handle);
    }
  }

  @override
  set lineCap(LineCap value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapPolyline_lineCap_set__LineCap'));
    final _value_handle = sdk_mapview_LineCap_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_mapview_LineCap_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  ui.Color get lineColor {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_lineColor_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_core_Color_fromFfi(__result_handle);
    } finally {
      sdk_core_Color_releaseFfiHandle(__result_handle);
    }
  }

  @override
  set lineColor(ui.Color value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_lineColor_set__Color'));
    final _value_handle = sdk_core_Color_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_core_Color_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  double get lineWidth {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_lineWidth_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  set lineWidth(double value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapPolyline_lineWidth_set__Double'));
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
  ui.Color get outlineColor {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_outlineColor_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_core_Color_fromFfi(__result_handle);
    } finally {
      sdk_core_Color_releaseFfiHandle(__result_handle);
    }
  }

  @override
  set outlineColor(ui.Color value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_outlineColor_set__Color'));
    final _value_handle = sdk_core_Color_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_core_Color_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  double get outlineWidth {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_outlineWidth_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  set outlineWidth(double value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapPolyline_outlineWidth_set__Double'));
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
  int get drawOrder {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_drawOrder_get'));
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
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapPolyline_drawOrder_set__Int'));
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
    if (other is! MapPolyline$Impl) return false;
    return __are_equal((this as MapPolyline$Impl).handle, other.handle) != 0;
  }

}

Pointer<Void> sdk_mapview_MapPolyline_toFfi(MapPolyline value) =>
  _sdk_mapview_MapPolyline_copy_handle((value as MapPolyline$Impl).handle);

MapPolyline sdk_mapview_MapPolyline_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_MapPolyline_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as MapPolyline;
  if (instance != null) return instance;

  final _copied_handle = _sdk_mapview_MapPolyline_copy_handle(handle);
  final result = MapPolyline$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_MapPolyline_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapPolyline_release_handle(handle);

Pointer<Void> sdk_mapview_MapPolyline_toFfi_nullable(MapPolyline value) =>
  value != null ? sdk_mapview_MapPolyline_toFfi(value) : Pointer<Void>.fromAddress(0);

MapPolyline sdk_mapview_MapPolyline_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapPolyline_fromFfi(handle) : null;

void sdk_mapview_MapPolyline_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapPolyline_release_handle(handle);

// End of MapPolyline "private" section.

