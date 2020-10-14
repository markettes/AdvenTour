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


import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

enum ImageFormat {
    /// The image data is in a compressed PNG format, no decompression or processing has
    /// been performed on it.
    png,
    /// The image data is in SVG Tiny format
    svg
}

// ImageFormat "private" section, not exported.

int sdk_mapview_ImageFormat_toFfi(ImageFormat value) {
  switch (value) {
  case ImageFormat.png:
    return 0;
  break;
  case ImageFormat.svg:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for ImageFormat enum.");
  }
}

ImageFormat sdk_mapview_ImageFormat_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return ImageFormat.png;
  break;
  case 1:
    return ImageFormat.svg;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ImageFormat enum.");
  }
}

void sdk_mapview_ImageFormat_releaseFfiHandle(int handle) {}

final _sdk_mapview_ImageFormat_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_ImageFormat_create_handle_nullable'));
final _sdk_mapview_ImageFormat_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_ImageFormat_release_handle_nullable'));
final _sdk_mapview_ImageFormat_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_ImageFormat_get_value_nullable'));

Pointer<Void> sdk_mapview_ImageFormat_toFfi_nullable(ImageFormat value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_ImageFormat_toFfi(value);
  final result = _sdk_mapview_ImageFormat_create_handle_nullable(_handle);
  sdk_mapview_ImageFormat_releaseFfiHandle(_handle);
  return result;
}

ImageFormat sdk_mapview_ImageFormat_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_ImageFormat_get_value_nullable(handle);
  final result = sdk_mapview_ImageFormat_fromFfi(_handle);
  sdk_mapview_ImageFormat_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_ImageFormat_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_ImageFormat_release_handle_nullable(handle);

// End of ImageFormat "private" section.

