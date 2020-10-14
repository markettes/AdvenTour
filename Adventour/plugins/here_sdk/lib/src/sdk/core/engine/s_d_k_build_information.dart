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
import 'package:here_sdk/src/sdk/core/engine/s_d_k_version.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Provides information about the SDK build.
abstract class SDKBuildInformation {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();


  /// Returns [SDKVersion]. SDK version information.
  static SDKVersion sdkVersion() => SDKBuildInformation$Impl.sdkVersion();
}


// SDKBuildInformation "private" section, not exported.

final _sdk_core_engine_SDKBuildInformation_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKBuildInformation_copy_handle'));
final _sdk_core_engine_SDKBuildInformation_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKBuildInformation_release_handle'));
final _sdk_core_engine_SDKBuildInformation_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_core_engine_SDKBuildInformation_get_raw_pointer'));


class SDKBuildInformation$Impl implements SDKBuildInformation {
  @protected
  Pointer<Void> handle;

  SDKBuildInformation$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_core_engine_SDKBuildInformation_get_raw_pointer(handle));
    _sdk_core_engine_SDKBuildInformation_release_handle(handle);
    handle = null;
  }

  static SDKVersion sdkVersion() {
    final _sdkVersion_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_engine_SDKBuildInformation_sdkVersion'));
    final __result_handle = _sdkVersion_ffi(__lib.LibraryContext.isolateId);
    try {
      return sdk_core_engine_SDKVersion_fromFfi(__result_handle);
    } finally {
      sdk_core_engine_SDKVersion_releaseFfiHandle(__result_handle);
    }
  }


}

Pointer<Void> sdk_core_engine_SDKBuildInformation_toFfi(SDKBuildInformation value) =>
  _sdk_core_engine_SDKBuildInformation_copy_handle((value as SDKBuildInformation$Impl).handle);

SDKBuildInformation sdk_core_engine_SDKBuildInformation_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_core_engine_SDKBuildInformation_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as SDKBuildInformation;
  if (instance != null) return instance;

  final _copied_handle = _sdk_core_engine_SDKBuildInformation_copy_handle(handle);
  final result = SDKBuildInformation$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_core_engine_SDKBuildInformation_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_core_engine_SDKBuildInformation_release_handle(handle);

Pointer<Void> sdk_core_engine_SDKBuildInformation_toFfi_nullable(SDKBuildInformation value) =>
  value != null ? sdk_core_engine_SDKBuildInformation_toFfi(value) : Pointer<Void>.fromAddress(0);

SDKBuildInformation sdk_core_engine_SDKBuildInformation_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_core_engine_SDKBuildInformation_fromFfi(handle) : null;

void sdk_core_engine_SDKBuildInformation_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_engine_SDKBuildInformation_release_handle(handle);

// End of SDKBuildInformation "private" section.

