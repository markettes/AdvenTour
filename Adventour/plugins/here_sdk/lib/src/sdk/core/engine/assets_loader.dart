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

import 'dart:typed_data';
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Access to bundle assets delivered with the SDK.
/// @nodoc
abstract class AssetsLoader {
  AssetsLoader() {}

  factory AssetsLoader.fromLambdas({
    @required String Function(String) lambda_loadAsset,
    @required Uint8List Function(String) lambda_loadAssetBlob,
    @required List<String> Function(String) lambda_getSubfolderNames
  }) => AssetsLoader$Lambdas(
    lambda_loadAsset,
    lambda_loadAssetBlob,
    lambda_getSubfolderNames
  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Load an asset at the given path.
  /// [path] The path of the given asset, including its name.
  /// Returns [String]. The asset content, as a string.
  /// @nodoc
  String internalloadAsset(String path);
  /// Load a binary asset at the given path.
  /// [path] The path of the given asset, including its name.
  /// Returns [Uint8List]. The asset content, as a string.
  /// @nodoc
  Uint8List internalloadAssetBlob(String path);
  /// Returns a list of subfolder names under the given path
  /// [path] The path of the parent folder containing the subfolders.
  /// Returns [List<String>]. A list of subfolder names.
  /// @nodoc
  List<String> internalgetSubfolderNames(String path);
}


// AssetsLoader "private" section, not exported.

final _sdk_core_engine_AssetsLoader_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_AssetsLoader_copy_handle'));
final _sdk_core_engine_AssetsLoader_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_AssetsLoader_release_handle'));
final _sdk_core_engine_AssetsLoader_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_core_engine_AssetsLoader_create_proxy'));
final _sdk_core_engine_AssetsLoader_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_core_engine_AssetsLoader_get_raw_pointer'));
final _sdk_core_engine_AssetsLoader_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_AssetsLoader_get_type_id'));




class AssetsLoader$Lambdas implements AssetsLoader {
  String Function(String) lambda_loadAsset;
  Uint8List Function(String) lambda_loadAssetBlob;
  List<String> Function(String) lambda_getSubfolderNames;

  AssetsLoader$Lambdas(
    String Function(String) lambda_loadAsset,
    Uint8List Function(String) lambda_loadAssetBlob,
    List<String> Function(String) lambda_getSubfolderNames
  ) {
    this.lambda_loadAsset = lambda_loadAsset;
    this.lambda_loadAssetBlob = lambda_loadAssetBlob;
    this.lambda_getSubfolderNames = lambda_getSubfolderNames;

  }

  @override
  void release() {}

  @override
  String internalloadAsset(String path) =>
    lambda_loadAsset(path);
  @override
  Uint8List internalloadAssetBlob(String path) =>
    lambda_loadAssetBlob(path);
  @override
  List<String> internalgetSubfolderNames(String path) =>
    lambda_getSubfolderNames(path);
}

class AssetsLoader$Impl implements AssetsLoader {
  @protected
  Pointer<Void> handle;
  AssetsLoader$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_core_engine_AssetsLoader_get_raw_pointer(handle));
    _sdk_core_engine_AssetsLoader_release_handle(handle);
    handle = null;
  }

  @override
  String internalloadAsset(String path) {
    final _loadAsset_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_engine_AssetsLoader_loadAsset__String'));
    final _path_handle = String_toFfi(path);
    final _handle = this.handle;
    final __result_handle = _loadAsset_ffi(_handle, __lib.LibraryContext.isolateId, _path_handle);
    String_releaseFfiHandle(_path_handle);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }

  @override
  Uint8List internalloadAssetBlob(String path) {
    final _loadAssetBlob_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_engine_AssetsLoader_loadAssetBlob__String'));
    final _path_handle = String_toFfi(path);
    final _handle = this.handle;
    final __result_handle = _loadAssetBlob_ffi(_handle, __lib.LibraryContext.isolateId, _path_handle);
    String_releaseFfiHandle(_path_handle);
    try {
      return Blob_fromFfi(__result_handle);
    } finally {
      Blob_releaseFfiHandle(__result_handle);
    }
  }

  @override
  List<String> internalgetSubfolderNames(String path) {
    final _getSubfolderNames_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_engine_AssetsLoader_getSubfolderNames__String'));
    final _path_handle = String_toFfi(path);
    final _handle = this.handle;
    final __result_handle = _getSubfolderNames_ffi(_handle, __lib.LibraryContext.isolateId, _path_handle);
    String_releaseFfiHandle(_path_handle);
    try {
      return heresdk_core_bindings_ListOf_String_fromFfi(__result_handle);
    } finally {
      heresdk_core_bindings_ListOf_String_releaseFfiHandle(__result_handle);
    }
  }


}

int _AssetsLoader_loadAsset_static(int _token, Pointer<Void> path, Pointer<Pointer<Void>> _result) {
  String _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as AssetsLoader).internalloadAsset(String_fromFfi(path));
    _result.value = String_toFfi(_result_object);
  } finally {
    String_releaseFfiHandle(path);
  }
  return 0;
}
int _AssetsLoader_loadAssetBlob_static(int _token, Pointer<Void> path, Pointer<Pointer<Void>> _result) {
  Uint8List _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as AssetsLoader).internalloadAssetBlob(String_fromFfi(path));
    _result.value = Blob_toFfi(_result_object);
  } finally {
    String_releaseFfiHandle(path);
  }
  return 0;
}
int _AssetsLoader_getSubfolderNames_static(int _token, Pointer<Void> path, Pointer<Pointer<Void>> _result) {
  List<String> _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as AssetsLoader).internalgetSubfolderNames(String_fromFfi(path));
    _result.value = heresdk_core_bindings_ListOf_String_toFfi(_result_object);
  } finally {
    String_releaseFfiHandle(path);
  }
  return 0;
}


Pointer<Void> sdk_core_engine_AssetsLoader_toFfi(AssetsLoader value) {
  if (value is AssetsLoader$Impl) return _sdk_core_engine_AssetsLoader_copy_handle(value.handle);

  final result = _sdk_core_engine_AssetsLoader_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_AssetsLoader_loadAsset_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_AssetsLoader_loadAssetBlob_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_AssetsLoader_getSubfolderNames_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_core_engine_AssetsLoader_get_raw_pointer(result)] = value;

  return result;
}

AssetsLoader sdk_core_engine_AssetsLoader_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_core_engine_AssetsLoader_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as AssetsLoader;
  if (instance != null) return instance;

  final _type_id_handle = _sdk_core_engine_AssetsLoader_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_core_engine_AssetsLoader_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : AssetsLoader$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_core_engine_AssetsLoader_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_core_engine_AssetsLoader_release_handle(handle);

Pointer<Void> sdk_core_engine_AssetsLoader_toFfi_nullable(AssetsLoader value) =>
  value != null ? sdk_core_engine_AssetsLoader_toFfi(value) : Pointer<Void>.fromAddress(0);

AssetsLoader sdk_core_engine_AssetsLoader_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_core_engine_AssetsLoader_fromFfi(handle) : null;

void sdk_core_engine_AssetsLoader_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_engine_AssetsLoader_release_handle(handle);

// End of AssetsLoader "private" section.

