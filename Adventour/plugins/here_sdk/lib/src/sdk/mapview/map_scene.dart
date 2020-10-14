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
import 'package:here_sdk/src/sdk/mapview/harp_map_view.dart';
import 'package:here_sdk/src/sdk/mapview/map_error.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker3_d.dart';
import 'package:here_sdk/src/sdk/mapview/map_polygon.dart';
import 'package:here_sdk/src/sdk/mapview/map_polyline.dart';
import 'package:here_sdk/src/sdk/mapview/map_scene_ready_listener.dart';
import 'package:here_sdk/src/sdk/mapview/map_scheme.dart';
import 'package:here_sdk/src/sdk/mapview/map_scheme_change_listener.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents a map scene and exposes the functionality to manipulate its content.
///
/// Map scene is obtained from the `HereMapController.mapScene` property.
///
/// ## Map schemes
///
/// The content of the displayed map and how it looks is specified by a
/// [MapScheme] which is set when loading a scene with [loadSceneFromConfigurationFile].
/// It is also possible to load your own custom map scheme from a file bundled
/// with your application.
///
/// ## Map schemes
///
/// Map scheme is organized in layers, which can be controlled using [setLayerState].
/// It's possible to change the state of any map layer as long as you know its name,
/// but [MapSceneLayers] provides a set of constants for most frequently used layers. Some of those
/// layers are not supported on all map schemes. Such limitations are stated in their documentation.
///
/// ## User content
///
/// User generated content can be visualised on the map using [MapMarker], [MapPolygon]
/// and [MapPolyline] (collectively referred to as "map items"). Those can be added to and removed
/// from the scene by respective add and remove methods.
abstract class MapScene {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Asynchronously loads a map scene described by a specified map scheme.
  ///
  /// Any previous map scene config will be replaced. The callback is called on the main thread.
  /// Calling this again before completion may result in a [MapError].
  /// [mapScheme] Map scheme.
  /// [callback] Optional callback that will receive the result of this operation.
  loadSceneForMapScheme(MapScheme mapScheme, MapSceneLoadSceneCallback callback);
  /// Asynchronously loads a map scene described by a specified json file.
  ///
  /// Any previous map scene config will be replaced. The callback is called on the main thread.
  /// Calling this again before completion may result in a [MapError].
  /// [configurationFile] Map scheme configuration file. It must contain the whole scene configuration.
  /// In case it contains references to other files, they have to be reachable under
  /// the paths specified in the main configuration file.
  /// [callback] Optional callback that will receive the result of this operation.
  loadSceneFromConfigurationFile(String configurationFile, MapSceneLoadSceneCallback callback);
  /// Adds a map polyline to this map scene.
  /// [mapPolyline] The map polyline to be added to this map scene.
  addMapPolyline(MapPolyline mapPolyline);
  /// Removes a map polyline from this map scene.
  /// [mapPolyline] The map polyline to be removed from this map scene.
  removeMapPolyline(MapPolyline mapPolyline);
  /// Adds a map marker to this map scene.
  ///
  /// Adding the same marker instance multiple times
  /// has no effect.
  /// [marker] The marker to be added to this map scene.
  addMapMarker(MapMarker marker);
  /// Removes a map marker from this map scene.
  ///
  /// Removing a marker instance that is not on this
  /// scene has no effect.
  /// [marker] The marker to be removed from this map scene.
  removeMapMarker(MapMarker marker);
  /// Adds a 3D map marker to this map scene.
  ///
  /// Does nothing if the marker instance was already added to the scene.
  /// [marker] The marker to be added to this map scene.
  addMapMarker3d(MapMarker3D marker);
  /// Removes a 3D map marker from this map scene.
  ///
  /// Removing a marker instance that is not on this
  /// scene has no effect.
  /// [marker] The marker to be removed from this map scene.
  removeMapMarker3d(MapMarker3D marker);
  /// Adds a map polygon to this map scene.
  /// [mapPolygon] The map polygon to be added to this map scene.
  addMapPolygon(MapPolygon mapPolygon);
  /// Removes a map polygon from this map scene.
  /// [mapPolygon] The map polygon to be removed from this map scene.
  removeMapPolygon(MapPolygon mapPolygon);
  /// Immediately changes the state of a specified map layer.
  ///
  /// This will show or hide it.
  /// [layerName] The name of the map layer to be changed.
  /// Use constants in Layers to reference the predefined layers.
  /// [newState] The new state of the layer.
  setLayerState(String layerName, MapSceneLayerState newState);
  /// Sets a listener to be notified about map scheme changes.
  /// @nodoc
  internalsetMapSchemeChangeListener(MapSchemeChangeListener listener);
  /// Set a listener to be notified when map scene is ready
  /// @nodoc
  internalsetMapSceneReadyListener(MapSceneReadyListener listener);
  /// Releases all internally used resources.
  ///
  /// The instance can't be used anymore after calling
  /// this method.
  /// @nodoc
  internaldestroy();

