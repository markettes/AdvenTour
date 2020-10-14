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








/// Represents angle ranges as a circular sector by using an absolute start angle
/// and a relative range angle called extent.
///
/// They both define a sector on a
/// circle. All angles are in degrees and are clockwise-oriented.
/// By default, the AngleRange represents the entire circle, the value is in the range of \[0, 360\].
/// Values will be corrected during construction using normalization
/// for the start angle and clamping for the extent angle, ensuring a valid range
/// for all possible inputs.
@immutable
class AngleRange {
  /// Start angle, running clockwise, in degrees from north.
  /// The value is in the range of \[0, 360) degrees.
  final double start;

  /// The angle range extent, running clockwise, in degrees from start.
  /// The value is in the range of \[0, 360\] degrees.
  final double extent;


  const AngleRange._(this.start, this.extent);
  AngleRange._copy(AngleRange _other) : this._(_other.start, _other.extent);

  /// Constructs an AngleRange from the provided start and extent angles.
  ///
  /// Corrects values if they exceed the ranges.
  /// [start] Start angle, running clockwise, in degrees from north.
  /// The value will be normalized to \[0.0, 360.0).
  /// [extent] The range's extent, running clockwise, in degrees from start.
  /// The value will be clamped to the range of \[0, 360\] degrees.
  AngleRange(double start, double extent) : this._copy(_$init(start, extent));

  /// Constructs a range covering a full circle.
  AngleRange.fullCircle() : this._copy(_fullCircle());

  /// Constructs an AngleRange from the provided start and extent angles.
  ///
  /// Corrects values if they exceed the ranges.
  /// [start] Start angle, running clockwise, in degrees from north.
  /// The value will be normalized to \[0.0, 360.0).
  /// [extent] The range's extent, running clockwise, in degrees from start.
  /// The value will be clamped to the range of \[0, 360\] degrees.
  static AngleRange _$init(double start, double extent) {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('here_sdk_sdk_core_AngleRange_fromDegreesClockwise__Double_Double'));
    final _start_handle = (start);
    final _extent_handle = (extent);
    final __result_handle = _$init_ffi(__lib.LibraryContext.isolateId, _start_handle, _extent_handle);
    (_start_handle);
    (_extent_handle);
    try {
      return sdk_core_AngleRange_fromFfi(__result_handle);
    } finally {
      sdk_core_AngleRange_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a range covering a full circle.
  static AngleRange _fullCircle() {
    final _fullCircle_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_AngleRange_fullCircle'));
    final __result_handle = _fullCircle_ffi(__lib.LibraryContext.isolateId);
    try {
      return sdk_core_AngleRange_fromFfi(__result_handle);
    } finally {
      sdk_core_AngleRange_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs an AngleRange from the provided minimum and maximum angles.
  ///
  /// Corrects values if they exceed the ranges. The angles are always
  /// interpreted in clockwise orientation.
  /// [min] Angle where to start the circular sector, running clockwise, in
  /// degrees from north.
  /// The value will be normalized to \[0.0, 360.0).
  /// [max] Angle where the circular sector ends, running clockwise, in
  /// degrees from north.
  /// The value will be normalized to \[0.0, 360.0).
  static AngleRange fromMinMaxDegreesClockwise(double min, double max) {
    final _fromMinMaxDegreesClockwise_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('here_sdk_sdk_core_AngleRange_fromMinMaxDegreesClockwise__Double_Double'));
    final _min_handle = (min);
    final _max_handle = (max);
    final __result_handle = _fromMinMaxDegreesClockwise_ffi(__lib.LibraryContext.isolateId, _min_handle, _max_handle);
    (_min_handle);
    (_max_handle);
    try {
      return sdk_core_AngleRange_fromFfi(__result_handle);
    } finally {
      sdk_core_AngleRange_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs an AngleRange from the provided center angle defining the
  /// direction and an angular width to extent the range by 50% clockwise and
  /// 50% counter-clockwise from its center angle.
  ///
  /// Corrects values if they exceed the ranges.
  /// Example: direction = 90, extent = 10 means the circle sector is pointing
  /// east, with an extent of 5 degrees north-wards and 5 degrees south-wards.
  /// [center] Start angle, running clockwise, in degrees from north.
  /// The value will be normalized to \[0.0, 360.0).
  /// [extent] The range's extent, running clockwise, in degrees from start.
  /// The value will be clamped to the range of \[0, 360\] degrees.
  static AngleRange fromDirectionDegreesClockwise(double center, double extent) {
    final _fromDirectionDegreesClockwise_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('here_sdk_sdk_core_AngleRange_fromDirectionDegreesClockwise__Double_Double'));
    final _center_handle = (center);
    final _extent_handle = (extent);
    final __result_handle = _fromDirectionDegreesClockwise_ffi(__lib.LibraryContext.isolateId, _center_handle, _extent_handle);
    (_center_handle);
    (_extent_handle);
    try {
      return sdk_core_AngleRange_fromFfi(__result_handle);
    } finally {
      sdk_core_AngleRange_releaseFfiHandle(__result_handle);
    }
  }

  /// Check if a given angle in degrees, clockwise from north is in range or not.
  /// [angleClockwiseInDegreesFromNorth] An angle in degrees from north. Will be normalized before testing.
  bool inRange(double angleClockwiseInDegreesFromNorth) {
    final _inRange_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Double), int Function(Pointer<Void>, int, double)>('here_sdk_sdk_core_AngleRange_inRange__Double'));
    final _angleClockwiseInDegreesFromNorth_handle = (angleClockwiseInDegreesFromNorth);
    final _handle = sdk_core_AngleRange_toFfi(this);
    final __result_handle = _inRange_ffi(_handle, __lib.LibraryContext.isolateId, _angleClockwiseInDegreesFromNorth_handle);
    sdk_core_AngleRange_releaseFfiHandle(_handle);
    (_angleClockwiseInDegreesFromNorth_handle);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }

  /// Get the angle that is closest to the given one and in range.
  ///
  /// If the
  /// angle to both ends of the range is the same, the value in the clockwise
  /// direction is returned. If the given angle is in range already,
  /// it will be returned as normalized angle.
  /// [angleClockwiseInDegreesFromNorth] An angle in degrees from north. Will be normalized.
  /// Returns [double]. The closest, normalized in-range angle in degrees, clockwise from north.
  ///
  /// If the given angle is in range already, the given angle will be returned as
  /// normalized angle in degree, clockwise from north.
  double closestInRange(double angleClockwiseInDegreesFromNorth) {
    final _closestInRange_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Double), double Function(Pointer<Void>, int, double)>('here_sdk_sdk_core_AngleRange_closestInRange__Double'));
    final _angleClockwiseInDegreesFromNorth_handle = (angleClockwiseInDegreesFromNorth);
    final _handle = sdk_core_AngleRange_toFfi(this);
    final __result_handle = _closestInRange_ffi(_handle, __lib.LibraryContext.isolateId, _angleClockwiseInDegreesFromNorth_handle);
    sdk_core_AngleRange_releaseFfiHandle(_handle);
    (_angleClockwiseInDegreesFromNorth_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  /// Get the maximum angle defined by the range in degrees, clockwise from north,
  /// normalized to \[0,360).
  /// Returns [double]. Maximum angle of the range in degrees, clockwise from north, normalized to
  /// \[0,360).
  double max() {
    final _max_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_core_AngleRange_max'));
    final _handle = sdk_core_AngleRange_toFfi(this);
    final __result_handle = _max_ffi(_handle, __lib.LibraryContext.isolateId);
    sdk_core_AngleRange_releaseFfiHandle(_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! AngleRange) return false;
    AngleRange _other = other;
    return start == _other.start &&
        extent == _other.extent;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + start.hashCode;
    result = 31 * result + extent.hashCode;
    return result;
  }
}


// AngleRange "private" section, not exported.

final _sdk_core_AngleRange_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('here_sdk_sdk_core_AngleRange_create_handle'));
final _sdk_core_AngleRange_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_AngleRange_release_handle'));
final _sdk_core_AngleRange_get_field_start = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_AngleRange_get_field_start'));
final _sdk_core_AngleRange_get_field_extent = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_AngleRange_get_field_extent'));

