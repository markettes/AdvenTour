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

import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:here_sdk/src/builtin_types__conversion.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Version of SDK

class SDKVersion {
  /// Product variant.
  String productVariant;

  /// Version information as string.
  String versionName;

  /// Generation number.
  int versionGeneration;

  /// Major version number.
  int versionMajor;

  /// Minor version number.
  int versionMinor;

  /// Patch number.
  int versionPatch;

  /// Build number.
  int versionBuild;

  /// Version tag.
  String versionTag;


  /// Creates a new SDK version instance from the provided parameter values.

  /// [productVariant] Product variant.

  /// [versionName] Version information as string.

  /// [versionGeneration] Generation number.

  /// [versionMajor] Major version number.

  /// [versionMinor] Minor version number.

  /// [versionPatch] Patch number.

  /// [versionBuild] Build number.

  /// [versionTag] Version tag.

  SDKVersion(this.productVariant, this.versionName, this.versionGeneration, this.versionMajor, this.versionMinor, this.versionPatch, this.versionBuild, this.versionTag);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! SDKVersion) return false;
    SDKVersion _other = other;
    return productVariant == _other.productVariant &&
        versionName == _other.versionName &&
        versionGeneration == _other.versionGeneration &&
        versionMajor == _other.versionMajor &&
        versionMinor == _other.versionMinor &&
        versionPatch == _other.versionPatch &&
        versionBuild == _other.versionBuild &&
        versionTag == _other.versionTag;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + productVariant.hashCode;
    result = 31 * result + versionName.hashCode;
    result = 31 * result + versionGeneration.hashCode;
    result = 31 * result + versionMajor.hashCode;
    result = 31 * result + versionMinor.hashCode;
    result = 31 * result + versionPatch.hashCode;
    result = 31 * result + versionBuild.hashCode;
    result = 31 * result + versionTag.hashCode;
    return result;
  }
}


// SDKVersion "private" section, not exported.

final _sdk_core_engine_SDKVersion_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Int32, Int32, Int32, Int32, Int32, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, int, int, int, int, int, Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_create_handle'));
final _sdk_core_engine_SDKVersion_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_release_handle'));
final _sdk_core_engine_SDKVersion_get_field_productVariant = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_field_productVariant'));
final _sdk_core_engine_SDKVersion_get_field_versionName = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_field_versionName'));
final _sdk_core_engine_SDKVersion_get_field_versionGeneration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_field_versionGeneration'));
final _sdk_core_engine_SDKVersion_get_field_versionMajor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_field_versionMajor'));
final _sdk_core_engine_SDKVersion_get_field_versionMinor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_field_versionMinor'));
final _sdk_core_engine_SDKVersion_get_field_versionPatch = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_field_versionPatch'));
final _sdk_core_engine_SDKVersion_get_field_versionBuild = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_field_versionBuild'));
final _sdk_core_engine_SDKVersion_get_field_versionTag = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_field_versionTag'));

Pointer<Void> sdk_core_engine_SDKVersion_toFfi(SDKVersion value) {
  final _productVariant_handle = String_toFfi(value.productVariant);
  final _versionName_handle = String_toFfi(value.versionName);
  final _versionGeneration_handle = (value.versionGeneration);
  final _versionMajor_handle = (value.versionMajor);
  final _versionMinor_handle = (value.versionMinor);
  final _versionPatch_handle = (value.versionPatch);
  final _versionBuild_handle = (value.versionBuild);
  final _versionTag_handle = String_toFfi(value.versionTag);
  final _result = _sdk_core_engine_SDKVersion_create_handle(_productVariant_handle, _versionName_handle, _versionGeneration_handle, _versionMajor_handle, _versionMinor_handle, _versionPatch_handle, _versionBuild_handle, _versionTag_handle);
  String_releaseFfiHandle(_productVariant_handle);
  String_releaseFfiHandle(_versionName_handle);
  (_versionGeneration_handle);
  (_versionMajor_handle);
  (_versionMinor_handle);
  (_versionPatch_handle);
  (_versionBuild_handle);
  String_releaseFfiHandle(_versionTag_handle);
  return _result;
}

SDKVersion sdk_core_engine_SDKVersion_fromFfi(Pointer<Void> handle) {
  final _productVariant_handle = _sdk_core_engine_SDKVersion_get_field_productVariant(handle);
  final _versionName_handle = _sdk_core_engine_SDKVersion_get_field_versionName(handle);
  final _versionGeneration_handle = _sdk_core_engine_SDKVersion_get_field_versionGeneration(handle);
  final _versionMajor_handle = _sdk_core_engine_SDKVersion_get_field_versionMajor(handle);
  final _versionMinor_handle = _sdk_core_engine_SDKVersion_get_field_versionMinor(handle);
  final _versionPatch_handle = _sdk_core_engine_SDKVersion_get_field_versionPatch(handle);
  final _versionBuild_handle = _sdk_core_engine_SDKVersion_get_field_versionBuild(handle);
  final _versionTag_handle = _sdk_core_engine_SDKVersion_get_field_versionTag(handle);
  try {
    return SDKVersion(
      String_fromFfi(_productVariant_handle), 
    
      String_fromFfi(_versionName_handle), 
    
      (_versionGeneration_handle), 
    
      (_versionMajor_handle), 
    
      (_versionMinor_handle), 
    
      (_versionPatch_handle), 
    
      (_versionBuild_handle), 
    
      String_fromFfi(_versionTag_handle)
    );
  } finally {
    String_releaseFfiHandle(_productVariant_handle);
    String_releaseFfiHandle(_versionName_handle);
    (_versionGeneration_handle);
    (_versionMajor_handle);
    (_versionMinor_handle);
    (_versionPatch_handle);
    (_versionBuild_handle);
    String_releaseFfiHandle(_versionTag_handle);
  }
}

void sdk_core_engine_SDKVersion_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_engine_SDKVersion_release_handle(handle);

// Nullable SDKVersion

final _sdk_core_engine_SDKVersion_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_create_handle_nullable'));
final _sdk_core_engine_SDKVersion_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_release_handle_nullable'));
final _sdk_core_engine_SDKVersion_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKVersion_get_value_nullable'));

Pointer<Void> sdk_core_engine_SDKVersion_toFfi_nullable(SDKVersion value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_engine_SDKVersion_toFfi(value);
  final result = _sdk_core_engine_SDKVersion_create_handle_nullable(_handle);
  sdk_core_engine_SDKVersion_releaseFfiHandle(_handle);
  return result;
}

SDKVersion sdk_core_engine_SDKVersion_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_engine_SDKVersion_get_value_nullable(handle);
  final result = sdk_core_engine_SDKVersion_fromFfi(_handle);
  sdk_core_engine_SDKVersion_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_engine_SDKVersion_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_engine_SDKVersion_release_handle_nullable(handle);

// End of SDKVersion "private" section.

