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
import 'package:here_sdk/src/sdk/core/engine/assets_loader.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Provides platform utils support.
/// @nodoc
abstract class PlatformUtils {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Sets platform information struct which is filled by platform side.
  /// [platformInformation] Platform information struct which should be filled by platform side.
  /// @nodoc
  static internalsetPlatformInformation(PlatformUtilsPlatformInformation platformInformation) => PlatformUtils$Impl.internalsetPlatformInformation(platformInformation);
  /// Returns PlatformInformation struct which was set before.
  /// Returns [PlatformUtilsPlatformInformation]. Current platform information struct.
  /// @nodoc
  static PlatformUtilsPlatformInformation internalgetPlatformInformation() => PlatformUtils$Impl.internalgetPlatformInformation();
  /// Sets the assets loader used to load bundle assets, with platform-specific implementation.
  /// [assetsLoader] Assets loader which would be implemented on the platform side
  /// @nodoc
  static internalsetAssetsLoader(AssetsLoader assetsLoader) => PlatformUtils$Impl.internalsetAssetsLoader(assetsLoader);
  /// Returns assets loader.
  /// Returns [AssetsLoader]. Current assets loader
  /// @nodoc
  static AssetsLoader internalgetAssetsLoader() => PlatformUtils$Impl.internalgetAssetsLoader();
}

/// Information about the platform.
/// @nodoc

class PlatformUtilsPlatformInformation {
  /// Platform name.
  /// @nodoc
  String internalplatformName;

  /// Platform version.
  /// @nodoc
  String internalplatformVersion;

  /// Storage path for application private files (e.g. database) that we don't want to expose to the user.
  /// @nodoc
  String internalprivateStoragePath;

  /// Path for assets that are delivered with the library.
  /// @nodoc
  String internalassetsPath;

  /// Path to be used for caching purposes.
  /// @nodoc
  String internalcachePath;


  PlatformUtilsPlatformInformation(this.internalplatformName, this.internalplatformVersion, this.internalprivateStoragePath, this.internalassetsPath, this.internalcachePath);

  PlatformUtilsPlatformInformation.withDefaults(String assetsPath, String cachePath)
    : internalplatformName = "Unknown", internalplatformVersion = "Unknown", internalprivateStoragePath = "Unknown", internalassetsPath = assetsPath, internalcachePath = cachePath;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! PlatformUtilsPlatformInformation) return false;
    PlatformUtilsPlatformInformation _other = other;
    return internalplatformName == _other.internalplatformName &&
        internalplatformVersion == _other.internalplatformVersion &&
        internalprivateStoragePath == _other.internalprivateStoragePath &&
        internalassetsPath == _other.internalassetsPath &&
        internalcachePath == _other.internalcachePath;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalplatformName.hashCode;
    result = 31 * result + internalplatformVersion.hashCode;
    result = 31 * result + internalprivateStoragePath.hashCode;
    result = 31 * result + internalassetsPath.hashCode;
    result = 31 * result + internalcachePath.hashCode;
    return result;
  }
}


// PlatformUtilsPlatformInformation "private" section, not exported.

final _sdk_core_engine_PlatformUtils_PlatformInformation_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_engine_PlatformUtils_PlatformInformation_create_handle'));
final _sdk_core_engine_PlatformUtils_PlatformInformation_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_PlatformUtils_PlatformInformation_release_handle'));
final _sdk_core_engine_PlatformUtils_PlatformInformation_get_field_platformName = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_PlatformUtils_PlatformInformation_get_field_platformName'));
final _sdk_core_engine_PlatformUtils_PlatformInformation_get_field_platformVersion = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_PlatformUtils_PlatformInformation_get_field_platformVersion'));
final _sdk_core_engine_PlatformUtils_PlatformInformation_get_field_privateStoragePath = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_PlatformUtils_PlatformInformation_get_field_privateStoragePath'));
final _sdk_core_engine_PlatformUtils_PlatformInformation_get_field_assetsPath = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_PlatformUtils_PlatformInformation_get_field_assetsPath'));
final _sdk_core_engine_PlatformUtils_PlatformInformation_get_field_cachePath = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_PlatformUtils_PlatformInformation_get_field_cachePath'));

