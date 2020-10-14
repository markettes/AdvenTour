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
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:here_sdk/src/sdk/core/size2_d.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents a 2D rectangle defined by the origin and size.

class Rectangle2D {
  /// The origin specifies the point from which the rectangle extends by values specified by size.
  Point2D origin;

  /// The size specifies the width and height of the rectangle.
  Size2D size;


  Rectangle2D(this.origin, this.size);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! Rectangle2D) return false;
    Rectangle2D _other = other;
    return origin == _other.origin &&
        size == _other.size;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + origin.hashCode;
    result = 31 * result + size.hashCode;
    return result;
  }
}


// Rectangle2D "private" section, not exported.

final _sdk_core_Rectangle2D_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_Rectangle2D_create_handle'));
final _sdk_core_Rectangle2D_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Rectangle2D_release_handle'));
final _sdk_core_Rectangle2D_get_field_origin = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Rectangle2D_get_field_origin'));
final _sdk_core_Rectangle2D_get_field_size = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Rectangle2D_get_field_size'));

Pointer<Void> sdk_core_Rectangle2D_toFfi(Rectangle2D value) {
  final _origin_handle = sdk_core_Point2D_toFfi(value.origin);
  final _size_handle = sdk_core_Size2D_toFfi(value.size);
  final _result = _sdk_core_Rectangle2D_create_handle(_origin_handle, _size_handle);
  sdk_core_Point2D_releaseFfiHandle(_origin_handle);
  sdk_core_Size2D_releaseFfiHandle(_size_handle);
  return _result;
}

Rectangle2D sdk_core_Rectangle2D_fromFfi(Pointer<Void> handle) {
  final _origin_handle = _sdk_core_Rectangle2D_get_field_origin(handle);
  final _size_handle = _sdk_core_Rectangle2D_get_field_size(handle);
  try {
    return Rectangle2D(
      sdk_core_Point2D_fromFfi(_origin_handle), 
    
      sdk_core_Size2D_fromFfi(_size_handle)
    );
  } finally {
    sdk_core_Point2D_releaseFfiHandle(_origin_handle);
    sdk_core_Size2D_releaseFfiHandle(_size_handle);
  }
}

void sdk_core_Rectangle2D_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_Rectangle2D_release_handle(handle);

// Nullable Rectangle2D

final _sdk_core_Rectangle2D_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Rectangle2D_create_handle_nullable'));
final _sdk_core_Rectangle2D_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Rectangle2D_release_handle_nullable'));
final _sdk_core_Rectangle2D_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Rectangle2D_get_value_nullable'));

Pointer<Void> sdk_core_Rectangle2D_toFfi_nullable(Rectangle2D value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_Rectangle2D_toFfi(value);
  final result = _sdk_core_Rectangle2D_create_handle_nullable(_handle);
  sdk_core_Rectangle2D_releaseFfiHandle(_handle);
  return result;
}

Rectangle2D sdk_core_Rectangle2D_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_Rectangle2D_get_value_nullable(handle);
  final result = sdk_core_Rectangle2D_fromFfi(_handle);
  sdk_core_Rectangle2D_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_Rectangle2D_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_Rectangle2D_release_handle_nullable(handle);

// End of Rectangle2D "private" section.