  /// @nodoc
  internalsetHarpMapView(HarpMapView mapview);


  /// @nodoc
  bool get internalisSceneLoaded;



}

/// Represents the state and thus the visibility of a map layer.
enum MapSceneLayerState {
    /// The layer is visible.
    visible,
    /// The layer is hidden. Downloading the data is usually stopped for hidden layers.
    hidden
}

// MapSceneLayerState "private" section, not exported.

int sdk_mapview_MapScene_LayerState_toFfi(MapSceneLayerState value) {
  switch (value) {
  case MapSceneLayerState.visible:
    return 0;
  break;
  case MapSceneLayerState.hidden:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for MapSceneLayerState enum.");
  }
}

MapSceneLayerState sdk_mapview_MapScene_LayerState_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return MapSceneLayerState.visible;
  break;
  case 1:
    return MapSceneLayerState.hidden;
  break;
  default:
    throw StateError("Invalid numeric value $handle for MapSceneLayerState enum.");
  }
}

void sdk_mapview_MapScene_LayerState_releaseFfiHandle(int handle) {}

final _sdk_mapview_MapScene_LayerState_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapScene_LayerState_create_handle_nullable'));
final _sdk_mapview_MapScene_LayerState_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LayerState_release_handle_nullable'));
final _sdk_mapview_MapScene_LayerState_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LayerState_get_value_nullable'));

Pointer<Void> sdk_mapview_MapScene_LayerState_toFfi_nullable(MapSceneLayerState value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_MapScene_LayerState_toFfi(value);
  final result = _sdk_mapview_MapScene_LayerState_create_handle_nullable(_handle);
  sdk_mapview_MapScene_LayerState_releaseFfiHandle(_handle);
  return result;
}

MapSceneLayerState sdk_mapview_MapScene_LayerState_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_MapScene_LayerState_get_value_nullable(handle);
  final result = sdk_mapview_MapScene_LayerState_fromFfi(_handle);
  sdk_mapview_MapScene_LayerState_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_MapScene_LayerState_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapScene_LayerState_release_handle_nullable(handle);

// End of MapSceneLayerState "private" section.
/// A collection of map layer identifiers used in the [setLayerState] method.

class MapSceneLayers {


  /// 3D representation of buildings. Not supported for [MapScheme.satellite].
  static final String extrudedBuildings = "heresdk_layer_extruded_buildings";

  /// The 2D footprint of buildings. Not supported for [MapScheme.satellite].
  static final String buildingFootprints = "heresdk_layer_building_footprints";

  /// Traffic flow speed. Not supported for [MapScheme.satellite].
  static final String trafficFlow = "heresdk_layer_traffic_flow";

  /// Traffic incidents. Not supported for [MapScheme.satellite].
  static final String trafficIncidents = "heresdk_layer_traffic_incidents";

}


// MapSceneLayers "private" section, not exported.

final _sdk_mapview_MapScene_Layers_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_sdk_mapview_MapScene_Layers_create_handle'));
final _sdk_mapview_MapScene_Layers_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_Layers_release_handle'));

Pointer<Void> sdk_mapview_MapScene_Layers_toFfi(MapSceneLayers value) {
  final _result = _sdk_mapview_MapScene_Layers_create_handle();
  return _result;
}

MapSceneLayers sdk_mapview_MapScene_Layers_fromFfi(Pointer<Void> handle) {
  try {
    return MapSceneLayers();
  } finally {
  }
}

void sdk_mapview_MapScene_Layers_releaseFfiHandle(Pointer<Void> handle) => _sdk_mapview_MapScene_Layers_release_handle(handle);

// Nullable MapSceneLayers

final _sdk_mapview_MapScene_Layers_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_Layers_create_handle_nullable'));
final _sdk_mapview_MapScene_Layers_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_Layers_release_handle_nullable'));
final _sdk_mapview_MapScene_Layers_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_Layers_get_value_nullable'));

