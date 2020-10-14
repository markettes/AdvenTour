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

import 'dart:typed_data';
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/mapview/image_format.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents a drawable resource that can be used by a MapMarker to be shown on the map.
abstract class MapImage {
  /// Creates a new map image from the provided image data.
  ///
  /// Currently only [ImageFormat.png]
  /// is accepted.
  /// [pixelData] Data to be used for the image.
  /// [imageFormat] The format of the image data to be used.
  factory MapImage.withPixelDataAndImageFormat(Uint8List pixelData, ImageFormat imageFormat) => MapImage$Impl.withPixelDataAndImageFormat(pixelData, imageFormat);
  /// Creates a new map image from the provided image data.
  ///
  /// Currently only [ImageFormat.svg]
  /// is accepted.
  /// [imageData] Data to be used for the image.
  /// [imageFormat] The format of the image data to be used.
  /// [width] Width of the image in pixels
  /// [height] Height of the image in pixels
  factory MapImage.withImageDataImageFormatWidthAndHeight(Uint8List imageData, ImageFormat imageFormat, int width, int height) => MapImage$Impl.withImageDataImageFormatWidthAndHeight(imageData, imageFormat, width, height);
  /// Creates a new map image from the provided image data.
  ///
  /// Currently only PNG format is accepted.
  /// [imageData] Data to be used for the image.
  /// Throws [MapImageInstantiationException]. Indicates what went wrong when the instantiation was attempted.
  /// @nodoc
  factory MapImage.withImageData(Uint8List imageData) => MapImage$Impl.internalwithImageData(imageData);
  /// Creates a new map image from the provided image data.
  ///
  /// Currently only SVG Tiny and PNG is supported.
  /// [imageData] Data to be used for the image.
  /// [width] Width of the image in pixels
  /// [height] Height of the image in pixels
  /// Throws [MapImageInstantiationException]. Indicates what went wrong when the instantiation was attempted.
  /// @nodoc
  factory MapImage.withImageDataWidthAndHeight(Uint8List imageData, int width, int height) => MapImage$Impl.internalwithImageDataWidthAndHeight(imageData, width, height);
  /// Creates a new map image from the provided path to the SVG Tiny or PNG image.
  ///
  /// Will throw an error
  /// if either the height or width equals zero or the path is empty. Trying to load the data that is
  /// not compliant with SVG Tiny or PNG could result in an undefined behavior.
  /// [filePath] The path to image file
  /// [width] Width of image in pixels
  /// [height] Height of image in pixels
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  factory MapImage.withFilePathAndWidthAndHeight(String filePath, int width, int height) => MapImage$Impl.withFilePathAndWidthAndHeight(filePath, width, height);
  /// Creates a new map image from the provided path to the SVG Tiny or PNG image.
  ///
  /// Will throw an error
  /// if either the height or width equals zero or the path is empty. Trying to load the data that is
  /// not compliant with SVG Tiny or PNG could result in an undefined behavior.
  /// [filePath] The path to image file
  /// [width] Width of image in pixels
  /// [height] Height of image in pixels
  /// Throws [MapImageInstantiationException]. Indicates what went wrong when the instantiation was attempted.
  /// @nodoc
  factory MapImage.withFilePathAndSignedWidthAndHeight(String filePath, int width, int height) => MapImage$Impl.internalwithFilePathAndSignedWidthAndHeight(filePath, width, height);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();



  /// Returns the width of the image in pixels.
  /// @nodoc
  int get internalwidth;





  /// Returns the height of the image in pixels.
  /// @nodoc
  int get internalheight;





  /// Returns resource id as visible in HARP
  /// @nodoc
  String get internalresourceId;



}

/// Indicates the reason for a failure to create [MapImage].
/// @nodoc
enum MapImageInstantiationErrorCode {
    /// Unknown problem occurred while trying to create [MapImage].
    unknown,
    /// The provided image data is not recognized as any of the supported image formats.
    unsupportedImageFormat,
    /// The provided image dimensions are invalid.
    invalidImageDimensions,
    /// Provided path to image file is empty.
    emptyFilePath,
    /// Provided image data is empty.
    emptyImageData
}

// MapImageInstantiationErrorCode "private" section, not exported.

