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

/// Specifies place type of Place result from a search query.
enum PlaceType {
    /// Describes either a building, floor level or a suite.
    unit,
    /// House number.
    houseNumber,
    /// House number with coordinates interpolated from the address range.
    houseNumberInterpolated,
    /// Concerns addresses in Japan (Except Kyoto). It is a further subdivision under locality level,
    /// for example block and subblock to represent aza and chiban.
    addressBlock,
    /// Street name.
    street,
    /// Typically a municipality or a district.
    locality,
    /// Adminstrative area, for example a county, state/province.
    administrativeArea,
    /// Point of interest, for example a shop, restaurant, museum.
    poi
}

// PlaceType "private" section, not exported.

int sdk_search_PlaceType_toFfi(PlaceType value) {
  switch (value) {
  case PlaceType.unit:
    return 0;
  break;
  case PlaceType.houseNumber:
    return 1;
  break;
  case PlaceType.houseNumberInterpolated:
    return 2;
  break;
  case PlaceType.addressBlock:
    return 3;
  break;
  case PlaceType.street:
    return 4;
  break;
  case PlaceType.locality:
    return 5;
  break;
  case PlaceType.administrativeArea:
    return 6;
  break;
  case PlaceType.poi:
    return 7;
  break;
  default:
    throw StateError("Invalid enum value $value for PlaceType enum.");
  }
}

PlaceType sdk_search_PlaceType_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return PlaceType.unit;
  break;
  case 1:
    return PlaceType.houseNumber;
  break;
  case 2:
    return PlaceType.houseNumberInterpolated;
  break;
  case 3:
    return PlaceType.addressBlock;
  break;
  case 4:
    return PlaceType.street;
  break;
  case 5:
    return PlaceType.locality;
  break;
  case 6:
    return PlaceType.administrativeArea;
  break;
  case 7:
    return PlaceType.poi;
  break;
  default:
    throw StateError("Invalid numeric value $handle for PlaceType enum.");
  }
}

void sdk_search_PlaceType_releaseFfiHandle(int handle) {}

final _sdk_search_PlaceType_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_search_PlaceType_create_handle_nullable'));
final _sdk_search_PlaceType_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceType_release_handle_nullable'));
final _sdk_search_PlaceType_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceType_get_value_nullable'));

Pointer<Void> sdk_search_PlaceType_toFfi_nullable(PlaceType value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_PlaceType_toFfi(value);
  final result = _sdk_search_PlaceType_create_handle_nullable(_handle);
  sdk_search_PlaceType_releaseFfiHandle(_handle);
  return result;
}

PlaceType sdk_search_PlaceType_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_PlaceType_get_value_nullable(handle);
  final result = sdk_search_PlaceType_fromFfi(_handle);
  sdk_search_PlaceType_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_PlaceType_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_PlaceType_release_handle_nullable(handle);

// End of PlaceType "private" section.