Pointer<Void> sdk_mapview_MapScene_Layers_toFfi_nullable(MapSceneLayers value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_MapScene_Layers_toFfi(value);
  final result = _sdk_mapview_MapScene_Layers_create_handle_nullable(_handle);
  sdk_mapview_MapScene_Layers_releaseFfiHandle(_handle);
  return result;
}

MapSceneLayers sdk_mapview_MapScene_Layers_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_MapScene_Layers_get_value_nullable(handle);
  final result = sdk_mapview_MapScene_Layers_fromFfi(_handle);
  sdk_mapview_MapScene_Layers_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_MapScene_Layers_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapScene_Layers_release_handle_nullable(handle);

// End of MapSceneLayers "private" section.
/// Called on the main thread after [loadSceneFromConfigurationFile] has been completed.
typedef MapSceneLoadSceneCallback = void Function(MapError);

// MapSceneLoadSceneCallback "private" section, not exported.

final _sdk_mapview_MapScene_LoadSceneCallback_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_copy_handle'));
final _sdk_mapview_MapScene_LoadSceneCallback_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_release_handle'));
final _sdk_mapview_MapScene_LoadSceneCallback_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_create_proxy'));
final _sdk_mapview_MapScene_LoadSceneCallback_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_get_raw_pointer'));

class MapSceneLoadSceneCallback$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  MapSceneLoadSceneCallback$Impl(this.handle);

  void release() => _sdk_mapview_MapScene_LoadSceneCallback_release_handle(handle);

  call(MapError p0) {
    final _call_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_call__MapError'));
    final _p0_handle = sdk_mapview_MapError_toFfi_nullable(p0);
    final _handle = this.handle;
    final __result_handle = _call_ffi(_handle, __lib.LibraryContext.isolateId, _p0_handle);
    sdk_mapview_MapError_releaseFfiHandle_nullable(_p0_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

}

int _MapSceneLoadSceneCallback_call_static(int _token, Pointer<Void> p0) {
  
  try {
    (__lib.instanceCache[_token] as MapSceneLoadSceneCallback)(sdk_mapview_MapError_fromFfi_nullable(p0));
  } finally {
    sdk_mapview_MapError_releaseFfiHandle_nullable(p0);
  }
  return 0;
}

Pointer<Void> sdk_mapview_MapScene_LoadSceneCallback_toFfi(MapSceneLoadSceneCallback value) {
  final result = _sdk_mapview_MapScene_LoadSceneCallback_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_MapSceneLoadSceneCallback_call_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_mapview_MapScene_LoadSceneCallback_get_raw_pointer(result)] = value;

  return result;
}

MapSceneLoadSceneCallback sdk_mapview_MapScene_LoadSceneCallback_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_sdk_mapview_MapScene_LoadSceneCallback_get_raw_pointer(handle)] as MapSceneLoadSceneCallback;
  if (instance != null) return instance;
  final _impl = MapSceneLoadSceneCallback$Impl(_sdk_mapview_MapScene_LoadSceneCallback_copy_handle(handle));
  return (MapError p0) {
    final _result =_impl.call(p0);
    _impl.release();
    return _result;
  };
}

void sdk_mapview_MapScene_LoadSceneCallback_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapScene_LoadSceneCallback_release_handle(handle);

// Nullable MapSceneLoadSceneCallback

final _sdk_mapview_MapScene_LoadSceneCallback_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_create_handle_nullable'));
final _sdk_mapview_MapScene_LoadSceneCallback_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_release_handle_nullable'));
final _sdk_mapview_MapScene_LoadSceneCallback_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_LoadSceneCallback_get_value_nullable'));

Pointer<Void> sdk_mapview_MapScene_LoadSceneCallback_toFfi_nullable(MapSceneLoadSceneCallback value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_MapScene_LoadSceneCallback_toFfi(value);
  final result = _sdk_mapview_MapScene_LoadSceneCallback_create_handle_nullable(_handle);
  sdk_mapview_MapScene_LoadSceneCallback_releaseFfiHandle(_handle);
  return result;
}

MapSceneLoadSceneCallback sdk_mapview_MapScene_LoadSceneCallback_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_MapScene_LoadSceneCallback_get_value_nullable(handle);
  final result = sdk_mapview_MapScene_LoadSceneCallback_fromFfi(_handle);
  sdk_mapview_MapScene_LoadSceneCallback_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_MapScene_LoadSceneCallback_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapScene_LoadSceneCallback_release_handle_nullable(handle);

// End of MapSceneLoadSceneCallback "private" section.

// MapScene "private" section, not exported.

