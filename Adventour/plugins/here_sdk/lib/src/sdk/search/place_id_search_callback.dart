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
import 'package:here_sdk/src/sdk/search/place.dart';
import 'package:here_sdk/src/sdk/search/search_error.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// The method will be called on the main thread when a search by id call has been completed.
typedef PlaceIdSearchCallback = void Function(SearchError, Place);

// PlaceIdSearchCallback "private" section, not exported.

final _sdk_search_PlaceIdSearchCallback_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdSearchCallback_copy_handle'));
final _sdk_search_PlaceIdSearchCallback_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdSearchCallback_release_handle'));
final _sdk_search_PlaceIdSearchCallback_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_search_PlaceIdSearchCallback_create_proxy'));
final _sdk_search_PlaceIdSearchCallback_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_search_PlaceIdSearchCallback_get_raw_pointer'));

class PlaceIdSearchCallback$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  PlaceIdSearchCallback$Impl(this.handle);

  void release() => _sdk_search_PlaceIdSearchCallback_release_handle(handle);

  call(SearchError p0, Place p1) {
    final _call_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_PlaceIdSearchCallback_call__SearchError_Place'));
    final _p0_handle = sdk_search_SearchError_toFfi_nullable(p0);
    final _p1_handle = sdk_search_Place_toFfi_nullable(p1);
    final _handle = this.handle;
    final __result_handle = _call_ffi(_handle, __lib.LibraryContext.isolateId, _p0_handle, _p1_handle);
    sdk_search_SearchError_releaseFfiHandle_nullable(_p0_handle);
    sdk_search_Place_releaseFfiHandle_nullable(_p1_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

}

int _PlaceIdSearchCallback_call_static(int _token, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (__lib.instanceCache[_token] as PlaceIdSearchCallback)(sdk_search_SearchError_fromFfi_nullable(p0), sdk_search_Place_fromFfi_nullable(p1));
  } finally {
    sdk_search_SearchError_releaseFfiHandle_nullable(p0);
    sdk_search_Place_releaseFfiHandle_nullable(p1);
  }
  return 0;
}

Pointer<Void> sdk_search_PlaceIdSearchCallback_toFfi(PlaceIdSearchCallback value) {
  final result = _sdk_search_PlaceIdSearchCallback_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Void>)>(_PlaceIdSearchCallback_call_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_search_PlaceIdSearchCallback_get_raw_pointer(result)] = value;

  return result;
}

PlaceIdSearchCallback sdk_search_PlaceIdSearchCallback_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_sdk_search_PlaceIdSearchCallback_get_raw_pointer(handle)] as PlaceIdSearchCallback;
  if (instance != null) return instance;
  final _impl = PlaceIdSearchCallback$Impl(_sdk_search_PlaceIdSearchCallback_copy_handle(handle));
  return (SearchError p0, Place p1) {
    final _result =_impl.call(p0, p1);
    _impl.release();
    return _result;
  };
}

void sdk_search_PlaceIdSearchCallback_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_search_PlaceIdSearchCallback_release_handle(handle);

// Nullable PlaceIdSearchCallback

final _sdk_search_PlaceIdSearchCallback_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdSearchCallback_create_handle_nullable'));
final _sdk_search_PlaceIdSearchCallback_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdSearchCallback_release_handle_nullable'));
final _sdk_search_PlaceIdSearchCallback_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdSearchCallback_get_value_nullable'));

Pointer<Void> sdk_search_PlaceIdSearchCallback_toFfi_nullable(PlaceIdSearchCallback value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_PlaceIdSearchCallback_toFfi(value);
  final result = _sdk_search_PlaceIdSearchCallback_create_handle_nullable(_handle);
  sdk_search_PlaceIdSearchCallback_releaseFfiHandle(_handle);
  return result;
}

PlaceIdSearchCallback sdk_search_PlaceIdSearchCallback_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_PlaceIdSearchCallback_get_value_nullable(handle);
  final result = sdk_search_PlaceIdSearchCallback_fromFfi(_handle);
  sdk_search_PlaceIdSearchCallback_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_PlaceIdSearchCallback_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_PlaceIdSearchCallback_release_handle_nullable(handle);

// End of PlaceIdSearchCallback "private" section.

