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

enum AuthenticationError {
    /// Invalid parameter is received. SDK engine and callback must not be null
    invalidParameter,
    /// Authentication failed. Check your credentials.
    authenticationFailed,
    /// Network connection problems.
    noConnection
}

// AuthenticationError "private" section, not exported.

int sdk_core_AuthenticationError_toFfi(AuthenticationError value) {
  switch (value) {
  case AuthenticationError.invalidParameter:
    return 1;
  break;
  case AuthenticationError.authenticationFailed:
    return 2;
  break;
  case AuthenticationError.noConnection:
    return 3;
  break;
  default:
    throw StateError("Invalid enum value $value for AuthenticationError enum.");
  }
}

AuthenticationError sdk_core_AuthenticationError_fromFfi(int handle) {
  switch (handle) {
  case 1:
    return AuthenticationError.invalidParameter;
  break;
  case 2:
    return AuthenticationError.authenticationFailed;
  break;
  case 3:
    return AuthenticationError.noConnection;
  break;
  default:
    throw StateError("Invalid numeric value $handle for AuthenticationError enum.");
  }
}

void sdk_core_AuthenticationError_releaseFfiHandle(int handle) {}

final _sdk_core_AuthenticationError_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_AuthenticationError_create_handle_nullable'));
final _sdk_core_AuthenticationError_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationError_release_handle_nullable'));
final _sdk_core_AuthenticationError_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationError_get_value_nullable'));

Pointer<Void> sdk_core_AuthenticationError_toFfi_nullable(AuthenticationError value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_AuthenticationError_toFfi(value);
  final result = _sdk_core_AuthenticationError_create_handle_nullable(_handle);
  sdk_core_AuthenticationError_releaseFfiHandle(_handle);
  return result;
}

AuthenticationError sdk_core_AuthenticationError_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_AuthenticationError_get_value_nullable(handle);
  final result = sdk_core_AuthenticationError_fromFfi(_handle);
  sdk_core_AuthenticationError_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_AuthenticationError_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_AuthenticationError_release_handle_nullable(handle);

// End of AuthenticationError "private" section.