int sdk_mapview_MapImage_InstantiationErrorCode_toFfi(MapImageInstantiationErrorCode value) {
  switch (value) {
  case MapImageInstantiationErrorCode.unknown:
    return 1;
  break;
  case MapImageInstantiationErrorCode.unsupportedImageFormat:
    return 2;
  break;
  case MapImageInstantiationErrorCode.invalidImageDimensions:
    return 3;
  break;
  case MapImageInstantiationErrorCode.emptyFilePath:
    return 4;
  break;
  case MapImageInstantiationErrorCode.emptyImageData:
    return 5;
  break;
  default:
    throw StateError("Invalid enum value $value for MapImageInstantiationErrorCode enum.");
  }
}

MapImageInstantiationErrorCode sdk_mapview_MapImage_InstantiationErrorCode_fromFfi(int handle) {
  switch (handle) {
  case 1:
    return MapImageInstantiationErrorCode.unknown;
  break;
  case 2:
    return MapImageInstantiationErrorCode.unsupportedImageFormat;
  break;
  case 3:
    return MapImageInstantiationErrorCode.invalidImageDimensions;
  break;
  case 4:
    return MapImageInstantiationErrorCode.emptyFilePath;
  break;
  case 5:
    return MapImageInstantiationErrorCode.emptyImageData;
  break;
  default:
    throw StateError("Invalid numeric value $handle for MapImageInstantiationErrorCode enum.");
  }
}

void sdk_mapview_MapImage_InstantiationErrorCode_releaseFfiHandle(int handle) {}

final _sdk_mapview_MapImage_InstantiationErrorCode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapImage_InstantiationErrorCode_create_handle_nullable'));
final _sdk_mapview_MapImage_InstantiationErrorCode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_InstantiationErrorCode_release_handle_nullable'));
final _sdk_mapview_MapImage_InstantiationErrorCode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_InstantiationErrorCode_get_value_nullable'));

Pointer<Void> sdk_mapview_MapImage_InstantiationErrorCode_toFfi_nullable(MapImageInstantiationErrorCode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_MapImage_InstantiationErrorCode_toFfi(value);
  final result = _sdk_mapview_MapImage_InstantiationErrorCode_create_handle_nullable(_handle);
  sdk_mapview_MapImage_InstantiationErrorCode_releaseFfiHandle(_handle);
  return result;
}

MapImageInstantiationErrorCode sdk_mapview_MapImage_InstantiationErrorCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_MapImage_InstantiationErrorCode_get_value_nullable(handle);
  final result = sdk_mapview_MapImage_InstantiationErrorCode_fromFfi(_handle);
  sdk_mapview_MapImage_InstantiationErrorCode_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_MapImage_InstantiationErrorCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapImage_InstantiationErrorCode_release_handle_nullable(handle);

// End of MapImageInstantiationErrorCode "private" section.
/// Thrown when a problem occurs while trying to create [MapImage].
/// @nodoc
class MapImageInstantiationException implements Exception {
  final MapImageInstantiationErrorCode error;
  MapImageInstantiationException(this.error);
}

// MapImage "private" section, not exported.

final _sdk_mapview_MapImage_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_copy_handle'));
final _sdk_mapview_MapImage_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_release_handle'));
final _sdk_mapview_MapImage_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapImage_get_raw_pointer'));



final _withImageData_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__Blob_return_release_handle'));
final _withImageData_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__Blob_return_get_result'));
final _withImageData_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__Blob_return_get_error'));
final _withImageData_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__Blob_return_has_error'));


final _withImageDataWidthAndHeight_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__Blob_Int_Int_return_release_handle'));
final _withImageDataWidthAndHeight_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__Blob_Int_Int_return_get_result'));
final _withImageDataWidthAndHeight_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__Blob_Int_Int_return_get_error'));
final _withImageDataWidthAndHeight_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__Blob_Int_Int_return_has_error'));


final _withFilePathAndWidthAndHeight_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt_return_release_handle'));
final _withFilePathAndWidthAndHeight_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt_return_get_result'));
final _withFilePathAndWidthAndHeight_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt_return_get_error'));
final _withFilePathAndWidthAndHeight_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt_return_has_error'));


final _withFilePathAndSignedWidthAndHeight_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_Int_Int_return_release_handle'));
final _withFilePathAndSignedWidthAndHeight_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_Int_Int_return_get_result'));
final _withFilePathAndSignedWidthAndHeight_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_Int_Int_return_get_error'));
final _withFilePathAndSignedWidthAndHeight_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_Int_Int_return_has_error'));


class MapImage$Impl implements MapImage {
  @protected
  Pointer<Void> handle;

