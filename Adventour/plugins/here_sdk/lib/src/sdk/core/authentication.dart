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
import 'package:here_sdk/src/sdk/core/authentication_callback.dart';
import 'package:here_sdk/src/sdk/core/authentication_data.dart';
import 'package:here_sdk/src/sdk/core/authentication_error.dart';
import 'package:here_sdk/src/sdk/core/authentication_exception_exception.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Use the authentication class to authenticate and retrieve a secure token that
/// can be used with other HERE services.
abstract class Authentication {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Uses the authentication service that is connected to the given SDK engine to authenticate and
  /// retrieve a secure token.
  ///
  /// This method operates asynchronously.
  /// [sdkNativeEngine] The SDK engine instance.
  /// [callback] Callback to retrieve an authentication token on the main thread.
  static authenticate(SDKNativeEngine sdkNativeEngine, AuthenticationCallback callback) => Authentication$Impl.authenticate(sdkNativeEngine, callback);
  /// Uses the authentication service that is connected to the given SDK engine to authenticate and
  /// retrieve a secure token.
  ///
  /// This method operates synchronously.
  /// [sdkNativeEngine] The SDK engine instance.
  /// Returns [AuthenticationData]. Authentication data.
  static AuthenticationData authenticateWithSDKNativeEngine(SDKNativeEngine sdkNativeEngine) => Authentication$Impl.authenticateWithSDKNativeEngine(sdkNativeEngine);
}


// Authentication "private" section, not exported.

final _sdk_core_Authentication_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Authentication_copy_handle'));
final _sdk_core_Authentication_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Authentication_release_handle'));
final _sdk_core_Authentication_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_core_Authentication_get_raw_pointer'));


final _authenticateWithSDKNativeEngine_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Authentication_authenticate__SDKNativeEngine_return_release_handle'));
final _authenticateWithSDKNativeEngine_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Authentication_authenticate__SDKNativeEngine_return_get_result'));
final _authenticateWithSDKNativeEngine_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_Authentication_authenticate__SDKNativeEngine_return_get_error'));
final _authenticateWithSDKNativeEngine_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_Authentication_authenticate__SDKNativeEngine_return_has_error'));


class Authentication$Impl implements Authentication {
  @protected
  Pointer<Void> handle;

  Authentication$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_core_Authentication_get_raw_pointer(handle));
    _sdk_core_Authentication_release_handle(handle);
    handle = null;
  }

  static authenticate(SDKNativeEngine sdkNativeEngine, AuthenticationCallback callback) {
    final _authenticate_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>, Pointer<Void>), void Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_Authentication_authenticate__SDKNativeEngine_AuthenticationCallback'));
    final _sdkNativeEngine_handle = sdk_core_engine_SDKNativeEngine_toFfi(sdkNativeEngine);
    final _callback_handle = sdk_core_AuthenticationCallback_toFfi(callback);
    final __result_handle = _authenticate_ffi(__lib.LibraryContext.isolateId, _sdkNativeEngine_handle, _callback_handle);
    sdk_core_engine_SDKNativeEngine_releaseFfiHandle(_sdkNativeEngine_handle);
    sdk_core_AuthenticationCallback_releaseFfiHandle(_callback_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  static AuthenticationData authenticateWithSDKNativeEngine(SDKNativeEngine sdkNativeEngine) {
    final _authenticateWithSDKNativeEngine_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_Authentication_authenticate__SDKNativeEngine'));
    final _sdkNativeEngine_handle = sdk_core_engine_SDKNativeEngine_toFfi(sdkNativeEngine);
    final __call_result_handle = _authenticateWithSDKNativeEngine_ffi(__lib.LibraryContext.isolateId, _sdkNativeEngine_handle);
    sdk_core_engine_SDKNativeEngine_releaseFfiHandle(_sdkNativeEngine_handle);
    if (_authenticateWithSDKNativeEngine_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _authenticateWithSDKNativeEngine_return_get_error(__call_result_handle);
        _authenticateWithSDKNativeEngine_return_release_handle(__call_result_handle);
        try {
          throw AuthenticationExceptionException(sdk_core_AuthenticationError_fromFfi(__error_handle));
        } finally {
          sdk_core_AuthenticationError_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _authenticateWithSDKNativeEngine_return_get_result(__call_result_handle);
    _authenticateWithSDKNativeEngine_return_release_handle(__call_result_handle);
    try {
      return sdk_core_AuthenticationData_fromFfi(__result_handle);
    } finally {
      sdk_core_AuthenticationData_releaseFfiHandle(__result_handle);
    }
  }


}

Pointer<Void> sdk_core_Authentication_toFfi(Authentication value) =>
  _sdk_core_Authentication_copy_handle((value as Authentication$Impl).handle);

Authentication sdk_core_Authentication_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_core_Authentication_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as Authentication;
  if (instance != null) return instance;

  final _copied_handle = _sdk_core_Authentication_copy_handle(handle);
  final result = Authentication$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_core_Authentication_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_core_Authentication_release_handle(handle);

Pointer<Void> sdk_core_Authentication_toFfi_nullable(Authentication value) =>
  value != null ? sdk_core_Authentication_toFfi(value) : Pointer<Void>.fromAddress(0);

Authentication sdk_core_Authentication_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_core_Authentication_fromFfi(handle) : null;

void sdk_core_Authentication_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_Authentication_release_handle(handle);

// End of Authentication "private" section.