Pointer<Void> sdk_core_AngleRange_toFfi(AngleRange value) {
  final _start_handle = (value.start);
  final _extent_handle = (value.extent);
  final _result = _sdk_core_AngleRange_create_handle(_start_handle, _extent_handle);
  (_start_handle);
  (_extent_handle);
  return _result;
}

AngleRange sdk_core_AngleRange_fromFfi(Pointer<Void> handle) {
  final _start_handle = _sdk_core_AngleRange_get_field_start(handle);
  final _extent_handle = _sdk_core_AngleRange_get_field_extent(handle);
  try {
    return AngleRange._(
      (_start_handle), 
    
      (_extent_handle)
    );
  } finally {
    (_start_handle);
    (_extent_handle);
  }
}

void sdk_core_AngleRange_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_AngleRange_release_handle(handle);

// Nullable AngleRange

final _sdk_core_AngleRange_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_AngleRange_create_handle_nullable'));
final _sdk_core_AngleRange_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_AngleRange_release_handle_nullable'));
final _sdk_core_AngleRange_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_AngleRange_get_value_nullable'));

Pointer<Void> sdk_core_AngleRange_toFfi_nullable(AngleRange value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_AngleRange_toFfi(value);
  final result = _sdk_core_AngleRange_create_handle_nullable(_handle);
  sdk_core_AngleRange_releaseFfiHandle(_handle);
  return result;
}

AngleRange sdk_core_AngleRange_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_AngleRange_get_value_nullable(handle);
  final result = sdk_core_AngleRange_fromFfi(_handle);
  sdk_core_AngleRange_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_AngleRange_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_AngleRange_release_handle_nullable(handle);

// End of AngleRange "private" section.