  MapImage$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_MapImage_get_raw_pointer(handle));
    _sdk_mapview_MapImage_release_handle(handle);
    handle = null;
  }


  MapImage$Impl.withPixelDataAndImageFormat(Uint8List pixelData, ImageFormat imageFormat) : handle = _withPixelDataAndImageFormat(pixelData, imageFormat) {
    __lib.reverseCache[_sdk_mapview_MapImage_get_raw_pointer(handle)] = this;
  }


  MapImage$Impl.withImageDataImageFormatWidthAndHeight(Uint8List imageData, ImageFormat imageFormat, int width, int height) : handle = _withImageDataImageFormatWidthAndHeight(imageData, imageFormat, width, height) {
    __lib.reverseCache[_sdk_mapview_MapImage_get_raw_pointer(handle)] = this;
  }


  MapImage$Impl.internalwithImageData(Uint8List imageData) : handle = _withImageData(imageData) {
    __lib.reverseCache[_sdk_mapview_MapImage_get_raw_pointer(handle)] = this;
  }


  MapImage$Impl.internalwithImageDataWidthAndHeight(Uint8List imageData, int width, int height) : handle = _withImageDataWidthAndHeight(imageData, width, height) {
    __lib.reverseCache[_sdk_mapview_MapImage_get_raw_pointer(handle)] = this;
  }


  MapImage$Impl.withFilePathAndWidthAndHeight(String filePath, int width, int height) : handle = _withFilePathAndWidthAndHeight(filePath, width, height) {
    __lib.reverseCache[_sdk_mapview_MapImage_get_raw_pointer(handle)] = this;
  }


  MapImage$Impl.internalwithFilePathAndSignedWidthAndHeight(String filePath, int width, int height) : handle = _withFilePathAndSignedWidthAndHeight(filePath, width, height) {
    __lib.reverseCache[_sdk_mapview_MapImage_get_raw_pointer(handle)] = this;
  }

  static Pointer<Void> _withPixelDataAndImageFormat(Uint8List pixelData, ImageFormat imageFormat) {
    final _withPixelDataAndImageFormat_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32), Pointer<Void> Function(int, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapImage_make__Blob_ImageFormat'));
    final _pixelData_handle = Blob_toFfi(pixelData);
    final _imageFormat_handle = sdk_mapview_ImageFormat_toFfi(imageFormat);
    final __result_handle = _withPixelDataAndImageFormat_ffi(__lib.LibraryContext.isolateId, _pixelData_handle, _imageFormat_handle);
    Blob_releaseFfiHandle(_pixelData_handle);
    sdk_mapview_ImageFormat_releaseFfiHandle(_imageFormat_handle);
    return __result_handle;
  }

  static Pointer<Void> _withImageDataImageFormatWidthAndHeight(Uint8List imageData, ImageFormat imageFormat, int width, int height) {
    final _withImageDataImageFormatWidthAndHeight_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int, int)>('here_sdk_sdk_mapview_MapImage_make__Blob_ImageFormat_UInt_UInt'));
    final _imageData_handle = Blob_toFfi(imageData);
    final _imageFormat_handle = sdk_mapview_ImageFormat_toFfi(imageFormat);
    final _width_handle = (width);
    final _height_handle = (height);
    final __result_handle = _withImageDataImageFormatWidthAndHeight_ffi(__lib.LibraryContext.isolateId, _imageData_handle, _imageFormat_handle, _width_handle, _height_handle);
    Blob_releaseFfiHandle(_imageData_handle);
    sdk_mapview_ImageFormat_releaseFfiHandle(_imageFormat_handle);
    (_width_handle);
    (_height_handle);
    return __result_handle;
  }

  static Pointer<Void> _withImageData(Uint8List imageData) {
    final _withImageData_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapImage_make__Blob'));
    final _imageData_handle = Blob_toFfi(imageData);
    final __call_result_handle = _withImageData_ffi(__lib.LibraryContext.isolateId, _imageData_handle);
    Blob_releaseFfiHandle(_imageData_handle);
    if (_withImageData_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _withImageData_return_get_error(__call_result_handle);
        _withImageData_return_release_handle(__call_result_handle);
        try {
          throw MapImageInstantiationException(sdk_mapview_MapImage_InstantiationErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_mapview_MapImage_InstantiationErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _withImageData_return_get_result(__call_result_handle);
    _withImageData_return_release_handle(__call_result_handle);
    return __result_handle;
  }

  static Pointer<Void> _withImageDataWidthAndHeight(Uint8List imageData, int width, int height) {
    final _withImageDataWidthAndHeight_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Int32, Int32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapImage_make__Blob_Int_Int'));
    final _imageData_handle = Blob_toFfi(imageData);
    final _width_handle = (width);
    final _height_handle = (height);
    final __call_result_handle = _withImageDataWidthAndHeight_ffi(__lib.LibraryContext.isolateId, _imageData_handle, _width_handle, _height_handle);
    Blob_releaseFfiHandle(_imageData_handle);
    (_width_handle);
    (_height_handle);
    if (_withImageDataWidthAndHeight_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _withImageDataWidthAndHeight_return_get_error(__call_result_handle);
        _withImageDataWidthAndHeight_return_release_handle(__call_result_handle);
        try {
          throw MapImageInstantiationException(sdk_mapview_MapImage_InstantiationErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_mapview_MapImage_InstantiationErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _withImageDataWidthAndHeight_return_get_result(__call_result_handle);
    _withImageDataWidthAndHeight_return_release_handle(__call_result_handle);
    return __result_handle;
  }

  static Pointer<Void> _withFilePathAndWidthAndHeight(String filePath, int width, int height) {
    final _withFilePathAndWidthAndHeight_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt'));
    final _filePath_handle = String_toFfi(filePath);
    final _width_handle = (width);
    final _height_handle = (height);
    final __call_result_handle = _withFilePathAndWidthAndHeight_ffi(__lib.LibraryContext.isolateId, _filePath_handle, _width_handle, _height_handle);
    String_releaseFfiHandle(_filePath_handle);
    (_width_handle);
    (_height_handle);
    if (_withFilePathAndWidthAndHeight_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _withFilePathAndWidthAndHeight_return_get_error(__call_result_handle);
        _withFilePathAndWidthAndHeight_return_release_handle(__call_result_handle);
        try {
          throw InstantiationException(sdk_core_errors_InstantiationErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_core_errors_InstantiationErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _withFilePathAndWidthAndHeight_return_get_result(__call_result_handle);
    _withFilePathAndWidthAndHeight_return_release_handle(__call_result_handle);
    return __result_handle;
  }

  static Pointer<Void> _withFilePathAndSignedWidthAndHeight(String filePath, int width, int height) {
    final _withFilePathAndSignedWidthAndHeight_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Int32, Int32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapImage_make__String_Int_Int'));
    final _filePath_handle = String_toFfi(filePath);
    final _width_handle = (width);
    final _height_handle = (height);
    final __call_result_handle = _withFilePathAndSignedWidthAndHeight_ffi(__lib.LibraryContext.isolateId, _filePath_handle, _width_handle, _height_handle);
    String_releaseFfiHandle(_filePath_handle);
    (_width_handle);
    (_height_handle);
    if (_withFilePathAndSignedWidthAndHeight_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _withFilePathAndSignedWidthAndHeight_return_get_error(__call_result_handle);
        _withFilePathAndSignedWidthAndHeight_return_release_handle(__call_result_handle);
        try {
          throw MapImageInstantiationException(sdk_mapview_MapImage_InstantiationErrorCode_fromFfi(__error_handle));
        } finally {
          sdk_mapview_MapImage_InstantiationErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _withFilePathAndSignedWidthAndHeight_return_get_result(__call_result_handle);
    _withFilePathAndSignedWidthAndHeight_return_release_handle(__call_result_handle);
    return __result_handle;
  }

  @override
  int get internalwidth {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapImage_width_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  int get internalheight {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapImage_height_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  String get internalresourceId {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapImage_resourceId_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }



}

Pointer<Void> sdk_mapview_MapImage_toFfi(MapImage value) =>
  _sdk_mapview_MapImage_copy_handle((value as MapImage$Impl).handle);

MapImage sdk_mapview_MapImage_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_MapImage_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as MapImage;
  if (instance != null) return instance;

  final _copied_handle = _sdk_mapview_MapImage_copy_handle(handle);
  final result = MapImage$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_MapImage_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapImage_release_handle(handle);

Pointer<Void> sdk_mapview_MapImage_toFfi_nullable(MapImage value) =>
  value != null ? sdk_mapview_MapImage_toFfi(value) : Pointer<Void>.fromAddress(0);

MapImage sdk_mapview_MapImage_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapImage_fromFfi(handle) : null;

void sdk_mapview_MapImage_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapImage_release_handle(handle);

// End of MapImage "private" section.

