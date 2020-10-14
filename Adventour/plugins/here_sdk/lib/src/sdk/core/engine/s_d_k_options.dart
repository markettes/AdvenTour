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
import 'package:here_sdk/src/sdk/core/engine/authentication_preferences.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Configuration of the SDK.
///
/// SDKOptions provide an alternative way to set or update the HERE SDK credentials at runtime to
/// initialize the [SDKNativeEngine].

class SDKOptions {
  /// Key used for oAuth authentication.
  String accessKeyId;

  /// Secret used for oAuth authentication.
  String accessKeySecret;

  /// Path to be used for caching purposes. If it is not set,
  ///
  /// is set by default.
  String cachePath;

  /// Sets authentication preferences for advantage usage.
  AuthenticationPreferences authenticationPreferences;


  SDKOptions(this.accessKeyId, this.accessKeySecret, this.cachePath, this.authenticationPreferences);

  SDKOptions.withDefaults(String accessKeyId, String accessKeySecret, String cachePath)
    : accessKeyId = accessKeyId, accessKeySecret = accessKeySecret, cachePath = cachePath, authenticationPreferences = AuthenticationPreferences.useServerTime;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! SDKOptions) return false;
    SDKOptions _other = other;
    return accessKeyId == _other.accessKeyId &&
        accessKeySecret == _other.accessKeySecret &&
        cachePath == _other.cachePath &&
        authenticationPreferences == _other.authenticationPreferences;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + accessKeyId.hashCode;
    result = 31 * result + accessKeySecret.hashCode;
    result = 31 * result + cachePath.hashCode;
    result = 31 * result + authenticationPreferences.hashCode;
    return result;
  }
}


// SDKOptions "private" section, not exported.

final _sdk_core_engine_SDKOptions_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint32),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_core_engine_SDKOptions_create_handle'));
final _sdk_core_engine_SDKOptions_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_release_handle'));
final _sdk_core_engine_SDKOptions_get_field_accessKeyId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_accessKeyId'));
final _sdk_core_engine_SDKOptions_get_field_accessKeySecret = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_accessKeySecret'));
final _sdk_core_engine_SDKOptions_get_field_cachePath = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_cachePath'));
final _sdk_core_engine_SDKOptions_get_field_authenticationPreferences = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_authenticationPreferences'));

Pointer<Void> sdk_core_engine_SDKOptions_toFfi(SDKOptions value) {
  final _accessKeyId_handle = String_toFfi(value.accessKeyId);
  final _accessKeySecret_handle = String_toFfi(value.accessKeySecret);
  final _cachePath_handle = String_toFfi(value.cachePath);
  final _authenticationPreferences_handle = sdk_core_engine_AuthenticationPreferences_toFfi(value.authenticationPreferences);
  final _result = _sdk_core_engine_SDKOptions_create_handle(_accessKeyId_handle, _accessKeySecret_handle, _cachePath_handle, _authenticationPreferences_handle);
  String_releaseFfiHandle(_accessKeyId_handle);
  String_releaseFfiHandle(_accessKeySecret_handle);
  String_releaseFfiHandle(_cachePath_handle);
  sdk_core_engine_AuthenticationPreferences_releaseFfiHandle(_authenticationPreferences_handle);
  return _result;
}

SDKOptions sdk_core_engine_SDKOptions_fromFfi(Pointer<Void> handle) {
  final _accessKeyId_handle = _sdk_core_engine_SDKOptions_get_field_accessKeyId(handle);
  final _accessKeySecret_handle = _sdk_core_engine_SDKOptions_get_field_accessKeySecret(handle);
  final _cachePath_handle = _sdk_core_engine_SDKOptions_get_field_cachePath(handle);
  final _authenticationPreferences_handle = _sdk_core_engine_SDKOptions_get_field_authenticationPreferences(handle);
  try {
    return SDKOptions(
      String_fromFfi(_accessKeyId_handle), 
    
      String_fromFfi(_accessKeySecret_handle), 
    
      String_fromFfi(_cachePath_handle), 
    
      sdk_core_engine_AuthenticationPreferences_fromFfi(_authenticationPreferences_handle)
    );
  } finally {
    String_releaseFfiHandle(_accessKeyId_handle);
    String_releaseFfiHandle(_accessKeySecret_handle);
    String_releaseFfiHandle(_cachePath_handle);
    sdk_core_engine_AuthenticationPreferences_releaseFfiHandle(_authenticationPreferences_handle);
  }
}

void sdk_core_engine_SDKOptions_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_engine_SDKOptions_release_handle(handle);

// Nullable SDKOptions

final _sdk_core_engine_SDKOptions_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_create_handle_nullable'));
final _sdk_core_engine_SDKOptions_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_release_handle_nullable'));
final _sdk_core_engine_SDKOptions_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_value_nullable'));

Pointer<Void> sdk_core_engine_SDKOptions_toFfi_nullable(SDKOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_engine_SDKOptions_toFfi(value);
  final result = _sdk_core_engine_SDKOptions_create_handle_nullable(_handle);
  sdk_core_engine_SDKOptions_releaseFfiHandle(_handle);
  return result;
}

SDKOptions sdk_core_engine_SDKOptions_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_engine_SDKOptions_get_value_nullable(handle);
  final result = sdk_core_engine_SDKOptions_fromFfi(_handle);
  sdk_core_engine_SDKOptions_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_engine_SDKOptions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_engine_SDKOptions_release_handle_nullable(handle);

// End of SDKOptions "private" section.

