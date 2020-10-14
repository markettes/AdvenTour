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

/// Abstract class for storing arbitrary metadata types.
///
/// By implementing this abstract class, multiple object types can be stored as
/// desired, simply by adding fields to the implementation that refer to those
/// objects and then assigning an instance of the CustomMetadataValue derived class
/// to a map item.
abstract class CustomMetadataValue {
  CustomMetadataValue() {}

  factory CustomMetadataValue.fromLambdas({
    @required String Function() lambda_getTag
  }) => CustomMetadataValue$Lambdas(
    lambda_getTag
  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Obtains a tag that describes the instance of the abstract class.
  ///
  /// The tag is specific to the concrete implementation of the abstract class.
  /// Returns [String]. A tag describing the implementation of the abstract class.
  String getTag();
}


// CustomMetadataValue "private" section, not exported.

final _sdk_core_CustomMetadataValue_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_CustomMetadataValue_copy_handle'));
final _sdk_core_CustomMetadataValue_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_CustomMetadataValue_release_handle'));
final _sdk_core_CustomMetadataValue_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_core_CustomMetadataValue_create_proxy'));
final _sdk_core_CustomMetadataValue_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_core_CustomMetadataValue_get_raw_pointer'));
final _sdk_core_CustomMetadataValue_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_CustomMetadataValue_get_type_id'));


class CustomMetadataValue$Lambdas implements CustomMetadataValue {
  String Function() lambda_getTag;

  CustomMetadataValue$Lambdas(
    String Function() lambda_getTag
  ) {
    this.lambda_getTag = lambda_getTag;

  }

  @override
  void release() {}

  @override
  String getTag() =>
    lambda_getTag();
}

class CustomMetadataValue$Impl implements CustomMetadataValue {
  @protected
  Pointer<Void> handle;
  CustomMetadataValue$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_core_CustomMetadataValue_get_raw_pointer(handle));
    _sdk_core_CustomMetadataValue_release_handle(handle);
    handle = null;
  }

  @override
  String getTag() {
    final _getTag_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_core_CustomMetadataValue_getTag'));
    final _handle = this.handle;
    final __result_handle = _getTag_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }


}

int _CustomMetadataValue_getTag_static(int _token, Pointer<Pointer<Void>> _result) {
  String _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as CustomMetadataValue).getTag();
    _result.value = String_toFfi(_result_object);
  } finally {
  }
  return 0;
}


Pointer<Void> sdk_core_CustomMetadataValue_toFfi(CustomMetadataValue value) {
  if (value is CustomMetadataValue$Impl) return _sdk_core_CustomMetadataValue_copy_handle(value.handle);

  final result = _sdk_core_CustomMetadataValue_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_CustomMetadataValue_getTag_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_core_CustomMetadataValue_get_raw_pointer(result)] = value;

  return result;
}

CustomMetadataValue sdk_core_CustomMetadataValue_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_core_CustomMetadataValue_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as CustomMetadataValue;
  if (instance != null) return instance;

  final _type_id_handle = _sdk_core_CustomMetadataValue_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_core_CustomMetadataValue_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : CustomMetadataValue$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_core_CustomMetadataValue_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_core_CustomMetadataValue_release_handle(handle);

Pointer<Void> sdk_core_CustomMetadataValue_toFfi_nullable(CustomMetadataValue value) =>
  value != null ? sdk_core_CustomMetadataValue_toFfi(value) : Pointer<Void>.fromAddress(0);

CustomMetadataValue sdk_core_CustomMetadataValue_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_core_CustomMetadataValue_fromFfi(handle) : null;

void sdk_core_CustomMetadataValue_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_CustomMetadataValue_release_handle(handle);

// End of CustomMetadataValue "private" section.

