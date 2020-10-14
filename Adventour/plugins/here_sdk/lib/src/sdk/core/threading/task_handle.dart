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

/// Handle used for the manipulation of the task.
abstract class TaskHandle {
  TaskHandle() {}

  factory TaskHandle.fromLambdas({
    @required bool Function() lambda_cancel,
    @required bool Function() lambda_isFinished_get,
    @required bool Function() lambda_isCancelled_get
  }) => TaskHandle$Lambdas(
    lambda_cancel,
    lambda_isFinished_get,
    lambda_isCancelled_get
  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Sets internal state of task to 'canceled'.
  ///
  /// If the task is still in the queue, it will be
  /// removed from it immediately. However, if the task is in a running state, it will nevertheless be completed, as there is no way
  /// to interrupt it.
  /// Returns [bool]. True, if the task was canceled.
  ///
  /// False, if the task can't be canceled due to a
  /// platform dependent reason.
  bool cancel();
  /// True, if this task is completed. Completion may be due to normal termination,
  /// an exception, or cancellation - in all of these cases, result will return true.
  bool get isFinished;

  /// True, if this task was canceled before it completed normally.
  bool get isCancelled;

}


// TaskHandle "private" section, not exported.

final _sdk_core_threading_TaskHandle_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_threading_TaskHandle_copy_handle'));
final _sdk_core_threading_TaskHandle_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_threading_TaskHandle_release_handle'));
final _sdk_core_threading_TaskHandle_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_core_threading_TaskHandle_create_proxy'));
final _sdk_core_threading_TaskHandle_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_core_threading_TaskHandle_get_raw_pointer'));
final _sdk_core_threading_TaskHandle_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_threading_TaskHandle_get_type_id'));


class TaskHandle$Lambdas implements TaskHandle {
  bool Function() lambda_cancel;
  bool Function() lambda_isFinished_get;
  bool Function() lambda_isCancelled_get;

  TaskHandle$Lambdas(
    bool Function() lambda_cancel,
    bool Function() lambda_isFinished_get,
    bool Function() lambda_isCancelled_get
  ) {
    this.lambda_cancel = lambda_cancel;
    this.lambda_isFinished_get = lambda_isFinished_get;
    this.lambda_isCancelled_get = lambda_isCancelled_get;

  }

  @override
  void release() {}

  @override
  bool cancel() =>
    lambda_cancel();
  @override
  bool get isFinished => lambda_isFinished_get();
  @override
  bool get isCancelled => lambda_isCancelled_get();
}

class TaskHandle$Impl implements TaskHandle {
  @protected
  Pointer<Void> handle;
  TaskHandle$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_core_threading_TaskHandle_get_raw_pointer(handle));
    _sdk_core_threading_TaskHandle_release_handle(handle);
    handle = null;
  }

  @override
  bool cancel() {
    final _cancel_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_core_threading_TaskHandle_cancel'));
    final _handle = this.handle;
    final __result_handle = _cancel_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }

  /// True, if this task is completed. Completion may be due to normal termination,
  /// an exception, or cancellation - in all of these cases, result will return true.
  bool get isFinished {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_core_threading_TaskHandle_isFinished_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }


  /// True, if this task was canceled before it completed normally.
  bool get isCancelled {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_core_threading_TaskHandle_isCancelled_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }



}

int _TaskHandle_cancel_static(int _token, Pointer<Uint8> _result) {
  bool _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as TaskHandle).cancel();
    _result.value = Boolean_toFfi(_result_object);
  } finally {
  }
  return 0;
}

int _TaskHandle_isFinished_get_static(int _token, Pointer<Uint8> _result) {
  _result.value = Boolean_toFfi((__lib.instanceCache[_token] as TaskHandle).isFinished);
  return 0;
}
int _TaskHandle_isCancelled_get_static(int _token, Pointer<Uint8> _result) {
  _result.value = Boolean_toFfi((__lib.instanceCache[_token] as TaskHandle).isCancelled);
  return 0;
}

Pointer<Void> sdk_core_threading_TaskHandle_toFfi(TaskHandle value) {
  if (value is TaskHandle$Impl) return _sdk_core_threading_TaskHandle_copy_handle(value.handle);

  final result = _sdk_core_threading_TaskHandle_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Uint8>)>(_TaskHandle_cancel_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Uint8>)>(_TaskHandle_isFinished_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Uint8>)>(_TaskHandle_isCancelled_get_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_core_threading_TaskHandle_get_raw_pointer(result)] = value;

  return result;
}

TaskHandle sdk_core_threading_TaskHandle_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_core_threading_TaskHandle_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as TaskHandle;
  if (instance != null) return instance;

  final _type_id_handle = _sdk_core_threading_TaskHandle_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_core_threading_TaskHandle_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : TaskHandle$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_core_threading_TaskHandle_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_core_threading_TaskHandle_release_handle(handle);

Pointer<Void> sdk_core_threading_TaskHandle_toFfi_nullable(TaskHandle value) =>
  value != null ? sdk_core_threading_TaskHandle_toFfi(value) : Pointer<Void>.fromAddress(0);

TaskHandle sdk_core_threading_TaskHandle_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_core_threading_TaskHandle_fromFfi(handle) : null;

void sdk_core_threading_TaskHandle_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_threading_TaskHandle_release_handle(handle);

// End of TaskHandle "private" section.

