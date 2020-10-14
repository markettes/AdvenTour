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

/// Represents a point in 2D space.

class Point2D {
  /// Position along the X axis. The default value is 0.
  double x;

  /// Position along the Y axis. The default value is 0.
  double y;


  Point2D(this.x, this.y);

  Point2D.withDefaults()
    : x = 0.0, y = 0.0;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! Point2D) return false;
    Point2D _other = other;
    return x == _other.x &&
        y == _other.y;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + x.hashCode;
    result = 31 * result + y.hashCode;
    return result;
  }
}


// Point2D "private" section, not exported.

final _sdk_core_Point2D_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('here_sdk_sdk_core_Point2D_create_handle'));
final _sdk_core_Point2D_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point2D_release_handle'));
final _sdk_core_Point2D_get_field_x = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point2D_get_field_x'));
final _sdk_core_Point2D_get_field_y = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point2D_get_field_y'));

Pointer<Void> sdk_core_Point2D_toFfi(Point2D value) {
  final _x_handle = (value.x);
  final _y_handle = (value.y);
  final _result = _sdk_core_Point2D_create_handle(_x_handle, _y_handle);
  (_x_handle);
  (_y_handle);
  return _result;
}

Point2D sdk_core_Point2D_fromFfi(Pointer<Void> handle) {
  final _x_handle = _sdk_core_Point2D_get_field_x(handle);
  final _y_handle = _sdk_core_Point2D_get_field_y(handle);
  try {
    return Point2D(
      (_x_handle), 
    
      (_y_handle)
    );
  } finally {
    (_x_handle);
    (_y_handle);
  }
}

void sdk_core_Point2D_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_Point2D_release_handle(handle);

// Nullable Point2D

final _sdk_core_Point2D_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point2D_create_handle_nullable'));
final _sdk_core_Point2D_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point2D_release_handle_nullable'));
final _sdk_core_Point2D_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point2D_get_value_nullable'));

Pointer<Void> sdk_core_Point2D_toFfi_nullable(Point2D value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_Point2D_toFfi(value);
  final result = _sdk_core_Point2D_create_handle_nullable(_handle);
  sdk_core_Point2D_releaseFfiHandle(_handle);
  return result;
}

Point2D sdk_core_Point2D_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_Point2D_get_value_nullable(handle);
  final result = sdk_core_Point2D_fromFfi(_handle);
  sdk_core_Point2D_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_Point2D_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_Point2D_release_handle_nullable(handle);

// End of Point2D "private" section.

