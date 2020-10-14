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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/search/search_error.dart';
import 'package:here_sdk/src/sdk/search/suggestion.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// The method will be called on the main thread when a suggest call has been completed.
typedef SuggestCallback = void Function(SearchError, List<Suggestion>);

// SuggestCallback "private" section, not exported.

final _sdk_search_SuggestCallback_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestCallback_copy_handle'));
final _sdk_search_SuggestCallback_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestCallback_release_handle'));
final _sdk_search_SuggestCallback_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_search_SuggestCallback_create_proxy'));
final _sdk_search_SuggestCallback_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_search_SuggestCallback_get_raw_pointer'));

class SuggestCallback$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  SuggestCallback$Impl(this.handle);

  void release() => _sdk_search_SuggestCallback_release_handle(handle);

  call(SearchError p0, List<Suggestion> p1) {
    final _call_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SuggestCallback_call__SearchError_ListOf_1sdk_1search_1Suggestion'));
    final _p0_handle = sdk_search_SearchError_toFfi_nullable(p0);
    final _p1_handle = heresdk_search_bindings_ListOf_sdk_search_Suggestion_toFfi_nullable(p1);
    final _handle = this.handle;
    final __result_handle = _call_ffi(_handle, __lib.LibraryContext.isolateId, _p0_handle, _p1_handle);
    sdk_search_SearchError_releaseFfiHandle_nullable(_p0_handle);
    heresdk_search_bindings_ListOf_sdk_search_Suggestion_releaseFfiHandle_nullable(_p1_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

}

int _SuggestCallback_call_static(int _token, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (__lib.instanceCache[_token] as SuggestCallback)(sdk_search_SearchError_fromFfi_nullable(p0), heresdk_search_bindings_ListOf_sdk_search_Suggestion_fromFfi_nullable(p1));
  } finally {
    sdk_search_SearchError_releaseFfiHandle_nullable(p0);
    heresdk_search_bindings_ListOf_sdk_search_Suggestion_releaseFfiHandle_nullable(p1);
  }
  return 0;
}

Pointer<Void> sdk_search_SuggestCallback_toFfi(SuggestCallback value) {
  final result = _sdk_search_SuggestCallback_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Void>)>(_SuggestCallback_call_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_search_SuggestCallback_get_raw_pointer(result)] = value;

  return result;
}

SuggestCallback sdk_search_SuggestCallback_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_sdk_search_SuggestCallback_get_raw_pointer(handle)] as SuggestCallback;
  if (instance != null) return instance;
  final _impl = SuggestCallback$Impl(_sdk_search_SuggestCallback_copy_handle(handle));
  return (SearchError p0, List<Suggestion> p1) {
    final _result =_impl.call(p0, p1);
    _impl.release();
    return _result;
  };
}

void sdk_search_SuggestCallback_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_search_SuggestCallback_release_handle(handle);

// Nullable SuggestCallback

final _sdk_search_SuggestCallback_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestCallback_create_handle_nullable'));
final _sdk_search_SuggestCallback_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestCallback_release_handle_nullable'));
final _sdk_search_SuggestCallback_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestCallback_get_value_nullable'));

Pointer<Void> sdk_search_SuggestCallback_toFfi_nullable(SuggestCallback value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_SuggestCallback_toFfi(value);
  final result = _sdk_search_SuggestCallback_create_handle_nullable(_handle);
  sdk_search_SuggestCallback_releaseFfiHandle(_handle);
  return result;
}

SuggestCallback sdk_search_SuggestCallback_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_SuggestCallback_get_value_nullable(handle);
  final result = sdk_search_SuggestCallback_fromFfi(_handle);
  sdk_search_SuggestCallback_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_SuggestCallback_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_SuggestCallback_release_handle_nullable(handle);

// End of SuggestCallback "private" section.

