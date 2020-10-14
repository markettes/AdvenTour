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
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Provides application utils support.
/// @nodoc
abstract class ApplicationUtils {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Sets ApplicationInformation struct which is filled by platform side.
  /// [applicationInformation] Application information struct which should be filled by platform side.
  /// @nodoc
  static internalsetApplicationInformation(ApplicationUtilsApplicationInformation applicationInformation) => ApplicationUtils$Impl.internalsetApplicationInformation(applicationInformation);
  /// Returns ApplicationInformation struct which was set before.
  /// Returns [ApplicationUtilsApplicationInformation]. Current platform information struct.
  /// @nodoc
  static ApplicationUtilsApplicationInformation internalgetApplicationInformation() => ApplicationUtils$Impl.internalgetApplicationInformation();
}

/// Information about the application.
/// @nodoc

class ApplicationUtilsApplicationInformation {
  /// Application version.
  /// @nodoc
  String internalapplicationVersion;


  ApplicationUtilsApplicationInformation(this.internalapplicationVersion);

  ApplicationUtilsApplicationInformation.withDefaults()
    : internalapplicationVersion = "Unknown";

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! ApplicationUtilsApplicationInformation) return false;
    ApplicationUtilsApplicationInformation _other = other;
    return internalapplicationVersion == _other.internalapplicationVersion;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalapplicationVersion.hashCode;
    return result;
  }
}


// ApplicationUtilsApplicationInformation "private" section, not exported.

final _sdk_core_engine_ApplicationUtils_ApplicationInformation_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ApplicationUtils_ApplicationInformation_create_handle'));
final _sdk_core_engine_ApplicationUtils_ApplicationInformation_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ApplicationUtils_ApplicationInformation_release_handle'));
final _sdk_core_engine_ApplicationUtils_ApplicationInformation_get_field_applicationVersion = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ApplicationUtils_ApplicationInformation_get_field_applicationVersion'));

Pointer<Void> sdk_core_engine_ApplicationUtils_ApplicationInformation_toFfi(ApplicationUtilsApplicationInformation value) {
  final _applicationVersion_handle = String_toFfi(value.internalapplicationVersion);
  final _result = _sdk_core_engine_ApplicationUtils_ApplicationInformation_create_handle(_applicationVersion_handle);
  String_releaseFfiHandle(_applicationVersion_handle);
  return _result;
}

ApplicationUtilsApplicationInformation sdk_core_engine_ApplicationUtils_ApplicationInformation_fromFfi(Pointer<Void> handle) {
  final _applicationVersion_handle = _sdk_core_engine_ApplicationUtils_ApplicationInformation_get_field_applicationVersion(handle);
  try {
    return ApplicationUtilsApplicationInformation(
      String_fromFfi(_applicationVersion_handle)
    );
  } finally {
    String_releaseFfiHandle(_applicationVersion_handle);
  }
}

void sdk_core_engine_ApplicationUtils_ApplicationInformation_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_engine_ApplicationUtils_ApplicationInformation_release_handle(handle);

// Nullable ApplicationUtilsApplicationInformation

final _sdk_core_engine_ApplicationUtils_ApplicationInformation_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ApplicationUtils_ApplicationInformation_create_handle_nullable'));
final _sdk_core_engine_ApplicationUtils_ApplicationInformation_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ApplicationUtils_ApplicationInformation_release_handle_nullable'));
final _sdk_core_engine_ApplicationUtils_ApplicationInformation_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ApplicationUtils_ApplicationInformation_get_value_nullable'));

Pointer<Void> sdk_core_engine_ApplicationUtils_ApplicationInformation_toFfi_nullable(ApplicationUtilsApplicationInformation value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_engine_ApplicationUtils_ApplicationInformation_toFfi(value);
  final result = _sdk_core_engine_ApplicationUtils_ApplicationInformation_create_handle_nullable(_handle);
  sdk_core_engine_ApplicationUtils_ApplicationInformation_releaseFfiHandle(_handle);
  return result;
}

ApplicationUtilsApplicationInformation sdk_core_engine_ApplicationUtils_ApplicationInformation_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_engine_ApplicationUtils_ApplicationInformation_get_value_nullable(handle);
  final result = sdk_core_engine_ApplicationUtils_ApplicationInformation_fromFfi(_handle);
  sdk_core_engine_ApplicationUtils_ApplicationInformation_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_engine_ApplicationUtils_ApplicationInformation_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_engine_ApplicationUtils_ApplicationInformation_release_handle_nullable(handle);

// End of ApplicationUtilsApplicationInformation "private" section.

// ApplicationUtils "private" section, not exported.

final _sdk_core_engine_ApplicationUtils_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ApplicationUtils_copy_handle'));
final _sdk_core_engine_ApplicationUtils_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ApplicationUtils_release_handle'));
final _sdk_core_engine_ApplicationUtils_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_core_engine_ApplicationUtils_get_raw_pointer'));



class ApplicationUtils$Impl implements ApplicationUtils {
  @protected
  Pointer<Void> handle;

  ApplicationUtils$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_core_engine_ApplicationUtils_get_raw_pointer(handle));
    _sdk_core_engine_ApplicationUtils_release_handle(handle);
    handle = null;
  }

  static internalsetApplicationInformation(ApplicationUtilsApplicationInformation applicationInformation) {
    final _setApplicationInformation_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('here_sdk_sdk_core_engine_ApplicationUtils_setApplicationInformation__ApplicationInformation'));
    final _applicationInformation_handle = sdk_core_engine_ApplicationUtils_ApplicationInformation_toFfi(applicationInformation);
    final __result_handle = _setApplicationInformation_ffi(__lib.LibraryContext.isolateId, _applicationInformation_handle);
    sdk_core_engine_ApplicationUtils_ApplicationInformation_releaseFfiHandle(_applicationInformation_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  static ApplicationUtilsApplicationInformation internalgetApplicationInformation() {
    final _getApplicationInformation_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_engine_ApplicationUtils_getApplicationInformation'));
    final __result_handle = _getApplicationInformation_ffi(__lib.LibraryContext.isolateId);
    try {
      return sdk_core_engine_ApplicationUtils_ApplicationInformation_fromFfi(__result_handle);
    } finally {
      sdk_core_engine_ApplicationUtils_ApplicationInformation_releaseFfiHandle(__result_handle);
    }
  }


}

Pointer<Void> sdk_core_engine_ApplicationUtils_toFfi(ApplicationUtils value) =>
  _sdk_core_engine_ApplicationUtils_copy_handle((value as ApplicationUtils$Impl).handle);

ApplicationUtils sdk_core_engine_ApplicationUtils_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_core_engine_ApplicationUtils_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as ApplicationUtils;
  if (instance != null) return instance;

  final _copied_handle = _sdk_core_engine_ApplicationUtils_copy_handle(handle);
  final result = ApplicationUtils$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_core_engine_ApplicationUtils_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_core_engine_ApplicationUtils_release_handle(handle);

Pointer<Void> sdk_core_engine_ApplicationUtils_toFfi_nullable(ApplicationUtils value) =>
  value != null ? sdk_core_engine_ApplicationUtils_toFfi(value) : Pointer<Void>.fromAddress(0);

ApplicationUtils sdk_core_engine_ApplicationUtils_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_core_engine_ApplicationUtils_fromFfi(handle) : null;

void sdk_core_engine_ApplicationUtils_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_engine_ApplicationUtils_release_handle(handle);

// End of ApplicationUtils "private" section.

