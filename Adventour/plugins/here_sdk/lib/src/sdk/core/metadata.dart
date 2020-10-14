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
import 'package:here_sdk/src/sdk/core/custom_metadata_value.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/metadata_type.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Holds metadata on behalf of a map item.
///
/// An instance of this class can contain metadata items of varying types, such as
/// String, Integer, Double, GeoCoordinates etc. and can also hold arbitrary metadata
/// types by the use of the CustomMetadataValue abstract class.
abstract class Metadata {
  /// Creates an instance of this class.
  factory Metadata() => Metadata$Impl.make();

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Obtains an instance of the CustomMetadataValue class associated with a given key.
  /// [key] The name of the key for which to obtain the value.
  /// Returns [CustomMetadataValue]. The value associated with the key.
  CustomMetadataValue getCustomValue(String key);
  /// Obtains a Double value associated with a given key.
  /// [key] The name of the key for which to obtain the value.
  /// Returns [double]. The value associated with the key.
  double getDouble(String key);
  /// Obtains a GeoCoordinates value associated with a given key.
  /// [key] The name of the key for which to obtain the value.
  /// Returns [GeoCoordinates]. The value associated with the key.
  /// @nodoc
  GeoCoordinates internalgetGeoCoordinates(String key);
  /// Obtains an Integer value associated with a given key.
  /// [key] The name of the key for which to obtain the value.
  /// Returns [int]. The value associated with the key.
  int getInteger(String key);
  /// Obtains a String value associated with a given key.
  /// [key] The name of the key for which to obtain the value.
  /// Returns [String]. The value associated with the key.
  String getString(String key);
  /// Determines the type of a metadata value.
  ///
  /// If the type of a metadata value associated with a key is not known, this
  /// method will enable the type to be queried, in order to know which get method
  /// to call. i.e. getDouble(), getInteger() etc.
  /// [key] The name of the key for which to obtain the type.
  /// Returns [MetadataType]. An enumeration describing the type of the value associated with the key.
  MetadataType getType(String key);
  /// Removes a metadata key and its associated value.
  /// [key] The name of the key to be removed.
  removeValue(String key);
  /// Creates a key:value pair, where the value is a type derived from CustomMetadataValue.
  ///
  /// If the given key already exists, its value will be replaced by the new one.
  /// [key] The name of the key to be created or replaced.
  /// [value] The value to be assigned to the key.
  setCustomValue(String key, CustomMetadataValue value);
  /// Creates a key:value pair, where the value is of type Double.
  ///
  /// If the given key already exists, its value will be replaced by the new one.
  /// [key] The name of the key to be created or replaced.
  /// [value] The value to be assigned to the key.
  setDouble(String key, double value);
  /// Creates a key:value pair, where the value is of type GeoCoordinates.
  ///
  /// If the given key already exists, its value will be replaced by the new one.
  /// [key] The name of the key to be created or replaced.
  /// [value] The value to be assigned to the key.
  /// @nodoc
  internalsetGeoCoordinates(String key, GeoCoordinates value);
  /// Creates a key:value pair, where the value is of type Integer.
  ///
  /// If the given key already exists, its value will be replaced by the new one.
  /// [key] The name of the key to be created or replaced.
  /// [value] The value to be assigned to the key.
  setInteger(String key, int value);
  /// Creates a key:value pair, where the value is of type String.
  ///
  /// If the given key already exists, its value will be replaced by the new one.
  /// [key] The name of the key to be created or replaced.
  /// [value] The value to be assigned to the key.
  setString(String key, String value);
}


// Metadata "private" section, not exported.

final _sdk_core_Metadata_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Metadata_copy_handle'));
final _sdk_core_Metadata_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Metadata_release_handle'));
final _sdk_core_Metadata_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_core_Metadata_get_raw_pointer'));














class Metadata$Impl implements Metadata {
  @protected
  Pointer<Void> handle;

