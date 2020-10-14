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
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:here_sdk/src/sdk/mapview/harp_map_view.dart';
import 'package:here_sdk/src/sdk/mapview/map_camera_limits.dart';
import 'package:here_sdk/src/sdk/mapview/map_camera_observer.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents the camera looking onto the map.
///
/// Each MapView instance has exactly one camera that is used to manipulate
/// the way the map is displayed.
///
/// Any method that modifies the state of the camera will be enqueued and the state
/// will only be updated after drawing the next frame.
abstract class MapCamera {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Adds an observer to this camera that will be notified on the main thread
  /// every time the map is redrawn with new camera parameters.
  ///
  /// Adding the same observer multiple times has no effect.
  /// [observer] The observer to add.
  addObserver(MapCameraObserver observer);
  /// Removes the observer from the camera.
  ///
  /// Trying to remove an observer that is not
  /// currently registered has no effect.
  /// [observer] The observer to remove.
  removeObserver(MapCameraObserver observer);
  /// Updates the camera's position to the new geodetic coordinates,
  /// while preserving the current orientation.
  ///
  /// This command will be enqueued and the new position will be set only
  /// after drawing the next frame.
  /// [coordinates] Geodetic coordinates of new camera position
  /// @nodoc
  internalupdateCoordinates(GeoCoordinates coordinates);
  /// Updates the camera's altitude to the new value, while preserving the
  /// current coordinates and orientation.
  ///
  /// This command will be enqueued and the new altitude will be set only
  /// after drawing the next frame.
  /// [altitude] Altitude of the new camera position
  /// @nodoc
  internalupdateAltitude(double altitude);
  /// Updates the camera's orientation, while preserving the current position.
  ///
  /// This command will be enqueued and the new orientation will be set only
  /// after drawing the next frame.
  /// [orientation] The new orientation to use for the camera
  /// @nodoc
  internalupdateOrientation(MapCameraOrientationUpdate orientation);
  /// Rotates the camera while retaining its current position around the given origin.
  ///
  /// Change to orientation is applied to the current state.
  ///
  /// This command will be enqueued and the new position will be set only
  /// after drawing the next frame.
  /// [orientationChange] The values in degrees to rotate the camera by, along each of the axes.
  /// @nodoc
  internalrotateBy(MapCameraOrientation orientationChange);
  /// Zooms in or out by a specified factor.
  ///
  /// This effectively changes the distance from the camera to the [MapCameraState.targetCoordinates]
  /// by the specified factor, which changes [MapCameraState.zoomLevel] as well.
  ///
  /// Values above 1.0 will zoom in and values below will zoom out.
  ///
  /// The relation with [MapCameraState.distanceToTargetInMeters] is inversely linear,
  /// meaning that zooming by 4 will decrease distance to target by 4 while zooming by 0.5
  /// will increase distance to target by 2.
  ///
  /// The relation with zoom level is exponential. Meaning that zooming by a factor of 4 will
  /// increase zoom level by 2 (because sqrt(4) == 2). So to zoom in by X zoom levels, the zoom
  /// factor needs to be 2^X. To zoom out by X zoom levels, zoom factor needs to be 1/(2^X).
  ///
  /// The zooming occurs around the specified origin inside the view.
  ///
  /// This command will be enqueued and new position will be set only
  /// after drawing the next frame.
  /// [factor] The zoom factor. Values above 1.0 will zoom in and values below will zoom out.
  /// [origin] Point in view coordinates around which zooming occurs
  zoomBy(double factor, Point2D origin);
  /// Zooms to the specified zoom level.
  ///
  /// The supplied value will be clamped to the range
  /// of \[0, 22\], where 0 is a view of whole globe and 22 is street level.
  ///
  /// This effectively changes the distance from the camera to the target.
  /// The zooming occurs around the current target point.
  ///
  /// This command will be enqueued and new position will be set only
  /// after drawing the next frame.
  /// [zoomLevel] The zoom level to set, clamped to the range of \[0, 22\].
  zoomTo(double zoomLevel);
  /// Makes the camera look at a new geodetic target, while
  /// preserving the current orientation and distance to the target.
  /// [target] Geodetic coordinates at which the camera will point.
  lookAtPoint(GeoCoordinates target);
  /// Makes the camera look at the geodetic target from the given distance.
  /// [target] Geodetic coordinates at which the camera will point.
  /// [distanceInMeters] Distance in meters to the target point.
  lookAtPointWithDistance(GeoCoordinates target, double distanceInMeters);
  /// Makes the camera look at the geodetic target from the given distance and orientation.
  ///
  /// The supplied orientation is the orientation of the camera looking
  /// at the target, so the resulting camera state will have the
  /// same orientation as the one supplied to this method.
  /// [target] Geodetic coordinates at which the camera will point.
  /// [orientation] Desired orientation of the camera.
  /// [distanceInMeters] Distance in meters to the target point.
  lookAtPointWithOrientationAndDistance(GeoCoordinates target, MapCameraOrientationUpdate orientation, double distanceInMeters);
  /// Makes the camera look at the specified geodetic area.
  ///
  /// The supplied orientation is the orientation of the camera looking
  /// at the target, so the resulting camera state will have the
  /// same orientation as the one supplied to this method.
  /// [target] Geodetic area at which the camera will point
  /// [orientation] Desired orientation of the camera
  lookAtAreaWithOrientation(GeoBox target, MapCameraOrientationUpdate orientation);
  /// Makes the camera look at current target from certain distance
  ///
  /// This function neither modifies target coordinates nor target orientation.
  /// [distanceInMeters] Distance in meters to the target point.
  /// Minimal distance value is clamped to 100 meters.
  setDistanceToTarget(double distanceInMeters);
  /// Changes camera orientation in relation to target.
  ///
  /// This command will be enqueued and new position will be set only
  /// after drawing the next frame.
  /// [orientation] Desired orientation of the camera.
  setTargetOrientation(MapCameraOrientationUpdate orientation);

