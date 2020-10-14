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

import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:here_sdk/src/builtin_types__conversion.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents the size of a 2D structure.

class Size2D {
  /// The width represents the size along the X axis. Default is 0.0.
  double width;

  /// The height represents the size along the Y axis. Default is 0.0.
  double height;


  Size2D(this.width, this.height);

  Size2D.withDefaults()
    : width = 0.0, height = 0.0;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! Size2D) return false;
    Size2D _other = other;
    return width == _other.width &&
        height == _other.height;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + width.hashCode;
    result = 31 * result + height.hashCode;
    return result;
  }
}


// Size2D "private" section, not exported.

final _sdk_core_Size2D_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('here_sdk_sdk_core_Size2D_create_handle'));
final _sdk_core_Size2D_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Size2D_release_handle'));
final _sdk_core_Size2D_get_field_width = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Size2D_get_field_width'));
final _sdk_core_Size2D_get_field_height = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Size2D_get_field_height'));

Pointer<Void> sdk_core_Size2D_toFfi(Size2D value) {
  final _width_handle = (value.width);
  final _height_handle = (value.height);
  final _result = _sdk_core_Size2D_create_handle(_width_handle, _height_handle);
  (_width_handle);
  (_height_handle);
  return _result;
}

Size2D sdk_core_Size2D_fromFfi(Pointer<Void> handle) {
  final _width_handle = _sdk_core_Size2D_get_field_width(handle);
  final _height_handle = _sdk_core_Size2D_get_field_height(handle);
  try {
    return Size2D(
      (_width_handle), 
    
      (_height_handle)
    );
  } finally {
    (_width_handle);
    (_height_handle);
  }
}

void sdk_core_Size2D_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_Size2D_release_handle(handle);

// Nullable Size2D

final _sdk_core_Size2D_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Size2D_create_handle_nullable'));
final _sdk_core_Size2D_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Size2D_release_handle_nullable'));
final _sdk_core_Size2D_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Size2D_get_value_nullable'));

Pointer<Void> sdk_core_Size2D_toFfi_nullable(Size2D value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_Size2D_toFfi(value);
  final result = _sdk_core_Size2D_create_handle_nullable(_handle);
  sdk_core_Size2D_releaseFfiHandle(_handle);
  return result;
}

Size2D sdk_core_Size2D_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_Size2D_get_value_nullable(handle);
  final result = sdk_core_Size2D_fromFfi(_handle);
  sdk_core_Size2D_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_Size2D_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_Size2D_release_handle_nullable(handle);

// End of Size2D "private" section.

