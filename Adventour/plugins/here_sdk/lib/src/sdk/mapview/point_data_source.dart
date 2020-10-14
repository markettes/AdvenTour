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

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// @nodoc
abstract class PointDataSource {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

}


// PointDataSource "private" section, not exported.

final _sdk_mapview_PointDataSource_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PointDataSource_copy_handle'));
final _sdk_mapview_PointDataSource_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PointDataSource_release_handle'));
final _sdk_mapview_PointDataSource_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_PointDataSource_get_raw_pointer'));

class PointDataSource$Impl implements PointDataSource {
  @protected
  Pointer<Void> handle;

  PointDataSource$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_PointDataSource_get_raw_pointer(handle));
    _sdk_mapview_PointDataSource_release_handle(handle);
    handle = null;
  }


}

Pointer<Void> sdk_mapview_PointDataSource_toFfi(PointDataSource value) =>
  _sdk_mapview_PointDataSource_copy_handle((value as PointDataSource$Impl).handle);

PointDataSource sdk_mapview_PointDataSource_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_PointDataSource_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as PointDataSource;
  if (instance != null) return instance;

  final _copied_handle = _sdk_mapview_PointDataSource_copy_handle(handle);
  final result = PointDataSource$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_PointDataSource_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_PointDataSource_release_handle(handle);

Pointer<Void> sdk_mapview_PointDataSource_toFfi_nullable(PointDataSource value) =>
  value != null ? sdk_mapview_PointDataSource_toFfi(value) : Pointer<Void>.fromAddress(0);

PointDataSource sdk_mapview_PointDataSource_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_PointDataSource_fromFfi(handle) : null;

void sdk_mapview_PointDataSource_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_PointDataSource_release_handle(handle);

// End of PointDataSource "private" section.