  Metadata$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_core_Metadata_get_raw_pointer(handle));
    _sdk_core_Metadata_release_handle(handle);
    handle = null;
  }


  Metadata$Impl.make() : handle = _make() {
    __lib.reverseCache[_sdk_core_Metadata_get_raw_pointer(handle)] = this;
  }

  static Pointer<Void> _make() {
    final _make_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_Metadata_make'));
    final __result_handle = _make_ffi(__lib.LibraryContext.isolateId);
    return __result_handle;
  }

  @override
  CustomMetadataValue getCustomValue(String key) {
    final _getCustomValue_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_Metadata_getCustomValue__String'));
    final _key_handle = String_toFfi(key);
    final _handle = this.handle;
    final __result_handle = _getCustomValue_ffi(_handle, __lib.LibraryContext.isolateId, _key_handle);
    String_releaseFfiHandle(_key_handle);
    try {
      return sdk_core_CustomMetadataValue_fromFfi_nullable(__result_handle);
    } finally {
      sdk_core_CustomMetadataValue_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  double getDouble(String key) {
    final _getDouble_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_Metadata_getDouble__String'));
    final _key_handle = String_toFfi(key);
    final _handle = this.handle;
    final __result_handle = _getDouble_ffi(_handle, __lib.LibraryContext.isolateId, _key_handle);
    String_releaseFfiHandle(_key_handle);
    try {
      return Double_fromFfi_nullable(__result_handle);
    } finally {
      Double_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  GeoCoordinates internalgetGeoCoordinates(String key) {
    final _getGeoCoordinates_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_Metadata_getGeoCoordinates__String'));
    final _key_handle = String_toFfi(key);
    final _handle = this.handle;
    final __result_handle = _getGeoCoordinates_ffi(_handle, __lib.LibraryContext.isolateId, _key_handle);
    String_releaseFfiHandle(_key_handle);
    try {
      return sdk_core_GeoCoordinates_fromFfi_nullable(__result_handle);
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  int getInteger(String key) {
    final _getInteger_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_Metadata_getInteger__String'));
    final _key_handle = String_toFfi(key);
    final _handle = this.handle;
    final __result_handle = _getInteger_ffi(_handle, __lib.LibraryContext.isolateId, _key_handle);
    String_releaseFfiHandle(_key_handle);
    try {
      return Int_fromFfi_nullable(__result_handle);
    } finally {
      Int_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  String getString(String key) {
    final _getString_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_Metadata_getString__String'));
    final _key_handle = String_toFfi(key);
    final _handle = this.handle;
    final __result_handle = _getString_ffi(_handle, __lib.LibraryContext.isolateId, _key_handle);
    String_releaseFfiHandle(_key_handle);
    try {
      return String_fromFfi_nullable(__result_handle);
    } finally {
      String_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  MetadataType getType(String key) {
    final _getType_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_Metadata_getType__String'));
    final _key_handle = String_toFfi(key);
    final _handle = this.handle;
    final __result_handle = _getType_ffi(_handle, __lib.LibraryContext.isolateId, _key_handle);
    String_releaseFfiHandle(_key_handle);
    try {
      return sdk_core_MetadataType_fromFfi_nullable(__result_handle);
    } finally {
      sdk_core_MetadataType_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  removeValue(String key) {
    final _removeValue_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_Metadata_removeValue__String'));
    final _key_handle = String_toFfi(key);
    final _handle = this.handle;
    final __result_handle = _removeValue_ffi(_handle, __lib.LibraryContext.isolateId, _key_handle);
    String_releaseFfiHandle(_key_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  setCustomValue(String key, CustomMetadataValue value) {
    final _setCustomValue_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_Metadata_setCustomValue__String_CustomMetadataValue'));
    final _key_handle = String_toFfi(key);
    final _value_handle = sdk_core_CustomMetadataValue_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _setCustomValue_ffi(_handle, __lib.LibraryContext.isolateId, _key_handle, _value_handle);
    String_releaseFfiHandle(_key_handle);
    sdk_core_CustomMetadataValue_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  setDouble(String key, double value) {
    final _setDouble_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Double), void Function(Pointer<Void>, int, Pointer<Void>, double)>('here_sdk_sdk_core_Metadata_setDouble__String_Double'));
    final _key_handle = String_toFfi(key);
    final _value_handle = (value);
    final _handle = this.handle;
    final __result_handle = _setDouble_ffi(_handle, __lib.LibraryContext.isolateId, _key_handle, _value_handle);
    String_releaseFfiHandle(_key_handle);
    (_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internalsetGeoCoordinates(String key, GeoCoordinates value) {
    final _setGeoCoordinates_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_Metadata_setGeoCoordinates__String_GeoCoordinates'));
    final _key_handle = String_toFfi(key);
    final _value_handle = sdk_core_GeoCoordinates_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _setGeoCoordinates_ffi(_handle, __lib.LibraryContext.isolateId, _key_handle, _value_handle);
    String_releaseFfiHandle(_key_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  setInteger(String key, int value) {
    final _setInteger_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Int32), void Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_core_Metadata_setInteger__String_Int'));
    final _key_handle = String_toFfi(key);
    final _value_handle = (value);
    final _handle = this.handle;
    final __result_handle = _setInteger_ffi(_handle, __lib.LibraryContext.isolateId, _key_handle, _value_handle);
    String_releaseFfiHandle(_key_handle);
    (_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  setString(String key, String value) {
    final _setString_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_Metadata_setString__String_String'));
    final _key_handle = String_toFfi(key);
    final _value_handle = String_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _setString_ffi(_handle, __lib.LibraryContext.isolateId, _key_handle, _value_handle);
    String_releaseFfiHandle(_key_handle);
    String_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


}

Pointer<Void> sdk_core_Metadata_toFfi(Metadata value) =>
  _sdk_core_Metadata_copy_handle((value as Metadata$Impl).handle);

Metadata sdk_core_Metadata_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_core_Metadata_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as Metadata;
  if (instance != null) return instance;

  final _copied_handle = _sdk_core_Metadata_copy_handle(handle);
  final result = Metadata$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_core_Metadata_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_core_Metadata_release_handle(handle);

Pointer<Void> sdk_core_Metadata_toFfi_nullable(Metadata value) =>
  value != null ? sdk_core_Metadata_toFfi(value) : Pointer<Void>.fromAddress(0);

Metadata sdk_core_Metadata_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_core_Metadata_fromFfi(handle) : null;

void sdk_core_Metadata_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_Metadata_release_handle(handle);

// End of Metadata "private" section.