  /// @nodoc
  internalsetHarpMapview(HarpMapView mapview);

  /// @nodoc
  internaldestroy();

  /// @nodoc
  internalsetViewSize(int width, int height);


  /// Gets state of the camera that reflects what is currently drawn inside the MapView.
  MapCameraState get state;





  /// Gets the current visible map area encompassed in a GeoBox.
  /// Note that this bounding box is always rectangular, and its sides are always
  /// parallel to the latitude and longitude. If the camera is rotated, the returned
  /// bounding box will be a circumscribed rectangle that is larger than the
  /// visible map area. Similarly, when the map is tilted (for example, if
  /// the map is tilted by 45 degrees), the visible map area represents
  /// a trapezoidal area in the world. Resulting value will then be a larger
  /// circumscribed rectangle that contains this trapezoid area.
  /// Because of this, corners of the resulting bounding box may be located
  /// outside of currently visible area.
  /// When the map area does not fully fill the viewport, `null` is returned.
  GeoBox get boundingBox;





  /// Gets a MapCameraLimits instance that controls limits for the camera settings.
  MapCameraLimits get limits;



}

/// Specifies camera parameters that can be used to update the camera's orientation in geodetic coordinate space.
///
/// All uninitialized values will be ignored when applying this update information to the camera.

class MapCameraOrientationUpdate {
  /// Bearing in degrees, from the true North in clockwise direction.
  /// Bearing axis is perpendicular to the ground.
  /// Value will remain unchanged if set to .
  double bearing;

  /// Tilt in degrees.
  /// Tilt axis is parallel to the ground.
  /// Value will remain unchanged if set to .
  double tilt;


  MapCameraOrientationUpdate(this.bearing, this.tilt);

  MapCameraOrientationUpdate.withDefaults()
    : bearing = null, tilt = null;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! MapCameraOrientationUpdate) return false;
    MapCameraOrientationUpdate _other = other;
    return bearing == _other.bearing &&
        tilt == _other.tilt;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + bearing.hashCode;
    result = 31 * result + tilt.hashCode;
    return result;
  }
}


// MapCameraOrientationUpdate "private" section, not exported.

final _sdk_mapview_MapCamera_OrientationUpdate_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_OrientationUpdate_create_handle'));
final _sdk_mapview_MapCamera_OrientationUpdate_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_OrientationUpdate_release_handle'));
final _sdk_mapview_MapCamera_OrientationUpdate_get_field_bearing = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_OrientationUpdate_get_field_bearing'));
final _sdk_mapview_MapCamera_OrientationUpdate_get_field_tilt = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_OrientationUpdate_get_field_tilt'));

