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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/search/address.dart';
import 'package:here_sdk/src/sdk/search/details.dart';
import 'package:here_sdk/src/sdk/search/place_type.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents a location object, such as a country, a city, a point of interest (POI) etc.
abstract class Place {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();



  /// Gets the localized title for the resource.
  String get title;





  /// Gets the unique id of this resource.
  String get id;





  /// Gets the place type.
  PlaceType get type;





  /// Gets the address of the place.
  Address get address;





  /// Gets the place's detailed information.
  Details get details;





  /// Gets the geographic coordinates of the place.
  GeoCoordinates get geoCoordinates;





  /// Gets the access points to the place.
  List<GeoCoordinates> get accessPoints;





  /// Gets the geographic coordinates of the place.
  @Deprecated("Will be removed in v4.7.0. [Place.geoCoordinates] should be used instead.")
  GeoCoordinates get coordinates;





  /// Gets the geographic coordinates of the bounding box containing the place.
  GeoBox get boundingBox;





  /// Gets the distance from the search center to the place in meters.
  int get distanceInMeters;



}


// Place "private" section, not exported.

final _sdk_search_Place_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Place_copy_handle'));
final _sdk_search_Place_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Place_release_handle'));
final _sdk_search_Place_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_search_Place_get_raw_pointer'));

class Place$Impl implements Place {
  @protected
  Pointer<Void> handle;

  Place$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_search_Place_get_raw_pointer(handle));
    _sdk_search_Place_release_handle(handle);
    handle = null;
  }

  @override
  String get title {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_title_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }


  @override
  String get id {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_id_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }


  @override
  PlaceType get type {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_type_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_search_PlaceType_fromFfi(__result_handle);
    } finally {
      sdk_search_PlaceType_releaseFfiHandle(__result_handle);
    }
  }


  @override
  Address get address {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_address_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_search_Address_fromFfi(__result_handle);
    } finally {
      sdk_search_Address_releaseFfiHandle(__result_handle);
    }
  }


  @override
  Details get details {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_details_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_search_Details_fromFfi(__result_handle);
    } finally {
      sdk_search_Details_releaseFfiHandle(__result_handle);
    }
  }


  @override
  GeoCoordinates get geoCoordinates {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_geoCoordinates_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_core_GeoCoordinates_fromFfi_nullable(__result_handle);
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle_nullable(__result_handle);
    }
  }


  @override
  List<GeoCoordinates> get accessPoints {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_accessPoints_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(__result_handle);
    } finally {
      heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(__result_handle);
    }
  }


  @override
  GeoCoordinates get coordinates {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_coordinates_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_core_GeoCoordinates_fromFfi(__result_handle);
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle(__result_handle);
    }
  }


  @override
  GeoBox get boundingBox {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_boundingBox_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_core_GeoBox_fromFfi_nullable(__result_handle);
    } finally {
      sdk_core_GeoBox_releaseFfiHandle_nullable(__result_handle);
    }
  }


  @override
  int get distanceInMeters {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_distanceInMeters_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Int_fromFfi_nullable(__result_handle);
    } finally {
      Int_releaseFfiHandle_nullable(__result_handle);
    }
  }



}

Pointer<Void> sdk_search_Place_toFfi(Place value) =>
  _sdk_search_Place_copy_handle((value as Place$Impl).handle);

Place sdk_search_Place_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_search_Place_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as Place;
  if (instance != null) return instance;

  final _copied_handle = _sdk_search_Place_copy_handle(handle);
  final result = Place$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_search_Place_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_search_Place_release_handle(handle);

Pointer<Void> sdk_search_Place_toFfi_nullable(Place value) =>
  value != null ? sdk_search_Place_toFfi(value) : Pointer<Void>.fromAddress(0);

Place sdk_search_Place_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_search_Place_fromFfi(handle) : null;

void sdk_search_Place_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_Place_release_handle(handle);

// End of Place "private" section.

