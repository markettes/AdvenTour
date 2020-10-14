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
import 'package:here_sdk/src/sdk/mapview/map_camera.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Abstract class for objects that want to get updates whenever the map is redrawn after
/// camera parameters change.
abstract class MapCameraObserver {
  MapCameraObserver() {}

  factory MapCameraObserver.fromLambdas({
    @required void Function(MapCameraState) lambda_onCameraUpdated
  }) => MapCameraObserver$Lambdas(
    lambda_onCameraUpdated
  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Called on the main thread after the map is drawn.
  /// [cameraState] Camera parameters at the time the map was drawn.
  onCameraUpdated(MapCameraState cameraState);
}


// MapCameraObserver "private" section, not exported.

final _sdk_mapview_MapCameraObserver_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraObserver_copy_handle'));
final _sdk_mapview_MapCameraObserver_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraObserver_release_handle'));
final _sdk_mapview_MapCameraObserver_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_mapview_MapCameraObserver_create_proxy'));
final _sdk_mapview_MapCameraObserver_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapCameraObserver_get_raw_pointer'));
final _sdk_mapview_MapCameraObserver_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraObserver_get_type_id'));


class MapCameraObserver$Lambdas implements MapCameraObserver {
  void Function(MapCameraState) lambda_onCameraUpdated;

  MapCameraObserver$Lambdas(
    void Function(MapCameraState) lambda_onCameraUpdated
  ) {
    this.lambda_onCameraUpdated = lambda_onCameraUpdated;

  }

  @override
  void release() {}

  @override
  onCameraUpdated(MapCameraState cameraState) =>
    lambda_onCameraUpdated(cameraState);
}

class MapCameraObserver$Impl implements MapCameraObserver {
  @protected
  Pointer<Void> handle;
  MapCameraObserver$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_MapCameraObserver_get_raw_pointer(handle));
    _sdk_mapview_MapCameraObserver_release_handle(handle);
    handle = null;
  }

  @override
  onCameraUpdated(MapCameraState cameraState) {
    final _onCameraUpdated_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraObserver_onCameraUpdated__State'));
    final _cameraState_handle = sdk_mapview_MapCamera_State_toFfi(cameraState);
    final _handle = this.handle;
    final __result_handle = _onCameraUpdated_ffi(_handle, __lib.LibraryContext.isolateId, _cameraState_handle);
    sdk_mapview_MapCamera_State_releaseFfiHandle(_cameraState_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


}

int _MapCameraObserver_onCameraUpdated_static(int _token, Pointer<Void> cameraState) {

  try {
    (__lib.instanceCache[_token] as MapCameraObserver).onCameraUpdated(sdk_mapview_MapCamera_State_fromFfi(cameraState));
  } finally {
    sdk_mapview_MapCamera_State_releaseFfiHandle(cameraState);
  }
  return 0;
}


Pointer<Void> sdk_mapview_MapCameraObserver_toFfi(MapCameraObserver value) {
  if (value is MapCameraObserver$Impl) return _sdk_mapview_MapCameraObserver_copy_handle(value.handle);

  final result = _sdk_mapview_MapCameraObserver_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_MapCameraObserver_onCameraUpdated_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_mapview_MapCameraObserver_get_raw_pointer(result)] = value;

  return result;
}

MapCameraObserver sdk_mapview_MapCameraObserver_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_MapCameraObserver_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as MapCameraObserver;
  if (instance != null) return instance;

  final _type_id_handle = _sdk_mapview_MapCameraObserver_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_mapview_MapCameraObserver_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : MapCameraObserver$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_MapCameraObserver_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapCameraObserver_release_handle(handle);

Pointer<Void> sdk_mapview_MapCameraObserver_toFfi_nullable(MapCameraObserver value) =>
  value != null ? sdk_mapview_MapCameraObserver_toFfi(value) : Pointer<Void>.fromAddress(0);

MapCameraObserver sdk_mapview_MapCameraObserver_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapCameraObserver_fromFfi(handle) : null;

void sdk_mapview_MapCameraObserver_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapCameraObserver_release_handle(handle);

// End of MapCameraObserver "private" section.