Pointer<Void> sdk_mapview_MapCamera_OrientationUpdate_toFfi(MapCameraOrientationUpdate value) {
  final _bearing_handle = Double_toFfi_nullable(value.bearing);
  final _tilt_handle = Double_toFfi_nullable(value.tilt);
  final _result = _sdk_mapview_MapCamera_OrientationUpdate_create_handle(_bearing_handle, _tilt_handle);
  Double_releaseFfiHandle_nullable(_bearing_handle);
  Double_releaseFfiHandle_nullable(_tilt_handle);
  return _result;
}

MapCameraOrientationUpdate sdk_mapview_MapCamera_OrientationUpdate_fromFfi(Pointer<Void> handle) {
  final _bearing_handle = _sdk_mapview_MapCamera_OrientationUpdate_get_field_bearing(handle);
  final _tilt_handle = _sdk_mapview_MapCamera_OrientationUpdate_get_field_tilt(handle);
  try {
    return MapCameraOrientationUpdate(
      Double_fromFfi_nullable(_bearing_handle), 
    
      Double_fromFfi_nullable(_tilt_handle)
    );
  } finally {
    Double_releaseFfiHandle_nullable(_bearing_handle);
    Double_releaseFfiHandle_nullable(_tilt_handle);
  }
}

void sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(Pointer<Void> handle) => _sdk_mapview_MapCamera_OrientationUpdate_release_handle(handle);

// Nullable MapCameraOrientationUpdate

final _sdk_mapview_MapCamera_OrientationUpdate_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_OrientationUpdate_create_handle_nullable'));
final _sdk_mapview_MapCamera_OrientationUpdate_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_OrientationUpdate_release_handle_nullable'));
final _sdk_mapview_MapCamera_OrientationUpdate_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_OrientationUpdate_get_value_nullable'));

Pointer<Void> sdk_mapview_MapCamera_OrientationUpdate_toFfi_nullable(MapCameraOrientationUpdate value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_MapCamera_OrientationUpdate_toFfi(value);
  final result = _sdk_mapview_MapCamera_OrientationUpdate_create_handle_nullable(_handle);
  sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(_handle);
  return result;
}

MapCameraOrientationUpdate sdk_mapview_MapCamera_OrientationUpdate_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_MapCamera_OrientationUpdate_get_value_nullable(handle);
  final result = sdk_mapview_MapCamera_OrientationUpdate_fromFfi(_handle);
  sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapCamera_OrientationUpdate_release_handle_nullable(handle);

// End of MapCameraOrientationUpdate "private" section.
/// Represents information on current camera orientation in geodetic coordinate space.
///
/// This data container is part of a [MapCameraState].

class MapCameraOrientation {
  /// Bearing in degrees, from the true North in clockwise direction.
  /// Bearing axis is perpendicular to the ground and passes through the target coordinate.
  double bearing;

  /// Tilt in degrees.
  /// Tilt axis is parallel to the ground and passes through the target coordinate.
  double tilt;


  MapCameraOrientation(this.bearing, this.tilt);

  MapCameraOrientation.withDefaults()
    : bearing = 0, tilt = 0;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! MapCameraOrientation) return false;
    MapCameraOrientation _other = other;
    return bearing == _other.bearing &&
        tilt == _other.tilt;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + bearing.hashCode;
    result = 31 * result + tilt.hashCode;
    return result;
  }
}


// MapCameraOrientation "private" section, not exported.

final _sdk_mapview_MapCamera_Orientation_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('here_sdk_sdk_mapview_MapCamera_Orientation_create_handle'));
final _sdk_mapview_MapCamera_Orientation_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_Orientation_release_handle'));
final _sdk_mapview_MapCamera_Orientation_get_field_bearing = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_Orientation_get_field_bearing'));
final _sdk_mapview_MapCamera_Orientation_get_field_tilt = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_Orientation_get_field_tilt'));

Pointer<Void> sdk_mapview_MapCamera_Orientation_toFfi(MapCameraOrientation value) {
  final _bearing_handle = (value.bearing);
  final _tilt_handle = (value.tilt);
  final _result = _sdk_mapview_MapCamera_Orientation_create_handle(_bearing_handle, _tilt_handle);
  (_bearing_handle);
  (_tilt_handle);
  return _result;
}

MapCameraOrientation sdk_mapview_MapCamera_Orientation_fromFfi(Pointer<Void> handle) {
  final _bearing_handle = _sdk_mapview_MapCamera_Orientation_get_field_bearing(handle);
  final _tilt_handle = _sdk_mapview_MapCamera_Orientation_get_field_tilt(handle);
  try {
    return MapCameraOrientation(
      (_bearing_handle), 
    
      (_tilt_handle)
    );
  } finally {
    (_bearing_handle);
    (_tilt_handle);
  }
}

