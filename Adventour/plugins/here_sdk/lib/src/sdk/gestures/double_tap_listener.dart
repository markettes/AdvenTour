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
import 'package:here_sdk/src/sdk/core/point2_d.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Abstract class for handling double tap gestures.
///
/// Double-tap gesture occurs after double-tapping on the screen.
abstract class DoubleTapListener {
  DoubleTapListener() {}

  factory DoubleTapListener.fromLambdas({
    @required void Function(Point2D) lambda_onDoubleTap
  }) => DoubleTapListener$Lambdas(
    lambda_onDoubleTap
  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Called when the double-tap gesture occurs.
  /// [origin] Position of the touch point relative to the MapView in pixels.
  onDoubleTap(Point2D origin);
}


// DoubleTapListener "private" section, not exported.

final _sdk_gestures_DoubleTapListener_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_DoubleTapListener_copy_handle'));
final _sdk_gestures_DoubleTapListener_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_DoubleTapListener_release_handle'));
final _sdk_gestures_DoubleTapListener_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_gestures_DoubleTapListener_create_proxy'));
final _sdk_gestures_DoubleTapListener_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_gestures_DoubleTapListener_get_raw_pointer'));
final _sdk_gestures_DoubleTapListener_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_DoubleTapListener_get_type_id'));


class DoubleTapListener$Lambdas implements DoubleTapListener {
  void Function(Point2D) lambda_onDoubleTap;

  DoubleTapListener$Lambdas(
    void Function(Point2D) lambda_onDoubleTap
  ) {
    this.lambda_onDoubleTap = lambda_onDoubleTap;

  }

  @override
  void release() {}

  @override
  onDoubleTap(Point2D origin) =>
    lambda_onDoubleTap(origin);
}

class DoubleTapListener$Impl implements DoubleTapListener {
  @protected
  Pointer<Void> handle;
  DoubleTapListener$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_gestures_DoubleTapListener_get_raw_pointer(handle));
    _sdk_gestures_DoubleTapListener_release_handle(handle);
    handle = null;
  }

  @override
  onDoubleTap(Point2D origin) {
    final _onDoubleTap_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_DoubleTapListener_onDoubleTap__Point2D'));
    final _origin_handle = sdk_core_Point2D_toFfi(origin);
    final _handle = this.handle;
    final __result_handle = _onDoubleTap_ffi(_handle, __lib.LibraryContext.isolateId, _origin_handle);
    sdk_core_Point2D_releaseFfiHandle(_origin_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


}

int _DoubleTapListener_onDoubleTap_static(int _token, Pointer<Void> origin) {

  try {
    (__lib.instanceCache[_token] as DoubleTapListener).onDoubleTap(sdk_core_Point2D_fromFfi(origin));
  } finally {
    sdk_core_Point2D_releaseFfiHandle(origin);
  }
  return 0;
}


Pointer<Void> sdk_gestures_DoubleTapListener_toFfi(DoubleTapListener value) {
  if (value is DoubleTapListener$Impl) return _sdk_gestures_DoubleTapListener_copy_handle(value.handle);

  final result = _sdk_gestures_DoubleTapListener_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_DoubleTapListener_onDoubleTap_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_gestures_DoubleTapListener_get_raw_pointer(result)] = value;

  return result;
}

DoubleTapListener sdk_gestures_DoubleTapListener_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_gestures_DoubleTapListener_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as DoubleTapListener;
  if (instance != null) return instance;

  final _type_id_handle = _sdk_gestures_DoubleTapListener_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_gestures_DoubleTapListener_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : DoubleTapListener$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_gestures_DoubleTapListener_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_gestures_DoubleTapListener_release_handle(handle);

Pointer<Void> sdk_gestures_DoubleTapListener_toFfi_nullable(DoubleTapListener value) =>
  value != null ? sdk_gestures_DoubleTapListener_toFfi(value) : Pointer<Void>.fromAddress(0);

DoubleTapListener sdk_gestures_DoubleTapListener_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_gestures_DoubleTapListener_fromFfi(handle) : null;

void sdk_gestures_DoubleTapListener_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_gestures_DoubleTapListener_release_handle(handle);

// End of DoubleTapListener "private" section.

