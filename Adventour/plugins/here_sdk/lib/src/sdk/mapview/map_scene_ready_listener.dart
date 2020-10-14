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

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Internal abstract class used to notify when the map scene is fully initialized.
/// @nodoc
abstract class MapSceneReadyListener {
  MapSceneReadyListener() {}

  factory MapSceneReadyListener.fromLambdas({
    @required void Function() lambda_onMapSceneReady
  }) => MapSceneReadyListener$Lambdas(
    lambda_onMapSceneReady
  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Called when map scene is initialized properly and ready to be used.
  /// @nodoc
  internalonMapSceneReady();
}


// MapSceneReadyListener "private" section, not exported.

final _sdk_mapview_MapSceneReadyListener_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapSceneReadyListener_copy_handle'));
final _sdk_mapview_MapSceneReadyListener_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapSceneReadyListener_release_handle'));
final _sdk_mapview_MapSceneReadyListener_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_mapview_MapSceneReadyListener_create_proxy'));
final _sdk_mapview_MapSceneReadyListener_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapSceneReadyListener_get_raw_pointer'));
final _sdk_mapview_MapSceneReadyListener_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapSceneReadyListener_get_type_id'));


class MapSceneReadyListener$Lambdas implements MapSceneReadyListener {
  void Function() lambda_onMapSceneReady;

  MapSceneReadyListener$Lambdas(
    void Function() lambda_onMapSceneReady
  ) {
    this.lambda_onMapSceneReady = lambda_onMapSceneReady;

  }

  @override
  void release() {}

  @override
  internalonMapSceneReady() =>
    lambda_onMapSceneReady();
}

class MapSceneReadyListener$Impl implements MapSceneReadyListener {
  @protected
  Pointer<Void> handle;
  MapSceneReadyListener$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_MapSceneReadyListener_get_raw_pointer(handle));
    _sdk_mapview_MapSceneReadyListener_release_handle(handle);
    handle = null;
  }

  @override
  internalonMapSceneReady() {
    final _onMapSceneReady_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapSceneReadyListener_onMapSceneReady'));
    final _handle = this.handle;
    final __result_handle = _onMapSceneReady_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


}

int _MapSceneReadyListener_onMapSceneReady_static(int _token) {

  try {
    (__lib.instanceCache[_token] as MapSceneReadyListener).internalonMapSceneReady();
  } finally {
  }
  return 0;
}


Pointer<Void> sdk_mapview_MapSceneReadyListener_toFfi(MapSceneReadyListener value) {
  if (value is MapSceneReadyListener$Impl) return _sdk_mapview_MapSceneReadyListener_copy_handle(value.handle);

  final result = _sdk_mapview_MapSceneReadyListener_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64)>(_MapSceneReadyListener_onMapSceneReady_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_mapview_MapSceneReadyListener_get_raw_pointer(result)] = value;

  return result;
}

MapSceneReadyListener sdk_mapview_MapSceneReadyListener_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_MapSceneReadyListener_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as MapSceneReadyListener;
  if (instance != null) return instance;

  final _type_id_handle = _sdk_mapview_MapSceneReadyListener_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_mapview_MapSceneReadyListener_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : MapSceneReadyListener$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_MapSceneReadyListener_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapSceneReadyListener_release_handle(handle);

Pointer<Void> sdk_mapview_MapSceneReadyListener_toFfi_nullable(MapSceneReadyListener value) =>
  value != null ? sdk_mapview_MapSceneReadyListener_toFfi(value) : Pointer<Void>.fromAddress(0);

MapSceneReadyListener sdk_mapview_MapSceneReadyListener_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapSceneReadyListener_fromFfi(handle) : null;

void sdk_mapview_MapSceneReadyListener_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapSceneReadyListener_release_handle(handle);

// End of MapSceneReadyListener "private" section.