Pointer<Void> sdk_core_engine_PlatformUtils_PlatformInformation_toFfi(PlatformUtilsPlatformInformation value) {
  final _platformName_handle = String_toFfi(value.internalplatformName);
  final _platformVersion_handle = String_toFfi(value.internalplatformVersion);
  final _privateStoragePath_handle = String_toFfi(value.internalprivateStoragePath);
  final _assetsPath_handle = String_toFfi_nullable(value.internalassetsPath);
  final _cachePath_handle = String_toFfi(value.internalcachePath);
  final _result = _sdk_core_engine_PlatformUtils_PlatformInformation_create_handle(_platformName_handle, _platformVersion_handle, _privateStoragePath_handle, _assetsPath_handle, _cachePath_handle);
  String_releaseFfiHandle(_platformName_handle);
  String_releaseFfiHandle(_platformVersion_handle);
  String_releaseFfiHandle(_privateStoragePath_handle);
  String_releaseFfiHandle_nullable(_assetsPath_handle);
  String_releaseFfiHandle(_cachePath_handle);
  return _result;
}

PlatformUtilsPlatformInformation sdk_core_engine_PlatformUtils_PlatformInformation_fromFfi(Pointer<Void> handle) {
  final _platformName_handle = _sdk_core_engine_PlatformUtils_PlatformInformation_get_field_platformName(handle);
  final _platformVersion_handle = _sdk_core_engine_PlatformUtils_PlatformInformation_get_field_platformVersion(handle);
  final _privateStoragePath_handle = _sdk_core_engine_PlatformUtils_PlatformInformation_get_field_privateStoragePath(handle);
  final _assetsPath_handle = _sdk_core_engine_PlatformUtils_PlatformInformation_get_field_assetsPath(handle);
  final _cachePath_handle = _sdk_core_engine_PlatformUtils_PlatformInformation_get_field_cachePath(handle);
  try {
    return PlatformUtilsPlatformInformation(
      String_fromFfi(_platformName_handle), 
    
      String_fromFfi(_platformVersion_handle), 
    
      String_fromFfi(_privateStoragePath_handle), 
    
      String_fromFfi_nullable(_assetsPath_handle), 
    
      String_fromFfi(_cachePath_handle)
    );
  } finally {
    String_releaseFfiHandle(_platformName_handle);
    String_releaseFfiHandle(_platformVersion_handle);
    String_releaseFfiHandle(_privateStoragePath_handle);
    String_releaseFfiHandle_nullable(_assetsPath_handle);
    String_releaseFfiHandle(_cachePath_handle);
  }
}

void sdk_core_engine_PlatformUtils_PlatformInformation_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_engine_PlatformUtils_PlatformInformation_release_handle(handle);

// Nullable PlatformUtilsPlatformInformation

final _sdk_core_engine_PlatformUtils_PlatformInformation_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_PlatformUtils_PlatformInformation_create_handle_nullable'));
final _sdk_core_engine_PlatformUtils_PlatformInformation_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_PlatformUtils_PlatformInformation_release_handle_nullable'));
final _sdk_core_engine_PlatformUtils_PlatformInformation_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_PlatformUtils_PlatformInformation_get_value_nullable'));

Pointer<Void> sdk_core_engine_PlatformUtils_PlatformInformation_toFfi_nullable(PlatformUtilsPlatformInformation value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_engine_PlatformUtils_PlatformInformation_toFfi(value);
  final result = _sdk_core_engine_PlatformUtils_PlatformInformation_create_handle_nullable(_handle);
  sdk_core_engine_PlatformUtils_PlatformInformation_releaseFfiHandle(_handle);
  return result;
}

PlatformUtilsPlatformInformation sdk_core_engine_PlatformUtils_PlatformInformation_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_engine_PlatformUtils_PlatformInformation_get_value_nullable(handle);
  final result = sdk_core_engine_PlatformUtils_PlatformInformation_fromFfi(_handle);
  sdk_core_engine_PlatformUtils_PlatformInformation_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_engine_PlatformUtils_PlatformInformation_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_engine_PlatformUtils_PlatformInformation_release_handle_nullable(handle);

