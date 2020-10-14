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

/// Instantiation error.
enum InstantiationErrorCode {
    /// Illegal arguments.
    illegalArguments,
    /// Instantiation attempt failed.
    failed,
    /// Instantiation attempt failed because the shared SDK engine is not instantiated.
    /// Please initialise the SDK.
    sharedSdkEngineNotInstantiated
}

// InstantiationErrorCode "private" section, not exported.

int sdk_core_errors_InstantiationErrorCode_toFfi(InstantiationErrorCode value) {
  switch (value) {
  case InstantiationErrorCode.illegalArguments:
    return 1;
  break;
  case InstantiationErrorCode.failed:
    return 2;
  break;
  case InstantiationErrorCode.sharedSdkEngineNotInstantiated:
    return 3;
  break;
  default:
    throw StateError("Invalid enum value $value for InstantiationErrorCode enum.");
  }
}

InstantiationErrorCode sdk_core_errors_InstantiationErrorCode_fromFfi(int handle) {
  switch (handle) {
  case 1:
    return InstantiationErrorCode.illegalArguments;
  break;
  case 2:
    return InstantiationErrorCode.failed;
  break;
  case 3:
    return InstantiationErrorCode.sharedSdkEngineNotInstantiated;
  break;
  default:
    throw StateError("Invalid numeric value $handle for InstantiationErrorCode enum.");
  }
}

void sdk_core_errors_InstantiationErrorCode_releaseFfiHandle(int handle) {}

final _sdk_core_errors_InstantiationErrorCode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_errors_InstantiationErrorCode_create_handle_nullable'));
final _sdk_core_errors_InstantiationErrorCode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_errors_InstantiationErrorCode_release_handle_nullable'));
final _sdk_core_errors_InstantiationErrorCode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_errors_InstantiationErrorCode_get_value_nullable'));

Pointer<Void> sdk_core_errors_InstantiationErrorCode_toFfi_nullable(InstantiationErrorCode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_errors_InstantiationErrorCode_toFfi(value);
  final result = _sdk_core_errors_InstantiationErrorCode_create_handle_nullable(_handle);
  sdk_core_errors_InstantiationErrorCode_releaseFfiHandle(_handle);
  return result;
}

InstantiationErrorCode sdk_core_errors_InstantiationErrorCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_errors_InstantiationErrorCode_get_value_nullable(handle);
  final result = sdk_core_errors_InstantiationErrorCode_fromFfi(_handle);
  sdk_core_errors_InstantiationErrorCode_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_errors_InstantiationErrorCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_errors_InstantiationErrorCode_release_handle_nullable(handle);

// End of InstantiationErrorCode "private" section.

