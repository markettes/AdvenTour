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
import 'package:here_sdk/src/sdk/core/language_code.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// internal class wrapping HARP's map context
/// @nodoc
abstract class MapContext {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Pauses the map context.
  /// @nodoc
  internalpause();
  /// Resumes the map context.
  /// @nodoc
  internalresume();


  /// @nodoc
  LanguageCode get internalprimaryLanguage;


  /// @nodoc
  set internalprimaryLanguage(LanguageCode value);


}


// MapContext "private" section, not exported.

final _sdk_mapview_MapContext_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContext_copy_handle'));
final _sdk_mapview_MapContext_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContext_release_handle'));
final _sdk_mapview_MapContext_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapContext_get_raw_pointer'));



class MapContext$Impl implements MapContext {
  @protected
  Pointer<Void> handle;

  MapContext$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_MapContext_get_raw_pointer(handle));
    _sdk_mapview_MapContext_release_handle(handle);
    handle = null;
  }

  @override
  internalpause() {
    final _pause_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapContext_pause'));
    final _handle = this.handle;
    final __result_handle = _pause_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internalresume() {
    final _resume_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapContext_resume'));
    final _handle = this.handle;
    final __result_handle = _resume_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  LanguageCode get internalprimaryLanguage {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapContext_primaryLanguage_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_core_LanguageCode_fromFfi_nullable(__result_handle);
    } finally {
      sdk_core_LanguageCode_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  set internalprimaryLanguage(LanguageCode value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapContext_primaryLanguage_set__LanguageCode'));
    final _value_handle = sdk_core_LanguageCode_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_core_LanguageCode_releaseFfiHandle_nullable(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }



}

Pointer<Void> sdk_mapview_MapContext_toFfi(MapContext value) =>
  _sdk_mapview_MapContext_copy_handle((value as MapContext$Impl).handle);

MapContext sdk_mapview_MapContext_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_MapContext_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as MapContext;
  if (instance != null) return instance;

  final _copied_handle = _sdk_mapview_MapContext_copy_handle(handle);
  final result = MapContext$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_MapContext_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapContext_release_handle(handle);

Pointer<Void> sdk_mapview_MapContext_toFfi_nullable(MapContext value) =>
  value != null ? sdk_mapview_MapContext_toFfi(value) : Pointer<Void>.fromAddress(0);

MapContext sdk_mapview_MapContext_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapContext_fromFfi(handle) : null;

void sdk_mapview_MapContext_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapContext_release_handle(handle);

// End of MapContext "private" section.

