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
import 'package:here_sdk/src/sdk/core/language_code.dart';
import 'package:here_sdk/src/sdk/routing/link.dart';
import 'package:here_sdk/src/sdk/routing/maneuver.dart';
import 'package:here_sdk/src/sdk/routing/optimization_mode.dart';
import 'package:here_sdk/src/sdk/routing/section.dart';
import 'package:here_sdk/src/sdk/routing/transport_mode.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// A route is a path through a road network over which someone travels.
abstract class Route {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();



  /// Gets the sections that make up this route.
  List<Section> get sections;





  /// Gets the geographic coordinates that make up the polyline of this route. These may not be the same as the original
  /// coordinates specified in the request for a route.
  List<GeoCoordinates> get polyline;





  /// Gets the closest rectangular area where this route fits in.
  GeoBox get boundingBox;





  /// Gets the length of this route in meters.
  int get lengthInMeters;





  /// Gets the estimated time in seconds needed to travel along this route, including
  /// real-time traffic delays if available.
  int get durationInSeconds;





  /// Gets the estimated time in seconds spent in traffic along this route. Negative values
  /// indicate that the route can be traversed faster than usual.
  int get trafficDelayInSeconds;





  /// Gets the language requested for all textual information related to this route.
  LanguageCode get language;





  /// Gets the optimization mode requested for route calculation.
  OptimizationMode get optimizationMode;





  /// Gets the transport mode requested for route calculation.
  TransportMode get transportMode;





  /// @nodoc
  List<Link> get internallinks;





  /// @nodoc
  List<Maneuver> get internalmaneuvers;





  /// @nodoc
  int get internalsectionCount;





  /// Gets estimated net energy consumption along this route in kWh for electric vehicles.
  /// Note that it can be negative due to energy recuperation.
  /// @nodoc
  double get internalconsumptionInKilowattHours;



}


// Route "private" section, not exported.

final _sdk_routing_Route_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Route_copy_handle'));
final _sdk_routing_Route_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Route_release_handle'));
final _sdk_routing_Route_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_routing_Route_get_raw_pointer'));

class Route$Impl implements Route {
  @protected
  Pointer<Void> handle;

  Route$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_routing_Route_get_raw_pointer(handle));
    _sdk_routing_Route_release_handle(handle);
    handle = null;
  }


  List<Section> _cache_sections;
  bool _is_cached_sections = false;
  @override

  List<Section> get sections {
    if (!_is_cached_sections) {
      final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_sections_get'));
      final __result_handle = _get_ffi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _cache_sections = heresdk_routing_common_bindings_ListOf_sdk_routing_Section_fromFfi(__result_handle);
      } finally {
        heresdk_routing_common_bindings_ListOf_sdk_routing_Section_releaseFfiHandle(__result_handle);
      }
      _is_cached_sections = true;
    }
    return _cache_sections;
  }


  List<GeoCoordinates> _cache_polyline;
  bool _is_cached_polyline = false;
  @override

  List<GeoCoordinates> get polyline {
    if (!_is_cached_polyline) {
      final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_polyline_get'));
      final __result_handle = _get_ffi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _cache_polyline = heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(__result_handle);
      } finally {
        heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(__result_handle);
      }
      _is_cached_polyline = true;
    }
    return _cache_polyline;
  }

  @override
  GeoBox get boundingBox {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_boundingBox_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_core_GeoBox_fromFfi(__result_handle);
    } finally {
      sdk_core_GeoBox_releaseFfiHandle(__result_handle);
    }
  }


  @override
  int get lengthInMeters {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_lengthInMeters_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  int get durationInSeconds {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_durationInSeconds_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  int get trafficDelayInSeconds {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_trafficDelayInSeconds_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  LanguageCode get language {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_language_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_core_LanguageCode_fromFfi(__result_handle);
    } finally {
      sdk_core_LanguageCode_releaseFfiHandle(__result_handle);
    }
  }


  @override
  OptimizationMode get optimizationMode {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_optimizationMode_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_routing_OptimizationMode_fromFfi(__result_handle);
    } finally {
      sdk_routing_OptimizationMode_releaseFfiHandle(__result_handle);
    }
  }


  @override
  TransportMode get transportMode {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_transportMode_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_routing_TransportMode_fromFfi(__result_handle);
    } finally {
      sdk_routing_TransportMode_releaseFfiHandle(__result_handle);
    }
  }



  List<Link> _cache_links;
  bool _is_cached_links = false;
  @override

  List<Link> get internallinks {
    if (!_is_cached_links) {
      final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_links_get'));
      final __result_handle = _get_ffi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _cache_links = heresdk_routing_common_bindings_ListOf_sdk_routing_Link_fromFfi(__result_handle);
      } finally {
        heresdk_routing_common_bindings_ListOf_sdk_routing_Link_releaseFfiHandle(__result_handle);
      }
      _is_cached_links = true;
    }
    return _cache_links;
  }


  List<Maneuver> _cache_maneuvers;
  bool _is_cached_maneuvers = false;
  @override

  List<Maneuver> get internalmaneuvers {
    if (!_is_cached_maneuvers) {
      final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_maneuvers_get'));
      final __result_handle = _get_ffi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _cache_maneuvers = heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_fromFfi(__result_handle);
      } finally {
        heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_releaseFfiHandle(__result_handle);
      }
      _is_cached_maneuvers = true;
    }
    return _cache_maneuvers;
  }

  @override
  int get internalsectionCount {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_sectionCount_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


  @override
  double get internalconsumptionInKilowattHours {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_consumptionInKilowattHours_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Double_fromFfi_nullable(__result_handle);
    } finally {
      Double_releaseFfiHandle_nullable(__result_handle);
    }
  }



}

Pointer<Void> sdk_routing_Route_toFfi(Route value) =>
  _sdk_routing_Route_copy_handle((value as Route$Impl).handle);

Route sdk_routing_Route_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_routing_Route_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as Route;
  if (instance != null) return instance;

  final _copied_handle = _sdk_routing_Route_copy_handle(handle);
  final result = Route$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_routing_Route_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_routing_Route_release_handle(handle);

Pointer<Void> sdk_routing_Route_toFfi_nullable(Route value) =>
  value != null ? sdk_routing_Route_toFfi(value) : Pointer<Void>.fromAddress(0);

Route sdk_routing_Route_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_routing_Route_fromFfi(handle) : null;

void sdk_routing_Route_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_Route_release_handle(handle);

// End of Route "private" section.