final _sdk_mapview_MapScene_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_copy_handle'));
final _sdk_mapview_MapScene_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapScene_release_handle'));
final _sdk_mapview_MapScene_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapScene_get_raw_pointer'));
















class MapScene$Impl implements MapScene {
  @protected
  Pointer<Void> handle;

  MapScene$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_MapScene_get_raw_pointer(handle));
    _sdk_mapview_MapScene_release_handle(handle);
    handle = null;
  }

  @override
  loadSceneForMapScheme(MapScheme mapScheme, MapSceneLoadSceneCallback callback) {
    final _loadSceneForMapScheme_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Pointer<Void>), void Function(Pointer<Void>, int, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_loadScene__MapScheme_LoadSceneCallback'));
    final _mapScheme_handle = sdk_mapview_MapScheme_toFfi(mapScheme);
    final _callback_handle = sdk_mapview_MapScene_LoadSceneCallback_toFfi_nullable(callback);
    final _handle = this.handle;
    final __result_handle = _loadSceneForMapScheme_ffi(_handle, __lib.LibraryContext.isolateId, _mapScheme_handle, _callback_handle);
    sdk_mapview_MapScheme_releaseFfiHandle(_mapScheme_handle);
    sdk_mapview_MapScene_LoadSceneCallback_releaseFfiHandle_nullable(_callback_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  loadSceneFromConfigurationFile(String configurationFile, MapSceneLoadSceneCallback callback) {
    final _loadSceneFromConfigurationFile_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_loadScene__String_LoadSceneCallback'));
    final _configurationFile_handle = String_toFfi(configurationFile);
    final _callback_handle = sdk_mapview_MapScene_LoadSceneCallback_toFfi_nullable(callback);
    final _handle = this.handle;
    final __result_handle = _loadSceneFromConfigurationFile_ffi(_handle, __lib.LibraryContext.isolateId, _configurationFile_handle, _callback_handle);
    String_releaseFfiHandle(_configurationFile_handle);
    sdk_mapview_MapScene_LoadSceneCallback_releaseFfiHandle_nullable(_callback_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  addMapPolyline(MapPolyline mapPolyline) {
    final _addMapPolyline_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapPolyline__MapPolyline'));
    final _mapPolyline_handle = sdk_mapview_MapPolyline_toFfi(mapPolyline);
    final _handle = this.handle;
    final __result_handle = _addMapPolyline_ffi(_handle, __lib.LibraryContext.isolateId, _mapPolyline_handle);
    sdk_mapview_MapPolyline_releaseFfiHandle(_mapPolyline_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  removeMapPolyline(MapPolyline mapPolyline) {
    final _removeMapPolyline_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapPolyline__MapPolyline'));
    final _mapPolyline_handle = sdk_mapview_MapPolyline_toFfi(mapPolyline);
    final _handle = this.handle;
    final __result_handle = _removeMapPolyline_ffi(_handle, __lib.LibraryContext.isolateId, _mapPolyline_handle);
    sdk_mapview_MapPolyline_releaseFfiHandle(_mapPolyline_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  addMapMarker(MapMarker marker) {
    final _addMapMarker_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapMarker__MapMarker'));
    final _marker_handle = sdk_mapview_MapMarker_toFfi(marker);
    final _handle = this.handle;
    final __result_handle = _addMapMarker_ffi(_handle, __lib.LibraryContext.isolateId, _marker_handle);
    sdk_mapview_MapMarker_releaseFfiHandle(_marker_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  removeMapMarker(MapMarker marker) {
    final _removeMapMarker_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapMarker__MapMarker'));
    final _marker_handle = sdk_mapview_MapMarker_toFfi(marker);
    final _handle = this.handle;
    final __result_handle = _removeMapMarker_ffi(_handle, __lib.LibraryContext.isolateId, _marker_handle);
    sdk_mapview_MapMarker_releaseFfiHandle(_marker_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  addMapMarker3d(MapMarker3D marker) {
    final _addMapMarker3d_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapMarker3d__MapMarker3D'));
    final _marker_handle = sdk_mapview_MapMarker3D_toFfi(marker);
    final _handle = this.handle;
    final __result_handle = _addMapMarker3d_ffi(_handle, __lib.LibraryContext.isolateId, _marker_handle);
    sdk_mapview_MapMarker3D_releaseFfiHandle(_marker_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  removeMapMarker3d(MapMarker3D marker) {
    final _removeMapMarker3d_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapMarker3d__MapMarker3D'));
    final _marker_handle = sdk_mapview_MapMarker3D_toFfi(marker);
    final _handle = this.handle;
    final __result_handle = _removeMapMarker3d_ffi(_handle, __lib.LibraryContext.isolateId, _marker_handle);
    sdk_mapview_MapMarker3D_releaseFfiHandle(_marker_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  addMapPolygon(MapPolygon mapPolygon) {
    final _addMapPolygon_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_addMapPolygon__MapPolygon'));
    final _mapPolygon_handle = sdk_mapview_MapPolygon_toFfi(mapPolygon);
    final _handle = this.handle;
    final __result_handle = _addMapPolygon_ffi(_handle, __lib.LibraryContext.isolateId, _mapPolygon_handle);
    sdk_mapview_MapPolygon_releaseFfiHandle(_mapPolygon_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  removeMapPolygon(MapPolygon mapPolygon) {
    final _removeMapPolygon_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_removeMapPolygon__MapPolygon'));
    final _mapPolygon_handle = sdk_mapview_MapPolygon_toFfi(mapPolygon);
    final _handle = this.handle;
    final __result_handle = _removeMapPolygon_ffi(_handle, __lib.LibraryContext.isolateId, _mapPolygon_handle);
    sdk_mapview_MapPolygon_releaseFfiHandle(_mapPolygon_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  setLayerState(String layerName, MapSceneLayerState newState) {
    final _setLayerState_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint32), void Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapScene_setLayerState__String_LayerState'));
    final _layerName_handle = String_toFfi(layerName);
    final _newState_handle = sdk_mapview_MapScene_LayerState_toFfi(newState);
    final _handle = this.handle;
    final __result_handle = _setLayerState_ffi(_handle, __lib.LibraryContext.isolateId, _layerName_handle, _newState_handle);
    String_releaseFfiHandle(_layerName_handle);
    sdk_mapview_MapScene_LayerState_releaseFfiHandle(_newState_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internalsetMapSchemeChangeListener(MapSchemeChangeListener listener) {
    final _setMapSchemeChangeListener_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_setMapSchemeChangeListener__MapSchemeChangeListener'));
    final _listener_handle = sdk_mapview_MapSchemeChangeListener_toFfi_nullable(listener);
    final _handle = this.handle;
    final __result_handle = _setMapSchemeChangeListener_ffi(_handle, __lib.LibraryContext.isolateId, _listener_handle);
    sdk_mapview_MapSchemeChangeListener_releaseFfiHandle_nullable(_listener_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internalsetMapSceneReadyListener(MapSceneReadyListener listener) {
    final _setMapSceneReadyListener_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_setMapSceneReadyListener__MapSceneReadyListener'));
    final _listener_handle = sdk_mapview_MapSceneReadyListener_toFfi_nullable(listener);
    final _handle = this.handle;
    final __result_handle = _setMapSceneReadyListener_ffi(_handle, __lib.LibraryContext.isolateId, _listener_handle);
    sdk_mapview_MapSceneReadyListener_releaseFfiHandle_nullable(_listener_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internaldestroy() {
    final _destroy_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapScene_destroy'));
    final _handle = this.handle;
    final __result_handle = _destroy_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internalsetHarpMapView(HarpMapView mapview) {
    final _setHarpMapView_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapScene_setHarpMapView__HarpMapView'));
    final _mapview_handle = sdk_mapview_HarpMapView_toFfi(mapview);
    final _handle = this.handle;
    final __result_handle = _setHarpMapView_ffi(_handle, __lib.LibraryContext.isolateId, _mapview_handle);
    sdk_mapview_HarpMapView_releaseFfiHandle(_mapview_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  bool get internalisSceneLoaded {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapScene_isSceneLoaded_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }



}

Pointer<Void> sdk_mapview_MapScene_toFfi(MapScene value) =>
  _sdk_mapview_MapScene_copy_handle((value as MapScene$Impl).handle);

MapScene sdk_mapview_MapScene_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_MapScene_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as MapScene;
  if (instance != null) return instance;

  final _copied_handle = _sdk_mapview_MapScene_copy_handle(handle);
  final result = MapScene$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_MapScene_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapScene_release_handle(handle);

Pointer<Void> sdk_mapview_MapScene_toFfi_nullable(MapScene value) =>
  value != null ? sdk_mapview_MapScene_toFfi(value) : Pointer<Void>.fromAddress(0);

MapScene sdk_mapview_MapScene_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapScene_fromFfi(handle) : null;

void sdk_mapview_MapScene_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapScene_release_handle(handle);

// End of MapScene "private" section.

