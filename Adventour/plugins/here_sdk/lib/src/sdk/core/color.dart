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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'color_converter.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;


class Color_internal {
  double r;

  double g;

  double b;

  double a;


  Color_internal(this.r, this.g, this.b, this.a);

}


// Color "private" section, not exported.

final _sdk_core_Color_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Float, Float, Float, Float),
    Pointer<Void> Function(double, double, double, double)
  >('here_sdk_sdk_core_Color_create_handle'));
final _sdk_core_Color_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Color_release_handle'));
final _sdk_core_Color_get_field_r = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Color_get_field_r'));
final _sdk_core_Color_get_field_g = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Color_get_field_g'));
final _sdk_core_Color_get_field_b = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Color_get_field_b'));
final _sdk_core_Color_get_field_a = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Color_get_field_a'));

Pointer<Void> sdk_core_Color_toFfi(ui.Color value_ext) {
  final value = ColorConverter.convertToInternal(value_ext);
  final _r_handle = (value.r);
  final _g_handle = (value.g);
  final _b_handle = (value.b);
  final _a_handle = (value.a);
  final _result = _sdk_core_Color_create_handle(_r_handle, _g_handle, _b_handle, _a_handle);
  (_r_handle);
  (_g_handle);
  (_b_handle);
  (_a_handle);
  return _result;
}

ui.Color sdk_core_Color_fromFfi(Pointer<Void> handle) {
  final _r_handle = _sdk_core_Color_get_field_r(handle);
  final _g_handle = _sdk_core_Color_get_field_g(handle);
  final _b_handle = _sdk_core_Color_get_field_b(handle);
  final _a_handle = _sdk_core_Color_get_field_a(handle);
  try {
    final result_internal = Color_internal(
      (_r_handle), 
      (_g_handle), 
      (_b_handle), 
      (_a_handle)
    );
    return ColorConverter.convertFromInternal(result_internal);
  } finally {
    (_r_handle);
    (_g_handle);
    (_b_handle);
    (_a_handle);
  }
}

void sdk_core_Color_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_Color_release_handle(handle);

// Nullable Color

final _sdk_core_Color_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Color_create_handle_nullable'));
final _sdk_core_Color_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Color_release_handle_nullable'));
final _sdk_core_Color_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Color_get_value_nullable'));

Pointer<Void> sdk_core_Color_toFfi_nullable(ui.Color value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_Color_toFfi(value);
  final result = _sdk_core_Color_create_handle_nullable(_handle);
  sdk_core_Color_releaseFfiHandle(_handle);
  return result;
}

ui.Color sdk_core_Color_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_Color_get_value_nullable(handle);
  final result = sdk_core_Color_fromFfi(_handle);
  sdk_core_Color_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_Color_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_Color_release_handle_nullable(handle);

// End of Color "private" section.

