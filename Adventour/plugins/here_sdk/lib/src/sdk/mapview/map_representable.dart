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
import 'package:here_sdk/src/sdk/mapview/map_view_base.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Any object that conforms this abstract class can be represented graphically on the MapView.
abstract class MapRepresentable {
  MapRepresentable() {}

  factory MapRepresentable.fromLambdas({
    @required void Function(MapViewBase) lambda_attach,
    @required void Function(MapViewBase) lambda_detach
  }) => MapRepresentable$Lambdas(
    lambda_attach,
    lambda_detach
  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// This method is called to attach the component to the mapView.
  /// [mapView] Abstract class representation of MapView.
  attach(MapViewBase mapView);
  /// This method is called to remove this component from the mapView.
  ///
  /// It can be explicitly called or
  /// based on the MapView lifecycle.
  /// [mapView] Abstract class representation of MapView.
  detach(MapViewBase mapView);
}


// MapRepresentable "private" section, not exported.

final _sdk_mapview_MapRepresentable_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapRepresentable_copy_handle'));
final _sdk_mapview_MapRepresentable_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapRepresentable_release_handle'));
final _sdk_mapview_MapRepresentable_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_mapview_MapRepresentable_create_proxy'));
final _sdk_mapview_MapRepresentable_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapRepresentable_get_raw_pointer'));
final _sdk_mapview_MapRepresentable_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapRepresentable_get_type_id'));



class MapRepresentable$Lambdas implements MapRepresentable {
  void Function(MapViewBase) lambda_attach;
  void Function(MapViewBase) lambda_detach;

  MapRepresentable$Lambdas(
    void Function(MapViewBase) lambda_attach,
    void Function(MapViewBase) lambda_detach
  ) {
    this.lambda_attach = lambda_attach;
    this.lambda_detach = lambda_detach;

  }

  @override
  void release() {}

  @override
  attach(MapViewBase mapView) =>
    lambda_attach(mapView);
  @override
  detach(MapViewBase mapView) =>
    lambda_detach(mapView);
}

class MapRepresentable$Impl implements MapRepresentable {
  @protected
  Pointer<Void> handle;
  MapRepresentable$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_MapRepresentable_get_raw_pointer(handle));
    _sdk_mapview_MapRepresentable_release_handle(handle);
    handle = null;
  }

  @override
  attach(MapViewBase mapView) {
    final _attach_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapRepresentable_attach__MapViewBase'));
    final _mapView_handle = sdk_mapview_MapViewBase_toFfi(mapView);
    final _handle = this.handle;
    final __result_handle = _attach_ffi(_handle, __lib.LibraryContext.isolateId, _mapView_handle);
    sdk_mapview_MapViewBase_releaseFfiHandle(_mapView_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  detach(MapViewBase mapView) {
    final _detach_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapRepresentable_detach__MapViewBase'));
    final _mapView_handle = sdk_mapview_MapViewBase_toFfi(mapView);
    final _handle = this.handle;
    final __result_handle = _detach_ffi(_handle, __lib.LibraryContext.isolateId, _mapView_handle);
    sdk_mapview_MapViewBase_releaseFfiHandle(_mapView_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


}

int _MapRepresentable_attach_static(int _token, Pointer<Void> mapView) {

  try {
    (__lib.instanceCache[_token] as MapRepresentable).attach(sdk_mapview_MapViewBase_fromFfi(mapView));
  } finally {
    sdk_mapview_MapViewBase_releaseFfiHandle(mapView);
  }
  return 0;
}
int _MapRepresentable_detach_static(int _token, Pointer<Void> mapView) {

  try {
    (__lib.instanceCache[_token] as MapRepresentable).detach(sdk_mapview_MapViewBase_fromFfi(mapView));
  } finally {
    sdk_mapview_MapViewBase_releaseFfiHandle(mapView);
  }
  return 0;
}


Pointer<Void> sdk_mapview_MapRepresentable_toFfi(MapRepresentable value) {
  if (value is MapRepresentable$Impl) return _sdk_mapview_MapRepresentable_copy_handle(value.handle);

  final result = _sdk_mapview_MapRepresentable_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_MapRepresentable_attach_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_MapRepresentable_detach_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_mapview_MapRepresentable_get_raw_pointer(result)] = value;

  return result;
}

MapRepresentable sdk_mapview_MapRepresentable_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_MapRepresentable_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as MapRepresentable;
  if (instance != null) return instance;

  final _type_id_handle = _sdk_mapview_MapRepresentable_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_mapview_MapRepresentable_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : MapRepresentable$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_MapRepresentable_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapRepresentable_release_handle(handle);

Pointer<Void> sdk_mapview_MapRepresentable_toFfi_nullable(MapRepresentable value) =>
  value != null ? sdk_mapview_MapRepresentable_toFfi(value) : Pointer<Void>.fromAddress(0);

MapRepresentable sdk_mapview_MapRepresentable_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapRepresentable_fromFfi(handle) : null;

void sdk_mapview_MapRepresentable_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapRepresentable_release_handle(handle);

// End of MapRepresentable "private" section.

