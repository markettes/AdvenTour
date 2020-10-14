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
abstract class LineDataSource {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

}


// LineDataSource "private" section, not exported.

final _sdk_mapview_LineDataSource_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LineDataSource_copy_handle'));
final _sdk_mapview_LineDataSource_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LineDataSource_release_handle'));
final _sdk_mapview_LineDataSource_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_LineDataSource_get_raw_pointer'));

class LineDataSource$Impl implements LineDataSource {
  @protected
  Pointer<Void> handle;

  LineDataSource$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_LineDataSource_get_raw_pointer(handle));
    _sdk_mapview_LineDataSource_release_handle(handle);
    handle = null;
  }


}

Pointer<Void> sdk_mapview_LineDataSource_toFfi(LineDataSource value) =>
  _sdk_mapview_LineDataSource_copy_handle((value as LineDataSource$Impl).handle);

LineDataSource sdk_mapview_LineDataSource_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_LineDataSource_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as LineDataSource;
  if (instance != null) return instance;

  final _copied_handle = _sdk_mapview_LineDataSource_copy_handle(handle);
  final result = LineDataSource$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_LineDataSource_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_LineDataSource_release_handle(handle);

Pointer<Void> sdk_mapview_LineDataSource_toFfi_nullable(LineDataSource value) =>
  value != null ? sdk_mapview_LineDataSource_toFfi(value) : Pointer<Void>.fromAddress(0);

LineDataSource sdk_mapview_LineDataSource_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_LineDataSource_fromFfi(handle) : null;

void sdk_mapview_LineDataSource_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_LineDataSource_release_handle(handle);

// End of LineDataSource "private" section.

