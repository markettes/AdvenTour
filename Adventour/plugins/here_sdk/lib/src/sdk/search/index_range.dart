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

/// Holds information to which part of the text, input query was matched.
///
/// The first character is denoted by a value of 0.
abstract class IndexRange {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();



  /// Gets the position of the first character that matches a query.
  int get start;





  /// Gets the position indicating the end of the highlighted part, exclusive.
  int get end;



}


// IndexRange "private" section, not exported.

final _sdk_search_IndexRange_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_IndexRange_copy_handle'));
final _sdk_search_IndexRange_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_IndexRange_release_handle'));
final _sdk_search_IndexRange_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_search_IndexRange_get_raw_pointer'));

class IndexRange$Impl implements IndexRange {
  @protected
  Pointer<Void> handle;

  IndexRange$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_search_IndexRange_get_raw_pointer(handle));
    _sdk_search_IndexRange_release_handle(handle);
    handle = null;
  }

  @override
  int get start {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_search_IndexRange_start_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  int get end {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_search_IndexRange_end_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }



}

Pointer<Void> sdk_search_IndexRange_toFfi(IndexRange value) =>
  _sdk_search_IndexRange_copy_handle((value as IndexRange$Impl).handle);

IndexRange sdk_search_IndexRange_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_search_IndexRange_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as IndexRange;
  if (instance != null) return instance;

  final _copied_handle = _sdk_search_IndexRange_copy_handle(handle);
  final result = IndexRange$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_search_IndexRange_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_search_IndexRange_release_handle(handle);

Pointer<Void> sdk_search_IndexRange_toFfi_nullable(IndexRange value) =>
  value != null ? sdk_search_IndexRange_toFfi(value) : Pointer<Void>.fromAddress(0);

IndexRange sdk_search_IndexRange_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_search_IndexRange_fromFfi(handle) : null;

void sdk_search_IndexRange_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_IndexRange_release_handle(handle);

// End of IndexRange "private" section.

