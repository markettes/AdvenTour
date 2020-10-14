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
import 'package:here_sdk/src/sdk/core/authentication_data.dart';
import 'package:here_sdk/src/sdk/core/authentication_error.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Callback passed to [authenticateWithSDKNativeEngine].
///
/// This callback is called on the main thread asynchronously when an
/// authenticate call has completed.
/// The first argument is the operation status. It is 'null' for an operation that succeeds.
/// The second argument is the authentication data.
typedef AuthenticationCallback = void Function(AuthenticationError, AuthenticationData);

// AuthenticationCallback "private" section, not exported.

final _sdk_core_AuthenticationCallback_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationCallback_copy_handle'));
final _sdk_core_AuthenticationCallback_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationCallback_release_handle'));
final _sdk_core_AuthenticationCallback_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_core_AuthenticationCallback_create_proxy'));
final _sdk_core_AuthenticationCallback_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_core_AuthenticationCallback_get_raw_pointer'));

class AuthenticationCallback$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  AuthenticationCallback$Impl(this.handle);

  void release() => _sdk_core_AuthenticationCallback_release_handle(handle);

  call(AuthenticationError p0, AuthenticationData p1) {
    final _call_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_AuthenticationCallback_call__AuthenticationError_AuthenticationData'));
    final _p0_handle = sdk_core_AuthenticationError_toFfi_nullable(p0);
    final _p1_handle = sdk_core_AuthenticationData_toFfi_nullable(p1);
    final _handle = this.handle;
    final __result_handle = _call_ffi(_handle, __lib.LibraryContext.isolateId, _p0_handle, _p1_handle);
    sdk_core_AuthenticationError_releaseFfiHandle_nullable(_p0_handle);
    sdk_core_AuthenticationData_releaseFfiHandle_nullable(_p1_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

}

int _AuthenticationCallback_call_static(int _token, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (__lib.instanceCache[_token] as AuthenticationCallback)(sdk_core_AuthenticationError_fromFfi_nullable(p0), sdk_core_AuthenticationData_fromFfi_nullable(p1));
  } finally {
    sdk_core_AuthenticationError_releaseFfiHandle_nullable(p0);
    sdk_core_AuthenticationData_releaseFfiHandle_nullable(p1);
  }
  return 0;
}

Pointer<Void> sdk_core_AuthenticationCallback_toFfi(AuthenticationCallback value) {
  final result = _sdk_core_AuthenticationCallback_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Void>)>(_AuthenticationCallback_call_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_core_AuthenticationCallback_get_raw_pointer(result)] = value;

  return result;
}

AuthenticationCallback sdk_core_AuthenticationCallback_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_sdk_core_AuthenticationCallback_get_raw_pointer(handle)] as AuthenticationCallback;
  if (instance != null) return instance;
  final _impl = AuthenticationCallback$Impl(_sdk_core_AuthenticationCallback_copy_handle(handle));
  return (AuthenticationError p0, AuthenticationData p1) {
    final _result =_impl.call(p0, p1);
    _impl.release();
    return _result;
  };
}

void sdk_core_AuthenticationCallback_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_core_AuthenticationCallback_release_handle(handle);

// Nullable AuthenticationCallback

final _sdk_core_AuthenticationCallback_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationCallback_create_handle_nullable'));
final _sdk_core_AuthenticationCallback_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationCallback_release_handle_nullable'));
final _sdk_core_AuthenticationCallback_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationCallback_get_value_nullable'));

Pointer<Void> sdk_core_AuthenticationCallback_toFfi_nullable(AuthenticationCallback value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_AuthenticationCallback_toFfi(value);
  final result = _sdk_core_AuthenticationCallback_create_handle_nullable(_handle);
  sdk_core_AuthenticationCallback_releaseFfiHandle(_handle);
  return result;
}

AuthenticationCallback sdk_core_AuthenticationCallback_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_AuthenticationCallback_get_value_nullable(handle);
  final result = sdk_core_AuthenticationCallback_fromFfi(_handle);
  sdk_core_AuthenticationCallback_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_AuthenticationCallback_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_AuthenticationCallback_release_handle_nullable(handle);

// End of AuthenticationCallback "private" section.

