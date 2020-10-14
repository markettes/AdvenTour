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
import 'package:here_sdk/src/sdk/core/location_listener.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// This abstract class is used for providing location related updates
/// to a [LocationListener].
@Deprecated("Will be removed in v4.7.0. This interface is no longer needed.")
abstract class LocationProvider {
  LocationProvider() {}

  factory LocationProvider.fromLambdas({
    @required void Function() lambda_start,
    @required void Function() lambda_stop,
    @required LocationListener Function() lambda_listener_get,
    @required void Function(LocationListener) lambda_listener_set
  }) => LocationProvider$Lambdas(
    lambda_start,
    lambda_stop,
    lambda_listener_get,
    lambda_listener_set
  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Starts the location provider to send notifications to the subscribers.
  start();
  /// Stops the location provider from sending notifications to the subscribers.
  stop();
  /// Gets a LocationListener that notifies on location updates.
  LocationListener get listener;
  /// Sets a LocationListener that notifies on location updates.
  set listener(LocationListener value);

}


// LocationProvider "private" section, not exported.

final _sdk_core_LocationProvider_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationProvider_copy_handle'));
final _sdk_core_LocationProvider_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationProvider_release_handle'));
final _sdk_core_LocationProvider_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_core_LocationProvider_create_proxy'));
final _sdk_core_LocationProvider_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_core_LocationProvider_get_raw_pointer'));
final _sdk_core_LocationProvider_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationProvider_get_type_id'));



class LocationProvider$Lambdas implements LocationProvider {
  void Function() lambda_start;
  void Function() lambda_stop;
  LocationListener Function() lambda_listener_get;
  void Function(LocationListener) lambda_listener_set;

  LocationProvider$Lambdas(
    void Function() lambda_start,
    void Function() lambda_stop,
    LocationListener Function() lambda_listener_get,
    void Function(LocationListener) lambda_listener_set
  ) {
    this.lambda_start = lambda_start;
    this.lambda_stop = lambda_stop;
    this.lambda_listener_get = lambda_listener_get;
    this.lambda_listener_set = lambda_listener_set;

  }

  @override
  void release() {}

  @override
  start() =>
    lambda_start();
  @override
  stop() =>
    lambda_stop();
  @override
  LocationListener get listener => lambda_listener_get();
  @override
  set listener(LocationListener value) => lambda_listener_set(value);
}

class LocationProvider$Impl implements LocationProvider {
  @protected
  Pointer<Void> handle;
  LocationProvider$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_core_LocationProvider_get_raw_pointer(handle));
    _sdk_core_LocationProvider_release_handle(handle);
    handle = null;
  }

  @override
  start() {
    final _start_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_core_LocationProvider_start'));
    final _handle = this.handle;
    final __result_handle = _start_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  stop() {
    final _stop_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_core_LocationProvider_stop'));
    final _handle = this.handle;
    final __result_handle = _stop_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  /// Gets a LocationListener that notifies on location updates.
  LocationListener get listener {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_core_LocationProvider_listener_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_core_LocationListener_fromFfi_nullable(__result_handle);
    } finally {
      sdk_core_LocationListener_releaseFfiHandle_nullable(__result_handle);
    }
  }

  /// Sets a LocationListener that notifies on location updates.
  set listener(LocationListener value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_LocationProvider_listener_set__LocationListener'));
    final _value_handle = sdk_core_LocationListener_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_core_LocationListener_releaseFfiHandle_nullable(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }



}

int _LocationProvider_start_static(int _token) {

  try {
    (__lib.instanceCache[_token] as LocationProvider).start();
  } finally {
  }
  return 0;
}
int _LocationProvider_stop_static(int _token) {

  try {
    (__lib.instanceCache[_token] as LocationProvider).stop();
  } finally {
  }
  return 0;
}

int _LocationProvider_listener_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = sdk_core_LocationListener_toFfi_nullable((__lib.instanceCache[_token] as LocationProvider).listener);
  return 0;
}

int _LocationProvider_listener_set_static(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as LocationProvider).listener =
      sdk_core_LocationListener_fromFfi_nullable(_value);
  } finally {
    sdk_core_LocationListener_releaseFfiHandle_nullable(_value);
  }
  return 0;
}

Pointer<Void> sdk_core_LocationProvider_toFfi(LocationProvider value) {
  if (value is LocationProvider$Impl) return _sdk_core_LocationProvider_copy_handle(value.handle);

  final result = _sdk_core_LocationProvider_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64)>(_LocationProvider_start_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64)>(_LocationProvider_stop_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_LocationProvider_listener_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_LocationProvider_listener_set_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_core_LocationProvider_get_raw_pointer(result)] = value;

  return result;
}

LocationProvider sdk_core_LocationProvider_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_core_LocationProvider_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as LocationProvider;
  if (instance != null) return instance;

  final _type_id_handle = _sdk_core_LocationProvider_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_core_LocationProvider_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : LocationProvider$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_core_LocationProvider_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_core_LocationProvider_release_handle(handle);

Pointer<Void> sdk_core_LocationProvider_toFfi_nullable(LocationProvider value) =>
  value != null ? sdk_core_LocationProvider_toFfi(value) : Pointer<Void>.fromAddress(0);

LocationProvider sdk_core_LocationProvider_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_core_LocationProvider_fromFfi(handle) : null;

void sdk_core_LocationProvider_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_LocationProvider_release_handle(handle);

// End of LocationProvider "private" section.

