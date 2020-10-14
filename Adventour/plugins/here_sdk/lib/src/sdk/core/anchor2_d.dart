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



/// Represents a point in a rectangle as a ratio of this rectangle's width and height.

class Anchor2D {
  /// Defines the x axis where the left is 0, the right is 1 and the middle is 0.5. The default value is 0.5.
  double horizontal;

  /// Defines the y axis where the top is 0, the bottom is 1 and the middle is 0.5. The default value is 0.5.
  double vertical;


  Anchor2D._(this.horizontal, this.vertical);
  Anchor2D._copy(Anchor2D _other) : this._(_other.horizontal, _other.vertical);

  /// Creates a new instance of an Anchor2D with the default parameters
  Anchor2D() : this._copy(_$init());

  /// Creates a new instance of an Anchor2D.
  /// [horizontal] Defines the x axis where the left is 0, the right is 1 and the middle is 0.5.
  /// [vertical] Defines the y axis where the top is 0, the bottom is 1 and the middle is 0.5.
  Anchor2D.withHorizontalAndVertical(double horizontal, double vertical) : this._copy(_withHorizontalAndVertical(horizontal, vertical));

  /// Creates a new instance of an Anchor2D with the default parameters
  static Anchor2D _$init() {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_Anchor2D_make'));
    final __result_handle = _$init_ffi(__lib.LibraryContext.isolateId);
    try {
      return sdk_core_Anchor2D_fromFfi(__result_handle);
    } finally {
      sdk_core_Anchor2D_releaseFfiHandle(__result_handle);
    }
  }

  /// Creates a new instance of an Anchor2D.
  /// [horizontal] Defines the x axis where the left is 0, the right is 1 and the middle is 0.5.
  /// [vertical] Defines the y axis where the top is 0, the bottom is 1 and the middle is 0.5.
  static Anchor2D _withHorizontalAndVertical(double horizontal, double vertical) {
    final _withHorizontalAndVertical_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('here_sdk_sdk_core_Anchor2D_make__Double_Double'));
    final _horizontal_handle = (horizontal);
    final _vertical_handle = (vertical);
    final __result_handle = _withHorizontalAndVertical_ffi(__lib.LibraryContext.isolateId, _horizontal_handle, _vertical_handle);
    (_horizontal_handle);
    (_vertical_handle);
    try {
      return sdk_core_Anchor2D_fromFfi(__result_handle);
    } finally {
      sdk_core_Anchor2D_releaseFfiHandle(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! Anchor2D) return false;
    Anchor2D _other = other;
    return horizontal == _other.horizontal &&
        vertical == _other.vertical;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + horizontal.hashCode;
    result = 31 * result + vertical.hashCode;
    return result;
  }
}


// Anchor2D "private" section, not exported.

final _sdk_core_Anchor2D_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('here_sdk_sdk_core_Anchor2D_create_handle'));
final _sdk_core_Anchor2D_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Anchor2D_release_handle'));
final _sdk_core_Anchor2D_get_field_horizontal = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Anchor2D_get_field_horizontal'));
final _sdk_core_Anchor2D_get_field_vertical = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Anchor2D_get_field_vertical'));

Pointer<Void> sdk_core_Anchor2D_toFfi(Anchor2D value) {
  final _horizontal_handle = (value.horizontal);
  final _vertical_handle = (value.vertical);
  final _result = _sdk_core_Anchor2D_create_handle(_horizontal_handle, _vertical_handle);
  (_horizontal_handle);
  (_vertical_handle);
  return _result;
}

Anchor2D sdk_core_Anchor2D_fromFfi(Pointer<Void> handle) {
  final _horizontal_handle = _sdk_core_Anchor2D_get_field_horizontal(handle);
  final _vertical_handle = _sdk_core_Anchor2D_get_field_vertical(handle);
  try {
    return Anchor2D._(
      (_horizontal_handle), 
    
      (_vertical_handle)
    );
  } finally {
    (_horizontal_handle);
    (_vertical_handle);
  }
}

void sdk_core_Anchor2D_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_Anchor2D_release_handle(handle);

// Nullable Anchor2D

final _sdk_core_Anchor2D_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Anchor2D_create_handle_nullable'));
final _sdk_core_Anchor2D_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Anchor2D_release_handle_nullable'));
final _sdk_core_Anchor2D_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Anchor2D_get_value_nullable'));

Pointer<Void> sdk_core_Anchor2D_toFfi_nullable(Anchor2D value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_Anchor2D_toFfi(value);
  final result = _sdk_core_Anchor2D_create_handle_nullable(_handle);
  sdk_core_Anchor2D_releaseFfiHandle(_handle);
  return result;
}

Anchor2D sdk_core_Anchor2D_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_Anchor2D_get_value_nullable(handle);
  final result = sdk_core_Anchor2D_fromFfi(_handle);
  sdk_core_Anchor2D_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_Anchor2D_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_Anchor2D_release_handle_nullable(handle);

// End of Anchor2D "private" section.

