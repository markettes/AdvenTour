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


import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Severity levels for log messages.
enum LogLevel {
    /// The severity value for tracing messages.
    logLevelTrace,
    /// The severity value for debugging messages.
    logLevelDebug,
    /// The severity value for informational messages.
    logLevelInfo,
    /// The severity value for warning messages.
    logLevelWarning,
    /// The severity value for error messages.
    logLevelError,
    /// The severity value for fatal messages.
    logLevelFatal,
    /// A special value to turn off logging.
    logLevelOff
}

// LogLevel "private" section, not exported.

int sdk_core_engine_LogLevel_toFfi(LogLevel value) {
  switch (value) {
  case LogLevel.logLevelTrace:
    return 0;
  break;
  case LogLevel.logLevelDebug:
    return 1;
  break;
  case LogLevel.logLevelInfo:
    return 2;
  break;
  case LogLevel.logLevelWarning:
    return 3;
  break;
  case LogLevel.logLevelError:
    return 4;
  break;
  case LogLevel.logLevelFatal:
    return 5;
  break;
  case LogLevel.logLevelOff:
    return 6;
  break;
  default:
    throw StateError("Invalid enum value $value for LogLevel enum.");
  }
}

LogLevel sdk_core_engine_LogLevel_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return LogLevel.logLevelTrace;
  break;
  case 1:
    return LogLevel.logLevelDebug;
  break;
  case 2:
    return LogLevel.logLevelInfo;
  break;
  case 3:
    return LogLevel.logLevelWarning;
  break;
  case 4:
    return LogLevel.logLevelError;
  break;
  case 5:
    return LogLevel.logLevelFatal;
  break;
  case 6:
    return LogLevel.logLevelOff;
  break;
  default:
    throw StateError("Invalid numeric value $handle for LogLevel enum.");
  }
}

void sdk_core_engine_LogLevel_releaseFfiHandle(int handle) {}

final _sdk_core_engine_LogLevel_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_engine_LogLevel_create_handle_nullable'));
final _sdk_core_engine_LogLevel_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogLevel_release_handle_nullable'));
final _sdk_core_engine_LogLevel_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogLevel_get_value_nullable'));

Pointer<Void> sdk_core_engine_LogLevel_toFfi_nullable(LogLevel value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_engine_LogLevel_toFfi(value);
  final result = _sdk_core_engine_LogLevel_create_handle_nullable(_handle);
  sdk_core_engine_LogLevel_releaseFfiHandle(_handle);
  return result;
}

LogLevel sdk_core_engine_LogLevel_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_engine_LogLevel_get_value_nullable(handle);
  final result = sdk_core_engine_LogLevel_fromFfi(_handle);
  sdk_core_engine_LogLevel_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_engine_LogLevel_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_engine_LogLevel_release_handle_nullable(handle);

// End of LogLevel "private" section.

