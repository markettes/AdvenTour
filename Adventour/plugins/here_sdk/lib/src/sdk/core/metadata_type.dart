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


import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Different types of objects that can be stored in a Metadata class instance.
enum MetadataType {
    /// CustomMetadataValue based object.
    custom,
    /// Double sized floating point value.
    double,
    /// GeoCoordinates object.
    geoCoordinates,
    /// Integer.
    integer,
    /// String object.
    string
}

// MetadataType "private" section, not exported.

int sdk_core_MetadataType_toFfi(MetadataType value) {
  switch (value) {
  case MetadataType.custom:
    return 0;
  break;
  case MetadataType.double:
    return 1;
  break;
  case MetadataType.geoCoordinates:
    return 2;
  break;
  case MetadataType.integer:
    return 3;
  break;
  case MetadataType.string:
    return 4;
  break;
  default:
    throw StateError("Invalid enum value $value for MetadataType enum.");
  }
}

MetadataType sdk_core_MetadataType_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return MetadataType.custom;
  break;
  case 1:
    return MetadataType.double;
  break;
  case 2:
    return MetadataType.geoCoordinates;
  break;
  case 3:
    return MetadataType.integer;
  break;
  case 4:
    return MetadataType.string;
  break;
  default:
    throw StateError("Invalid numeric value $handle for MetadataType enum.");
  }
}

void sdk_core_MetadataType_releaseFfiHandle(int handle) {}

final _sdk_core_MetadataType_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_MetadataType_create_handle_nullable'));
final _sdk_core_MetadataType_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_MetadataType_release_handle_nullable'));
final _sdk_core_MetadataType_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_MetadataType_get_value_nullable'));

Pointer<Void> sdk_core_MetadataType_toFfi_nullable(MetadataType value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_MetadataType_toFfi(value);
  final result = _sdk_core_MetadataType_create_handle_nullable(_handle);
  sdk_core_MetadataType_releaseFfiHandle(_handle);
  return result;
}

MetadataType sdk_core_MetadataType_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_MetadataType_get_value_nullable(handle);
  final result = sdk_core_MetadataType_fromFfi(_handle);
  sdk_core_MetadataType_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_MetadataType_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_MetadataType_release_handle_nullable(handle);

// End of MetadataType "private" section.

