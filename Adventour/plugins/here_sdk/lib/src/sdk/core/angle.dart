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

import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents an angle independent of the unit of measurement.
abstract class Angle {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Creates a new angle object based on the supplied angle value in degrees.
  /// [angle] Angle value in degrees.
  /// Returns [Angle]. The angle as specified by input in degrees.
  static Angle fromDegrees(double angle) => Angle$Impl.fromDegrees(angle);
  /// Creates a new angle object based on the supplied angle value in radians.
  /// [angle] Angle value in radians.
  /// Returns [Angle]. The angle as specified by input in radians.
  static Angle fromRadians(double angle) => Angle$Impl.fromRadians(angle);


  /// Gets the value of this angle in degrees.
  double get degrees;





  /// Gets the value of this angle in radians.
  double get radians;



}


// Angle "private" section, not exported.

final _sdk_core_Angle_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Angle_copy_handle'));
final _sdk_core_Angle_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Angle_release_handle'));
final _sdk_core_Angle_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_core_Angle_get_raw_pointer'));



class Angle$Impl implements Angle {
  @protected
  Pointer<Void> handle;

  Angle$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_core_Angle_get_raw_pointer(handle));
    _sdk_core_Angle_release_handle(handle);
    handle = null;
  }

  static Angle fromDegrees(double angle) {
    final _fromDegrees_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double), Pointer<Void> Function(int, double)>('here_sdk_sdk_core_Angle_fromDegrees__Double'));
    final _angle_handle = (angle);
    final __result_handle = _fromDegrees_ffi(__lib.LibraryContext.isolateId, _angle_handle);
    (_angle_handle);
    try {
      return sdk_core_Angle_fromFfi(__result_handle);
    } finally {
      sdk_core_Angle_releaseFfiHandle(__result_handle);
    }
  }

  static Angle fromRadians(double angle) {
    final _fromRadians_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double), Pointer<Void> Function(int, double)>('here_sdk_sdk_core_Angle_fromRadians__Double'));
    final _angle_handle = (angle);
    final __result_handle = _fromRadians_ffi(__lib.LibraryContext.isolateId, _angle_handle);
    (_angle_handle);
    try {
      return sdk_core_Angle_fromFfi(__result_handle);
    } finally {
      sdk_core_Angle_releaseFfiHandle(__result_handle);
    }
  }

  @override
  double get degrees {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_core_Angle_degrees_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  double get radians {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_core_Angle_radians_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }



}

Pointer<Void> sdk_core_Angle_toFfi(Angle value) =>
  _sdk_core_Angle_copy_handle((value as Angle$Impl).handle);

Angle sdk_core_Angle_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_core_Angle_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as Angle;
  if (instance != null) return instance;

  final _copied_handle = _sdk_core_Angle_copy_handle(handle);
  final result = Angle$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_core_Angle_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_core_Angle_release_handle(handle);

Pointer<Void> sdk_core_Angle_toFfi_nullable(Angle value) =>
  value != null ? sdk_core_Angle_toFfi(value) : Pointer<Void>.fromAddress(0);

Angle sdk_core_Angle_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_core_Angle_fromFfi(handle) : null;

void sdk_core_Angle_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_Angle_release_handle(handle);

// End of Angle "private" section.