void sdk_mapview_MapCamera_Orientation_releaseFfiHandle(Pointer<Void> handle) => _sdk_mapview_MapCamera_Orientation_release_handle(handle);

// Nullable MapCameraOrientation

final _sdk_mapview_MapCamera_Orientation_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_Orientation_create_handle_nullable'));
final _sdk_mapview_MapCamera_Orientation_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_Orientation_release_handle_nullable'));
final _sdk_mapview_MapCamera_Orientation_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_Orientation_get_value_nullable'));

Pointer<Void> sdk_mapview_MapCamera_Orientation_toFfi_nullable(MapCameraOrientation value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_MapCamera_Orientation_toFfi(value);
  final result = _sdk_mapview_MapCamera_Orientation_create_handle_nullable(_handle);
  sdk_mapview_MapCamera_Orientation_releaseFfiHandle(_handle);
  return result;
}

MapCameraOrientation sdk_mapview_MapCamera_Orientation_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_MapCamera_Orientation_get_value_nullable(handle);
  final result = sdk_mapview_MapCamera_Orientation_fromFfi(_handle);
  sdk_mapview_MapCamera_Orientation_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_MapCamera_Orientation_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapCamera_Orientation_release_handle_nullable(handle);

// End of MapCameraOrientation "private" section.
/// Encapsulates state of the camera.

class MapCameraState {
  /// Camera's position in geodetic space.
  /// @nodoc
  GeoCoordinates internalcoordinates;

  /// Camera's orientation in geodetic space.
  /// @nodoc
  MapCameraOrientation internalorientation;

  /// Camera's 'LookAt' target position in geodetic space.
  GeoCoordinates targetCoordinates;

  /// Camera's 'LookAt' target orientation in geodetic space.
  MapCameraOrientation targetOrientation;

  /// Distance from the camera to the target point in meters.
  double distanceToTargetInMeters;

  /// Zoom level corresponding to the current distance to target.
  double zoomLevel;


  MapCameraState(this.internalcoordinates, this.internalorientation, this.targetCoordinates, this.targetOrientation, this.distanceToTargetInMeters, this.zoomLevel);

}


// MapCameraState "private" section, not exported.

final _sdk_mapview_MapCamera_State_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Double, Double),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, double, double)
  >('here_sdk_sdk_mapview_MapCamera_State_create_handle'));
final _sdk_mapview_MapCamera_State_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_release_handle'));
final _sdk_mapview_MapCamera_State_get_field_coordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_get_field_coordinates'));
final _sdk_mapview_MapCamera_State_get_field_orientation = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_get_field_orientation'));
final _sdk_mapview_MapCamera_State_get_field_targetCoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_get_field_targetCoordinates'));
final _sdk_mapview_MapCamera_State_get_field_targetOrientation = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_get_field_targetOrientation'));
final _sdk_mapview_MapCamera_State_get_field_distanceToTargetInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_get_field_distanceToTargetInMeters'));
final _sdk_mapview_MapCamera_State_get_field_zoomLevel = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_get_field_zoomLevel'));

