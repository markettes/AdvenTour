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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker.dart';
import 'package:here_sdk/src/sdk/mapview/map_polyline.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Carries results from the picking of map items on the map scene.
abstract class PickMapItemsResult {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();



  /// Gets list of markers at the location of picking.
  List<MapMarker> get markers;





  /// Gets list of polylines at the location of picking.
  List<MapPolyline> get polylines;



}


// PickMapItemsResult "private" section, not exported.

final _sdk_mapview_PickMapItemsResult_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapItemsResult_copy_handle'));
final _sdk_mapview_PickMapItemsResult_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapItemsResult_release_handle'));
final _sdk_mapview_PickMapItemsResult_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_PickMapItemsResult_get_raw_pointer'));

class PickMapItemsResult$Impl implements PickMapItemsResult {
  @protected
  Pointer<Void> handle;

  PickMapItemsResult$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_PickMapItemsResult_get_raw_pointer(handle));
    _sdk_mapview_PickMapItemsResult_release_handle(handle);
    handle = null;
  }

  @override
  List<MapMarker> get markers {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapItemsResult_markers_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_fromFfi(__result_handle);
    } finally {
      heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_releaseFfiHandle(__result_handle);
    }
  }


  @override
  List<MapPolyline> get polylines {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapItemsResult_polylines_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_fromFfi(__result_handle);
    } finally {
      heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_releaseFfiHandle(__result_handle);
    }
  }



}

Pointer<Void> sdk_mapview_PickMapItemsResult_toFfi(PickMapItemsResult value) =>
  _sdk_mapview_PickMapItemsResult_copy_handle((value as PickMapItemsResult$Impl).handle);

PickMapItemsResult sdk_mapview_PickMapItemsResult_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_PickMapItemsResult_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as PickMapItemsResult;
  if (instance != null) return instance;

  final _copied_handle = _sdk_mapview_PickMapItemsResult_copy_handle(handle);
  final result = PickMapItemsResult$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_PickMapItemsResult_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_PickMapItemsResult_release_handle(handle);

Pointer<Void> sdk_mapview_PickMapItemsResult_toFfi_nullable(PickMapItemsResult value) =>
  value != null ? sdk_mapview_PickMapItemsResult_toFfi(value) : Pointer<Void>.fromAddress(0);

PickMapItemsResult sdk_mapview_PickMapItemsResult_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_PickMapItemsResult_fromFfi(handle) : null;

void sdk_mapview_PickMapItemsResult_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_PickMapItemsResult_release_handle(handle);

// End of PickMapItemsResult "private" section.

