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

/// Determines the cap (line ending) style.
enum LineCap {
    /// Line caps are rounded. This is the default value.
    round,
    /// Line caps are square.
    square,
    /// The line ends immediately and has no cap.
    butt
}

// LineCap "private" section, not exported.

int sdk_mapview_LineCap_toFfi(LineCap value) {
  switch (value) {
  case LineCap.round:
    return 0;
  break;
  case LineCap.square:
    return 1;
  break;
  case LineCap.butt:
    return 2;
  break;
  default:
    throw StateError("Invalid enum value $value for LineCap enum.");
  }
}

LineCap sdk_mapview_LineCap_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return LineCap.round;
  break;
  case 1:
    return LineCap.square;
  break;
  case 2:
    return LineCap.butt;
  break;
  default:
    throw StateError("Invalid numeric value $handle for LineCap enum.");
  }
}

void sdk_mapview_LineCap_releaseFfiHandle(int handle) {}

final _sdk_mapview_LineCap_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_LineCap_create_handle_nullable'));
final _sdk_mapview_LineCap_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LineCap_release_handle_nullable'));
final _sdk_mapview_LineCap_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LineCap_get_value_nullable'));

Pointer<Void> sdk_mapview_LineCap_toFfi_nullable(LineCap value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_LineCap_toFfi(value);
  final result = _sdk_mapview_LineCap_create_handle_nullable(_handle);
  sdk_mapview_LineCap_releaseFfiHandle(_handle);
  return result;
}

LineCap sdk_mapview_LineCap_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_LineCap_get_value_nullable(handle);
  final result = sdk_mapview_LineCap_fromFfi(_handle);
  sdk_mapview_LineCap_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_LineCap_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_LineCap_release_handle_nullable(handle);

// End of LineCap "private" section.