Pointer<Void> sdk_mapview_MapCamera_State_toFfi(MapCameraState value) {
  final _coordinates_handle = sdk_core_GeoCoordinates_toFfi(value.internalcoordinates);
  final _orientation_handle = sdk_mapview_MapCamera_Orientation_toFfi(value.internalorientation);
  final _targetCoordinates_handle = sdk_core_GeoCoordinates_toFfi(value.targetCoordinates);
  final _targetOrientation_handle = sdk_mapview_MapCamera_Orientation_toFfi(value.targetOrientation);
  final _distanceToTargetInMeters_handle = (value.distanceToTargetInMeters);
  final _zoomLevel_handle = (value.zoomLevel);
  final _result = _sdk_mapview_MapCamera_State_create_handle(_coordinates_handle, _orientation_handle, _targetCoordinates_handle, _targetOrientation_handle, _distanceToTargetInMeters_handle, _zoomLevel_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle(_coordinates_handle);
  sdk_mapview_MapCamera_Orientation_releaseFfiHandle(_orientation_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle(_targetCoordinates_handle);
  sdk_mapview_MapCamera_Orientation_releaseFfiHandle(_targetOrientation_handle);
  (_distanceToTargetInMeters_handle);
  (_zoomLevel_handle);
  return _result;
}

MapCameraState sdk_mapview_MapCamera_State_fromFfi(Pointer<Void> handle) {
  final _coordinates_handle = _sdk_mapview_MapCamera_State_get_field_coordinates(handle);
  final _orientation_handle = _sdk_mapview_MapCamera_State_get_field_orientation(handle);
  final _targetCoordinates_handle = _sdk_mapview_MapCamera_State_get_field_targetCoordinates(handle);
  final _targetOrientation_handle = _sdk_mapview_MapCamera_State_get_field_targetOrientation(handle);
  final _distanceToTargetInMeters_handle = _sdk_mapview_MapCamera_State_get_field_distanceToTargetInMeters(handle);
  final _zoomLevel_handle = _sdk_mapview_MapCamera_State_get_field_zoomLevel(handle);
  try {
    return MapCameraState(
      sdk_core_GeoCoordinates_fromFfi(_coordinates_handle), 
    
      sdk_mapview_MapCamera_Orientation_fromFfi(_orientation_handle), 
    
      sdk_core_GeoCoordinates_fromFfi(_targetCoordinates_handle), 
    
      sdk_mapview_MapCamera_Orientation_fromFfi(_targetOrientation_handle), 
    
      (_distanceToTargetInMeters_handle), 
    
      (_zoomLevel_handle)
    );
  } finally {
    sdk_core_GeoCoordinates_releaseFfiHandle(_coordinates_handle);
    sdk_mapview_MapCamera_Orientation_releaseFfiHandle(_orientation_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_targetCoordinates_handle);
    sdk_mapview_MapCamera_Orientation_releaseFfiHandle(_targetOrientation_handle);
    (_distanceToTargetInMeters_handle);
    (_zoomLevel_handle);
  }
}

void sdk_mapview_MapCamera_State_releaseFfiHandle(Pointer<Void> handle) => _sdk_mapview_MapCamera_State_release_handle(handle);

// Nullable MapCameraState

final _sdk_mapview_MapCamera_State_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_create_handle_nullable'));
final _sdk_mapview_MapCamera_State_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_release_handle_nullable'));
final _sdk_mapview_MapCamera_State_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_State_get_value_nullable'));

Pointer<Void> sdk_mapview_MapCamera_State_toFfi_nullable(MapCameraState value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_mapview_MapCamera_State_toFfi(value);
  final result = _sdk_mapview_MapCamera_State_create_handle_nullable(_handle);
  sdk_mapview_MapCamera_State_releaseFfiHandle(_handle);
  return result;
}

MapCameraState sdk_mapview_MapCamera_State_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_mapview_MapCamera_State_get_value_nullable(handle);
  final result = sdk_mapview_MapCamera_State_fromFfi(_handle);
  sdk_mapview_MapCamera_State_releaseFfiHandle(_handle);
  return result;
}

void sdk_mapview_MapCamera_State_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapCamera_State_release_handle_nullable(handle);

// End of MapCameraState "private" section.

// MapCamera "private" section, not exported.

final _sdk_mapview_MapCamera_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_copy_handle'));
final _sdk_mapview_MapCamera_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCamera_release_handle'));
final _sdk_mapview_MapCamera_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_MapCamera_get_raw_pointer'));


















class MapCamera$Impl implements MapCamera {
  @protected
  Pointer<Void> handle;

  MapCamera$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_MapCamera_get_raw_pointer(handle));
    _sdk_mapview_MapCamera_release_handle(handle);
    handle = null;
  }

  @override
  addObserver(MapCameraObserver observer) {
    final _addObserver_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_addObserver__MapCameraObserver'));
    final _observer_handle = sdk_mapview_MapCameraObserver_toFfi(observer);
    final _handle = this.handle;
    final __result_handle = _addObserver_ffi(_handle, __lib.LibraryContext.isolateId, _observer_handle);
    sdk_mapview_MapCameraObserver_releaseFfiHandle(_observer_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  removeObserver(MapCameraObserver observer) {
    final _removeObserver_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_removeObserver__MapCameraObserver'));
    final _observer_handle = sdk_mapview_MapCameraObserver_toFfi(observer);
    final _handle = this.handle;
    final __result_handle = _removeObserver_ffi(_handle, __lib.LibraryContext.isolateId, _observer_handle);
    sdk_mapview_MapCameraObserver_releaseFfiHandle(_observer_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internalupdateCoordinates(GeoCoordinates coordinates) {
    final _updateCoordinates_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_updateCoordinates__GeoCoordinates'));
    final _coordinates_handle = sdk_core_GeoCoordinates_toFfi(coordinates);
    final _handle = this.handle;
    final __result_handle = _updateCoordinates_ffi(_handle, __lib.LibraryContext.isolateId, _coordinates_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_coordinates_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internalupdateAltitude(double altitude) {
    final _updateAltitude_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapCamera_updateAltitude__Double'));
    final _altitude_handle = (altitude);
    final _handle = this.handle;
    final __result_handle = _updateAltitude_ffi(_handle, __lib.LibraryContext.isolateId, _altitude_handle);
    (_altitude_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internalupdateOrientation(MapCameraOrientationUpdate orientation) {
    final _updateOrientation_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_updateOrientation__OrientationUpdate'));
    final _orientation_handle = sdk_mapview_MapCamera_OrientationUpdate_toFfi(orientation);
    final _handle = this.handle;
    final __result_handle = _updateOrientation_ffi(_handle, __lib.LibraryContext.isolateId, _orientation_handle);
    sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(_orientation_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internalrotateBy(MapCameraOrientation orientationChange) {
    final _rotateBy_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_rotateBy__Orientation'));
    final _orientationChange_handle = sdk_mapview_MapCamera_Orientation_toFfi(orientationChange);
    final _handle = this.handle;
    final __result_handle = _rotateBy_ffi(_handle, __lib.LibraryContext.isolateId, _orientationChange_handle);
    sdk_mapview_MapCamera_Orientation_releaseFfiHandle(_orientationChange_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  zoomBy(double factor, Point2D origin) {
    final _zoomBy_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double, Pointer<Void>), void Function(Pointer<Void>, int, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_zoomBy__Double_Point2D'));
    final _factor_handle = (factor);
    final _origin_handle = sdk_core_Point2D_toFfi(origin);
    final _handle = this.handle;
    final __result_handle = _zoomBy_ffi(_handle, __lib.LibraryContext.isolateId, _factor_handle, _origin_handle);
    (_factor_handle);
    sdk_core_Point2D_releaseFfiHandle(_origin_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  zoomTo(double zoomLevel) {
    final _zoomTo_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapCamera_zoomTo__Double'));
    final _zoomLevel_handle = (zoomLevel);
    final _handle = this.handle;
    final __result_handle = _zoomTo_ffi(_handle, __lib.LibraryContext.isolateId, _zoomLevel_handle);
    (_zoomLevel_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  lookAtPoint(GeoCoordinates target) {
    final _lookAtPoint_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_lookAt__GeoCoordinates'));
    final _target_handle = sdk_core_GeoCoordinates_toFfi(target);
    final _handle = this.handle;
    final __result_handle = _lookAtPoint_ffi(_handle, __lib.LibraryContext.isolateId, _target_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_target_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  lookAtPointWithDistance(GeoCoordinates target, double distanceInMeters) {
    final _lookAtPointWithDistance_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Double), void Function(Pointer<Void>, int, Pointer<Void>, double)>('here_sdk_sdk_mapview_MapCamera_lookAt__GeoCoordinates_Double'));
    final _target_handle = sdk_core_GeoCoordinates_toFfi(target);
    final _distanceInMeters_handle = (distanceInMeters);
    final _handle = this.handle;
    final __result_handle = _lookAtPointWithDistance_ffi(_handle, __lib.LibraryContext.isolateId, _target_handle, _distanceInMeters_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_target_handle);
    (_distanceInMeters_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  lookAtPointWithOrientationAndDistance(GeoCoordinates target, MapCameraOrientationUpdate orientation, double distanceInMeters) {
    final _lookAtPointWithOrientationAndDistance_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Double), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, double)>('here_sdk_sdk_mapview_MapCamera_lookAt__GeoCoordinates_OrientationUpdate_Double'));
    final _target_handle = sdk_core_GeoCoordinates_toFfi(target);
    final _orientation_handle = sdk_mapview_MapCamera_OrientationUpdate_toFfi(orientation);
    final _distanceInMeters_handle = (distanceInMeters);
    final _handle = this.handle;
    final __result_handle = _lookAtPointWithOrientationAndDistance_ffi(_handle, __lib.LibraryContext.isolateId, _target_handle, _orientation_handle, _distanceInMeters_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_target_handle);
    sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(_orientation_handle);
    (_distanceInMeters_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  lookAtAreaWithOrientation(GeoBox target, MapCameraOrientationUpdate orientation) {
    final _lookAtAreaWithOrientation_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_lookAt__GeoBox_OrientationUpdate'));
    final _target_handle = sdk_core_GeoBox_toFfi(target);
    final _orientation_handle = sdk_mapview_MapCamera_OrientationUpdate_toFfi(orientation);
    final _handle = this.handle;
    final __result_handle = _lookAtAreaWithOrientation_ffi(_handle, __lib.LibraryContext.isolateId, _target_handle, _orientation_handle);
    sdk_core_GeoBox_releaseFfiHandle(_target_handle);
    sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(_orientation_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  setDistanceToTarget(double distanceInMeters) {
    final _setDistanceToTarget_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapCamera_setDistanceToTarget__Double'));
    final _distanceInMeters_handle = (distanceInMeters);
    final _handle = this.handle;
    final __result_handle = _setDistanceToTarget_ffi(_handle, __lib.LibraryContext.isolateId, _distanceInMeters_handle);
    (_distanceInMeters_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  setTargetOrientation(MapCameraOrientationUpdate orientation) {
    final _setTargetOrientation_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_setTargetOrientation__OrientationUpdate'));
    final _orientation_handle = sdk_mapview_MapCamera_OrientationUpdate_toFfi(orientation);
    final _handle = this.handle;
    final __result_handle = _setTargetOrientation_ffi(_handle, __lib.LibraryContext.isolateId, _orientation_handle);
    sdk_mapview_MapCamera_OrientationUpdate_releaseFfiHandle(_orientation_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internalsetHarpMapview(HarpMapView mapview) {
    final _setHarpMapview_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCamera_setHarpMapview__HarpMapView'));
    final _mapview_handle = sdk_mapview_HarpMapView_toFfi(mapview);
    final _handle = this.handle;
    final __result_handle = _setHarpMapview_ffi(_handle, __lib.LibraryContext.isolateId, _mapview_handle);
    sdk_mapview_HarpMapView_releaseFfiHandle(_mapview_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internaldestroy() {
    final _destroy_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCamera_destroy'));
    final _handle = this.handle;
    final __result_handle = _destroy_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  internalsetViewSize(int width, int height) {
    final _setViewSize_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Uint32), void Function(Pointer<Void>, int, int, int)>('here_sdk_sdk_mapview_MapCamera_setViewSize__UInt_UInt'));
    final _width_handle = (width);
    final _height_handle = (height);
    final _handle = this.handle;
    final __result_handle = _setViewSize_ffi(_handle, __lib.LibraryContext.isolateId, _width_handle, _height_handle);
    (_width_handle);
    (_height_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  MapCameraState get state {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCamera_state_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_mapview_MapCamera_State_fromFfi(__result_handle);
    } finally {
      sdk_mapview_MapCamera_State_releaseFfiHandle(__result_handle);
    }
  }


  @override
  GeoBox get boundingBox {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCamera_boundingBox_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_core_GeoBox_fromFfi_nullable(__result_handle);
    } finally {
      sdk_core_GeoBox_releaseFfiHandle_nullable(__result_handle);
    }
  }


  @override
  MapCameraLimits get limits {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCamera_limits_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_mapview_MapCameraLimits_fromFfi(__result_handle);
    } finally {
      sdk_mapview_MapCameraLimits_releaseFfiHandle(__result_handle);
    }
  }



}

Pointer<Void> sdk_mapview_MapCamera_toFfi(MapCamera value) =>
  _sdk_mapview_MapCamera_copy_handle((value as MapCamera$Impl).handle);

MapCamera sdk_mapview_MapCamera_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_MapCamera_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as MapCamera;
  if (instance != null) return instance;

  final _copied_handle = _sdk_mapview_MapCamera_copy_handle(handle);
  final result = MapCamera$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_MapCamera_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_MapCamera_release_handle(handle);

Pointer<Void> sdk_mapview_MapCamera_toFfi_nullable(MapCamera value) =>
  value != null ? sdk_mapview_MapCamera_toFfi(value) : Pointer<Void>.fromAddress(0);

MapCamera sdk_mapview_MapCamera_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_MapCamera_fromFfi(handle) : null;

void sdk_mapview_MapCamera_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_MapCamera_release_handle(handle);

// End of MapCamera "private" section.