// End of PlatformUtilsPlatformInformation "private" section.

// PlatformUtils "private" section, not exported.

final _sdk_core_engine_PlatformUtils_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_PlatformUtils_copy_handle'));
final _sdk_core_engine_PlatformUtils_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_PlatformUtils_release_handle'));
final _sdk_core_engine_PlatformUtils_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_core_engine_PlatformUtils_get_raw_pointer'));





class PlatformUtils$Impl implements PlatformUtils {
  @protected
  Pointer<Void> handle;

  PlatformUtils$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_core_engine_PlatformUtils_get_raw_pointer(handle));
    _sdk_core_engine_PlatformUtils_release_handle(handle);
    handle = null;
  }

  static internalsetPlatformInformation(PlatformUtilsPlatformInformation platformInformation) {
    final _setPlatformInformation_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('here_sdk_sdk_core_engine_PlatformUtils_setPlatformInformation__PlatformInformation'));
    final _platformInformation_handle = sdk_core_engine_PlatformUtils_PlatformInformation_toFfi(platformInformation);
    final __result_handle = _setPlatformInformation_ffi(__lib.LibraryContext.isolateId, _platformInformation_handle);
    sdk_core_engine_PlatformUtils_PlatformInformation_releaseFfiHandle(_platformInformation_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  static PlatformUtilsPlatformInformation internalgetPlatformInformation() {
    final _getPlatformInformation_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_engine_PlatformUtils_getPlatformInformation'));
    final __result_handle = _getPlatformInformation_ffi(__lib.LibraryContext.isolateId);
    try {
      return sdk_core_engine_PlatformUtils_PlatformInformation_fromFfi(__result_handle);
    } finally {
      sdk_core_engine_PlatformUtils_PlatformInformation_releaseFfiHandle(__result_handle);
    }
  }

  static internalsetAssetsLoader(AssetsLoader assetsLoader) {
    final _setAssetsLoader_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('here_sdk_sdk_core_engine_PlatformUtils_setAssetsLoader__AssetsLoader'));
    final _assetsLoader_handle = sdk_core_engine_AssetsLoader_toFfi(assetsLoader);
    final __result_handle = _setAssetsLoader_ffi(__lib.LibraryContext.isolateId, _assetsLoader_handle);
    sdk_core_engine_AssetsLoader_releaseFfiHandle(_assetsLoader_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  static AssetsLoader internalgetAssetsLoader() {
    final _getAssetsLoader_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_engine_PlatformUtils_getAssetsLoader'));
    final __result_handle = _getAssetsLoader_ffi(__lib.LibraryContext.isolateId);
    try {
      return sdk_core_engine_AssetsLoader_fromFfi(__result_handle);
    } finally {
      sdk_core_engine_AssetsLoader_releaseFfiHandle(__result_handle);
    }
  }


}

Pointer<Void> sdk_core_engine_PlatformUtils_toFfi(PlatformUtils value) =>
  _sdk_core_engine_PlatformUtils_copy_handle((value as PlatformUtils$Impl).handle);

PlatformUtils sdk_core_engine_PlatformUtils_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_core_engine_PlatformUtils_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as PlatformUtils;
  if (instance != null) return instance;

  final _copied_handle = _sdk_core_engine_PlatformUtils_copy_handle(handle);
  final result = PlatformUtils$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_core_engine_PlatformUtils_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_core_engine_PlatformUtils_release_handle(handle);

Pointer<Void> sdk_core_engine_PlatformUtils_toFfi_nullable(PlatformUtils value) =>
  value != null ? sdk_core_engine_PlatformUtils_toFfi(value) : Pointer<Void>.fromAddress(0);

PlatformUtils sdk_core_engine_PlatformUtils_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_core_engine_PlatformUtils_fromFfi(handle) : null;

void sdk_core_engine_PlatformUtils_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_engine_PlatformUtils_release_handle(handle);

// End of PlatformUtils "private" section.

