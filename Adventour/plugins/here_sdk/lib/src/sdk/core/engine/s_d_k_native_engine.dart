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
import 'package:here_sdk/src/sdk/core/engine/log_appender.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_options.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Holds internal services and configurations needed by various HERE SDK modules.
///
/// It is created automatically during the SDK initialization process,
/// but it can also be created programmatically, for example, to set new
/// credentials for a specific module at runtime.
abstract class SDKNativeEngine {
  /// Makes a new instance of SDKNativeEngine using supplied options.
  /// [options] The options for the new engine.
  factory SDKNativeEngine(SDKOptions options) => SDKNativeEngine$Impl.make(options);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Overrides HERE SDK credentials with new values.
  ///
  /// The new credentials will be used for new requests.
  ///
  /// **Note:**
  /// This method can be called from any thread.
  /// [accessKeyId] New access key ID.
  /// [accessKeySecret] New access key secret.
  setAccessKey(String accessKeyId, String accessKeySecret);
  /// Set a custom log appender to receive log message from the SDK.
  ///
  /// This overwrites a previously set appender.
  /// [appender] New log appender.
  setLogAppender(LogAppender appender);


  /// Gets the options used by this instance of SDKNativeEngine.
  SDKOptions get options;





  /// Gets the shared instance of this SDK engine that can be accessed by any HERE SDK module as the default
  /// engine. This is automatically set as a part of the SDK initialization process.
  static SDKNativeEngine get sharedInstance => SDKNativeEngine$Impl.sharedInstance;


  /// Sets the shared instance of this SDK engine that can be accessed by any HERE SDK module as the default
  /// engine. This is automatically set as a part of the SDK initialization process.
  static set sharedInstance(SDKNativeEngine value) { SDKNativeEngine$Impl.sharedInstance = value; }


}


// SDKNativeEngine "private" section, not exported.

final _sdk_core_engine_SDKNativeEngine_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_copy_handle'));
final _sdk_core_engine_SDKNativeEngine_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_release_handle'));
final _sdk_core_engine_SDKNativeEngine_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_core_engine_SDKNativeEngine_get_raw_pointer'));




class SDKNativeEngine$Impl implements SDKNativeEngine {
  @protected
  Pointer<Void> handle;

  SDKNativeEngine$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_core_engine_SDKNativeEngine_get_raw_pointer(handle));
    _sdk_core_engine_SDKNativeEngine_release_handle(handle);
    handle = null;
  }


  SDKNativeEngine$Impl.make(SDKOptions options) : handle = _make(options) {
    __lib.reverseCache[_sdk_core_engine_SDKNativeEngine_get_raw_pointer(handle)] = this;
  }

  static Pointer<Void> _make(SDKOptions options) {
    final _make_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_make__SDKOptions'));
    final _options_handle = sdk_core_engine_SDKOptions_toFfi(options);
    final __result_handle = _make_ffi(__lib.LibraryContext.isolateId, _options_handle);
    sdk_core_engine_SDKOptions_releaseFfiHandle(_options_handle);
    return __result_handle;
  }

  @override
  setAccessKey(String accessKeyId, String accessKeySecret) {
    final _setAccessKey_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_setAccessKey__String_String'));
    final _accessKeyId_handle = String_toFfi(accessKeyId);
    final _accessKeySecret_handle = String_toFfi(accessKeySecret);
    final _handle = this.handle;
    final __result_handle = _setAccessKey_ffi(_handle, __lib.LibraryContext.isolateId, _accessKeyId_handle, _accessKeySecret_handle);
    String_releaseFfiHandle(_accessKeyId_handle);
    String_releaseFfiHandle(_accessKeySecret_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  setLogAppender(LogAppender appender) {
    final _setLogAppender_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_setLogAppender__LogAppender'));
    final _appender_handle = sdk_core_engine_LogAppender_toFfi(appender);
    final _handle = this.handle;
    final __result_handle = _setLogAppender_ffi(_handle, __lib.LibraryContext.isolateId, _appender_handle);
    sdk_core_engine_LogAppender_releaseFfiHandle(_appender_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  SDKOptions get options {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_core_engine_SDKNativeEngine_options_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_core_engine_SDKOptions_fromFfi(__result_handle);
    } finally {
      sdk_core_engine_SDKOptions_releaseFfiHandle(__result_handle);
    }
  }


  static SDKNativeEngine get sharedInstance {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_engine_SDKNativeEngine_sharedInstance_get'));
    final __result_handle = _get_ffi(__lib.LibraryContext.isolateId);
    try {
      return sdk_core_engine_SDKNativeEngine_fromFfi_nullable(__result_handle);
    } finally {
      sdk_core_engine_SDKNativeEngine_releaseFfiHandle_nullable(__result_handle);
    }
  }

  static set sharedInstance(SDKNativeEngine value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_sharedInstance_set__SDKNativeEngine'));
    final _value_handle = sdk_core_engine_SDKNativeEngine_toFfi_nullable(value);
    final __result_handle = _set_ffi(__lib.LibraryContext.isolateId, _value_handle);
    sdk_core_engine_SDKNativeEngine_releaseFfiHandle_nullable(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }



}

Pointer<Void> sdk_core_engine_SDKNativeEngine_toFfi(SDKNativeEngine value) =>
  _sdk_core_engine_SDKNativeEngine_copy_handle((value as SDKNativeEngine$Impl).handle);

SDKNativeEngine sdk_core_engine_SDKNativeEngine_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_core_engine_SDKNativeEngine_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as SDKNativeEngine;
  if (instance != null) return instance;

  final _copied_handle = _sdk_core_engine_SDKNativeEngine_copy_handle(handle);
  final result = SDKNativeEngine$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_core_engine_SDKNativeEngine_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_core_engine_SDKNativeEngine_release_handle(handle);

Pointer<Void> sdk_core_engine_SDKNativeEngine_toFfi_nullable(SDKNativeEngine value) =>
  value != null ? sdk_core_engine_SDKNativeEngine_toFfi(value) : Pointer<Void>.fromAddress(0);

SDKNativeEngine sdk_core_engine_SDKNativeEngine_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_core_engine_SDKNativeEngine_fromFfi(handle) : null;

void sdk_core_engine_SDKNativeEngine_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_engine_SDKNativeEngine_release_handle(handle);

// End of SDKNativeEngine "private" section.

