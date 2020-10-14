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

/// Defines the allowed display locations for HERE logo watermark in the preferred order.
enum WatermarkPlacement {
    /// HERE logo watermark placed in the bottom-right corner of the map view which is the default.
    bottomRight,
    /// HERE logo watermark placed in the bottom-left corner of the map view.
    bottomLeft,
    /// HERE logo watermark placed in the bottom-center of the map view.
    bottomCenter
}

// WatermarkPlacement "private" section, not exported.

int sdk_mapview_WatermarkPlacement_toFfi(WatermarkPlacement value) {
  switch (value) {
  case WatermarkPlacement.bottomRight:
    return 0;
  break;
  case WatermarkPlacement.bottomLeft:
    return 1;
  break;
  case WatermarkPlacement.bottomCenter:
    return 2;
  break;
  default:
    throw StateError("Invalid enum value $value for WatermarkPlacement enum.");
  }
}

WatermarkPlacement sdk_mapview_WatermarkPlacement_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return WatermarkPlacement.bottomRight;
  break;
  case 1:
    return WatermarkPlacement.bottomLeft;
  break;
  case 2:
    return WatermarkPlacement.bottomCenter;
  break;
  default:
    throw StateError("Invalid numeric value $handle for WatermarkPlacement enum.");
  }
}

void sdk_mapview_WatermarkPlacement_releaseFfiHandle(int handle) {}

final _sdk_mapview_WatermarkPlacement_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_WatermarkPlacement_create_handle_nullable'));
final _sdk_mapview_WatermarkPlacement_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_WatermarkPlacement_release_handle_nullable'));
final _sdk_mapview_WatermarkPlacement_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_WatermarkPlacement_get_value_nullable'));

Pointer<Void> sdk_mapview_WatermarkPlacement_toFfi_nullable(WatermarkPlacement value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_WatermarkPlacement_toFfi(value);
  final result = _sdk_mapview_WatermarkPlacement_create_handle_nullable(_handle);
  sdk_mapview_WatermarkPlacement_releaseFfiHandle(_handle);
  return result;
}

WatermarkPlacement sdk_mapview_WatermarkPlacement_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_WatermarkPlacement_get_value_nullable(handle);
  final result = sdk_mapview_WatermarkPlacement_fromFfi(_handle);
  sdk_mapview_WatermarkPlacement_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_WatermarkPlacement_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_WatermarkPlacement_release_handle_nullable(handle);

// End of WatermarkPlacement "private" section.

