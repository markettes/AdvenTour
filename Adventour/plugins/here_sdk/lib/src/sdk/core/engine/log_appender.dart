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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/log_level.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// An interface to implement a listener to receive log messages.
abstract class LogAppender {
  LogAppender() {}

  factory LogAppender.fromLambdas({
    @required void Function(LogLevel, String) lambda_log
  }) => LogAppender$Lambdas(
    lambda_log
  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}


  /// [level] The severity of the log message.
  /// [message] The log message.
  log(LogLevel level, String message);
}


// LogAppender "private" section, not exported.

final _sdk_core_engine_LogAppender_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogAppender_copy_handle'));
final _sdk_core_engine_LogAppender_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogAppender_release_handle'));
final _sdk_core_engine_LogAppender_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_core_engine_LogAppender_create_proxy'));
final _sdk_core_engine_LogAppender_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_core_engine_LogAppender_get_raw_pointer'));
final _sdk_core_engine_LogAppender_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogAppender_get_type_id'));


class LogAppender$Lambdas implements LogAppender {
  void Function(LogLevel, String) lambda_log;

  LogAppender$Lambdas(
    void Function(LogLevel, String) lambda_log
  ) {
    this.lambda_log = lambda_log;

  }

  @override
  void release() {}

  @override
  log(LogLevel level, String message) =>
    lambda_log(level, message);
}

class LogAppender$Impl implements LogAppender {
  @protected
  Pointer<Void> handle;
  LogAppender$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_core_engine_LogAppender_get_raw_pointer(handle));
    _sdk_core_engine_LogAppender_release_handle(handle);
    handle = null;
  }

  @override
  log(LogLevel level, String message) {
    final _log_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Pointer<Void>), void Function(Pointer<Void>, int, int, Pointer<Void>)>('here_sdk_sdk_core_engine_LogAppender_log__LogLevel_String'));
    final _level_handle = sdk_core_engine_LogLevel_toFfi(level);
    final _message_handle = String_toFfi(message);
    final _handle = this.handle;
    final __result_handle = _log_ffi(_handle, __lib.LibraryContext.isolateId, _level_handle, _message_handle);
    sdk_core_engine_LogLevel_releaseFfiHandle(_level_handle);
    String_releaseFfiHandle(_message_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


}

int _LogAppender_log_static(int _token, int level, Pointer<Void> message) {

  try {
    (__lib.instanceCache[_token] as LogAppender).log(sdk_core_engine_LogLevel_fromFfi(level), String_fromFfi(message));
  } finally {
    sdk_core_engine_LogLevel_releaseFfiHandle(level);
    String_releaseFfiHandle(message);
  }
  return 0;
}


Pointer<Void> sdk_core_engine_LogAppender_toFfi(LogAppender value) {
  if (value is LogAppender$Impl) return _sdk_core_engine_LogAppender_copy_handle(value.handle);

  final result = _sdk_core_engine_LogAppender_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Uint32, Pointer<Void>)>(_LogAppender_log_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_core_engine_LogAppender_get_raw_pointer(result)] = value;

  return result;
}

LogAppender sdk_core_engine_LogAppender_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_core_engine_LogAppender_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as LogAppender;
  if (instance != null) return instance;

  final _type_id_handle = _sdk_core_engine_LogAppender_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_core_engine_LogAppender_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : LogAppender$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_core_engine_LogAppender_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_core_engine_LogAppender_release_handle(handle);

Pointer<Void> sdk_core_engine_LogAppender_toFfi_nullable(LogAppender value) =>
  value != null ? sdk_core_engine_LogAppender_toFfi(value) : Pointer<Void>.fromAddress(0);

LogAppender sdk_core_engine_LogAppender_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_core_engine_LogAppender_fromFfi(handle) : null;

void sdk_core_engine_LogAppender_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_engine_LogAppender_release_handle(handle);

// End of LogAppender "private" section.

