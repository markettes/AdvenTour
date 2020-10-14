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

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents a 3D model that can be used by a [MapMarker3D] to be shown on the map.
///
/// Geometry of 3D marker can be provided in form of a Wavefront OBJ file as specified in
/// http://www.martinreddy.net/gfx/3d/OBJ.spec.
/// HERE SDK only supports the following set of features of the OBJ specification:
/// - Triangle Meshes
/// - Following vertex attributes must be present:
///   - Vertex Position
///   - Vertex Normal
///   - Texture Coordinates
///   - Geometry must be indexed (contain an Index Buffer)
///   - Face element
///     HERE SDK does not support
/// - Multi Texturing
/// - Materials (mtllib \[external .mtl file name\] )
///   - Lines
///   - Higher Order Surfaces
///   - Vendor specific extensions
///
/// For supported texture formats, SDK allows the following formats to be specified:
/// JPG, PNG, SVG, GPU compressed texture formats: ECT1 (OpenGL only), YUV, ASTC, KTX.
abstract class MapMarker3DModel {
  /// Creates a new 3D model from path to .obj file, texture and color.
  /// [geometryFilePath] Absolute path to obj file.
  /// [textureFilePath] Absolute path to texture file.
  /// [color] Color to be blend with texture.
  factory MapMarker3DModel.withTextureFilePathAndColor(String geometryFilePath, String textureFilePath, ui.Color color) => MapMarker3DModel$Impl.withTextureFilePathAndColor(geometryFilePath, textureFilePath, color);
  /// Creates a new 3D model from path to .obj file and texture.
  /// [geometryFilePath] Absolute path to obj file.
  /// [textureFilePath] Absolute path to texture file.
  factory MapMarker3DModel.withTextureFilePath(String geometryFilePath, String textureFilePath) => MapMarker3DModel$Impl.withTextureFilePath(geometryFilePath, textureFilePath);
  /// Creates a new 3D model from path to .obj file.
  /// [geometryFilePath] Absolute path to obj file.
  factory MapMarker3DModel(String geometryFilePath) => MapMarker3DModel$Impl.$init(geometryFilePath);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

}


// MapMarker3DModel "private" section, not exported.

final _sdk_mapview_MapMarker3DModel_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3DModel_copy_handle'));
final _sdk_mapview_MapMarker3DModel_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3DModel_release_handle'));
final _sdk_mapview_MapMarker3DModel_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapMarker3DModel_get_raw_pointer'));




class MapMarker3DModel$Impl implements MapMarker3DModel {
  @protected
  Pointer<Void> handle;

  MapMarker3DModel$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_MapMarker3DModel_get_raw_pointer(handle));
    _sdk_mapview_MapMarker3DModel_release_handle(handle);
    handle = null;
  }


  MapMarker3DModel$Impl.withTextureFilePathAndColor(String geometryFilePath, String textureFilePath, ui.Color color) : handle = _withTextureFilePathAndColor(geometryFilePath, textureFilePath, color) {
    __lib.reverseCache[_sdk_mapview_MapMarker3DModel_get_raw_pointer(handle)] = this;
  }


  MapMarker3DModel$Impl.withTextureFilePath(String geometryFilePath, String textureFilePath) : handle = _withTextureFilePath(geometryFilePath, textureFilePath) {
    __lib.reverseCache[_sdk_mapview_MapMarker3DModel_get_raw_pointer(handle)] = this;
  }


  MapMarker3DModel$Impl.$init(String geometryFilePath) : handle = _$init(geometryFilePath) {
    __lib.reverseCache[_sdk_mapview_MapMarker3DModel_get_raw_pointer(handle)] = this;
  }

  static Pointer<Void> _withTextureFilePathAndColor(String geometryFilePath, String textureFilePath, ui.Color color) {
    final _withTextureFilePathAndColor_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3DModel_make__String_String_Color'));
    final _geometryFilePath_handle = String_toFfi(geometryFilePath);
    final _textureFilePath_handle = String_toFfi(textureFilePath);
    final _color_handle = sdk_core_Color_toFfi(color);
    final __result_handle = _withTextureFilePathAndColor_ffi(__lib.LibraryContext.isolateId, _geometryFilePath_handle, _textureFilePath_handle, _color_handle);
    String_releaseFfiHandle(_geometryFilePath_handle);
    String_releaseFfiHandle(_textureFilePath_handle);
    sdk_core_Color_releaseFfiHandle(_color_handle);
    return __result_handle;
  }

  static Pointer<Void> _withTextureFilePath(String geometryFilePath, String textureFilePath) {
    final _withTextureFilePath_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3DModel_make__String_String'));
    final _geometryFilePath_handle = String_toFfi(geometryFilePath);
    final _textureFilePath_handle = String_toFfi(textureFilePath);
    final __result_handle = _withTextureFilePath_ffi(__lib.LibraryContext.isolateId, _geometryFilePath_handle, _textureFilePath_handle);
    String_releaseFfiHandle(_geometryFilePath_handle);
    String_releaseFfiHandle(_textureFilePath_handle);
    return __result_handle;
  }

  static Pointer<Void> _$init(String geometryFilePath) {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3DModel_make__String'));
    final _geometryFilePath_handle = String_toFfi(geometryFilePath);
    final __result_handle = _$init_ffi(__lib.LibraryContext.isolateId, _geometryFilePath_handle);
    String_releaseFfiHandle(_geometryFilePath_handle);
    return __result_handle;
  }


}

Pointer<Void> sdk_mapview_MapMarker3DModel_toFfi(MapMarker3DModel value) =>
  _sdk_mapview_MapMarker3DModel_copy_handle((value as MapMarker3DModel$Impl).handle);

MapMarker3DModel sdk_mapview_MapMarker3DModel_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_MapMarker3DModel_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as MapMarker3DModel;
  if (instance != null) return instance;

  final _copied_handle = _sdk_mapview_MapMarker3DModel_copy_handle(handle);
  final result = MapMarker3DModel$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_MapMarker3DModel_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapMarker3DModel_release_handle(handle);

Pointer<Void> sdk_mapview_MapMarker3DModel_toFfi_nullable(MapMarker3DModel value) =>
  value != null ? sdk_mapview_MapMarker3DModel_toFfi(value) : Pointer<Void>.fromAddress(0);

MapMarker3DModel sdk_mapview_MapMarker3DModel_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapMarker3DModel_fromFfi(handle) : null;

void sdk_mapview_MapMarker3DModel_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapMarker3DModel_release_handle(handle);

// End of MapMarker3DModel "private" section.

