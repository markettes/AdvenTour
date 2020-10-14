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

import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:here_sdk/src/builtin_types__conversion.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

@immutable
class AuthenticationData {
  /// Secure token to be used with other HERE services. Note that the HERE SDK
  /// itself does not require the use of tokens.
  final String token;

  /// Expiration time in seconds as epoch time.
  final int expiryTimeInSeconds;


  const AuthenticationData(this.token, this.expiryTimeInSeconds);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! AuthenticationData) return false;
    AuthenticationData _other = other;
    return token == _other.token &&
        expiryTimeInSeconds == _other.expiryTimeInSeconds;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + token.hashCode;
    result = 31 * result + expiryTimeInSeconds.hashCode;
    return result;
  }
}


// AuthenticationData "private" section, not exported.

final _sdk_core_AuthenticationData_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint64),
    Pointer<Void> Function(Pointer<Void>, int)
  >('here_sdk_sdk_core_AuthenticationData_create_handle'));
final _sdk_core_AuthenticationData_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationData_release_handle'));
final _sdk_core_AuthenticationData_get_field_token = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationData_get_field_token'));
final _sdk_core_AuthenticationData_get_field_expiryTimeInSeconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationData_get_field_expiryTimeInSeconds'));

Pointer<Void> sdk_core_AuthenticationData_toFfi(AuthenticationData value) {
  final _token_handle = String_toFfi(value.token);
  final _expiryTimeInSeconds_handle = (value.expiryTimeInSeconds);
  final _result = _sdk_core_AuthenticationData_create_handle(_token_handle, _expiryTimeInSeconds_handle);
  String_releaseFfiHandle(_token_handle);
  (_expiryTimeInSeconds_handle);
  return _result;
}

AuthenticationData sdk_core_AuthenticationData_fromFfi(Pointer<Void> handle) {
  final _token_handle = _sdk_core_AuthenticationData_get_field_token(handle);
  final _expiryTimeInSeconds_handle = _sdk_core_AuthenticationData_get_field_expiryTimeInSeconds(handle);
  try {
    return AuthenticationData(
      String_fromFfi(_token_handle), 
    
      (_expiryTimeInSeconds_handle)
    );
  } finally {
    String_releaseFfiHandle(_token_handle);
    (_expiryTimeInSeconds_handle);
  }
}

void sdk_core_AuthenticationData_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_AuthenticationData_release_handle(handle);

// Nullable AuthenticationData

final _sdk_core_AuthenticationData_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationData_create_handle_nullable'));
final _sdk_core_AuthenticationData_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationData_release_handle_nullable'));
final _sdk_core_AuthenticationData_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationData_get_value_nullable'));

Pointer<Void> sdk_core_AuthenticationData_toFfi_nullable(AuthenticationData value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_AuthenticationData_toFfi(value);
  final result = _sdk_core_AuthenticationData_create_handle_nullable(_handle);
  sdk_core_AuthenticationData_releaseFfiHandle(_handle);
  return result;
}

AuthenticationData sdk_core_AuthenticationData_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_AuthenticationData_get_value_nullable(handle);
  final result = sdk_core_AuthenticationData_fromFfi(_handle);
  sdk_core_AuthenticationData_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_AuthenticationData_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_AuthenticationData_release_handle_nullable(handle);

// End of AuthenticationData "private" section.

