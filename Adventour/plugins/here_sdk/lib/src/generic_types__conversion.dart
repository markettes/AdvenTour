import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/gestures/touch_point.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker.dart';
import 'package:here_sdk/src/sdk/mapview/map_polyline.dart';
import 'package:here_sdk/src/sdk/core/country_code.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/routing/charging_connector_type.dart';
import 'package:here_sdk/src/sdk/routing/hazardous_good.dart';
import 'package:here_sdk/src/sdk/routing/link.dart';
import 'package:here_sdk/src/sdk/routing/maneuver.dart';
import 'package:here_sdk/src/sdk/routing/post_action.dart';
import 'package:here_sdk/src/sdk/routing/road_features.dart';
import 'package:here_sdk/src/sdk/routing/route.dart';
import 'package:here_sdk/src/sdk/routing/section.dart';
import 'package:here_sdk/src/sdk/routing/street_attributes.dart';
import 'package:here_sdk/src/sdk/routing/traffic_speed.dart';
import 'package:here_sdk/src/sdk/routing/waypoint.dart';
import 'package:here_sdk/src/sdk/search/contact.dart';
import 'package:here_sdk/src/sdk/search/highlight_type.dart';
import 'package:here_sdk/src/sdk/search/index_range.dart';
import 'package:here_sdk/src/sdk/search/opening_hours.dart';
import 'package:here_sdk/src/sdk/search/place.dart';
import 'package:here_sdk/src/sdk/search/place_category.dart';
import 'package:here_sdk/src/sdk/search/schedule_details.dart';
import 'package:here_sdk/src/sdk/search/suggestion.dart';
import 'package:here_sdk/src/sdk/search/web_editorial.dart';
import 'package:here_sdk/src/sdk/search/web_image.dart';
import 'package:here_sdk/src/sdk/search/web_rating.dart';
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









final _core_types_ListOf_sdk_core_GeoCoordinates_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_core_types_ListOf_sdk_core_GeoCoordinates_create_handle'));
final _core_types_ListOf_sdk_core_GeoCoordinates_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_core_types_ListOf_sdk_core_GeoCoordinates_release_handle'));
final _core_types_ListOf_sdk_core_GeoCoordinates_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_core_types_ListOf_sdk_core_GeoCoordinates_insert'));
final _core_types_ListOf_sdk_core_GeoCoordinates_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_core_types_ListOf_sdk_core_GeoCoordinates_iterator'));
final _core_types_ListOf_sdk_core_GeoCoordinates_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_core_types_ListOf_sdk_core_GeoCoordinates_iterator_release_handle'));
final _core_types_ListOf_sdk_core_GeoCoordinates_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_core_types_ListOf_sdk_core_GeoCoordinates_iterator_is_valid'));
final _core_types_ListOf_sdk_core_GeoCoordinates_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_core_types_ListOf_sdk_core_GeoCoordinates_iterator_increment'));
final _core_types_ListOf_sdk_core_GeoCoordinates_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_core_types_ListOf_sdk_core_GeoCoordinates_iterator_get'));

Pointer<Void> core_types_ListOf_sdk_core_GeoCoordinates_toFfi(List<GeoCoordinates> value) {
  final _result = _core_types_ListOf_sdk_core_GeoCoordinates_create_handle();
  for (final element in value) {
    final _element_handle = sdk_core_GeoCoordinates_toFfi(element);
    _core_types_ListOf_sdk_core_GeoCoordinates_insert(_result, _element_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<GeoCoordinates> core_types_ListOf_sdk_core_GeoCoordinates_fromFfi(Pointer<Void> handle) {
  final result = List<GeoCoordinates>();
  final _iterator_handle = _core_types_ListOf_sdk_core_GeoCoordinates_iterator(handle);
  while (_core_types_ListOf_sdk_core_GeoCoordinates_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _core_types_ListOf_sdk_core_GeoCoordinates_iterator_get(_iterator_handle);
    try {
      result.add(sdk_core_GeoCoordinates_fromFfi(_element_handle));
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
    }
    _core_types_ListOf_sdk_core_GeoCoordinates_iterator_increment(_iterator_handle);
  }
  _core_types_ListOf_sdk_core_GeoCoordinates_iterator_release_handle(_iterator_handle);
  return result;
}

void core_types_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(Pointer<Void> handle) => _core_types_ListOf_sdk_core_GeoCoordinates_release_handle(handle);

final _core_types_ListOf_sdk_core_GeoCoordinates_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_core_types_ListOf_sdk_core_GeoCoordinates_create_handle_nullable'));
final _core_types_ListOf_sdk_core_GeoCoordinates_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_core_types_ListOf_sdk_core_GeoCoordinates_release_handle_nullable'));
final _core_types_ListOf_sdk_core_GeoCoordinates_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_core_types_ListOf_sdk_core_GeoCoordinates_get_value_nullable'));

Pointer<Void> core_types_ListOf_sdk_core_GeoCoordinates_toFfi_nullable(List<GeoCoordinates> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = core_types_ListOf_sdk_core_GeoCoordinates_toFfi(value);
  final result = _core_types_ListOf_sdk_core_GeoCoordinates_create_handle_nullable(_handle);
  core_types_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

List<GeoCoordinates> core_types_ListOf_sdk_core_GeoCoordinates_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _core_types_ListOf_sdk_core_GeoCoordinates_get_value_nullable(handle);
  final result = core_types_ListOf_sdk_core_GeoCoordinates_fromFfi(_handle);
  core_types_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

void core_types_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _core_types_ListOf_sdk_core_GeoCoordinates_release_handle_nullable(handle);


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










final _heresdk_core_bindings_ListOf_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_core_bindings_ListOf_String_create_handle'));
final _heresdk_core_bindings_ListOf_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_core_bindings_ListOf_String_release_handle'));
final _heresdk_core_bindings_ListOf_String_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_core_bindings_ListOf_String_insert'));
final _heresdk_core_bindings_ListOf_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_core_bindings_ListOf_String_iterator'));
final _heresdk_core_bindings_ListOf_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_core_bindings_ListOf_String_iterator_release_handle'));
final _heresdk_core_bindings_ListOf_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_core_bindings_ListOf_String_iterator_is_valid'));
final _heresdk_core_bindings_ListOf_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_core_bindings_ListOf_String_iterator_increment'));
final _heresdk_core_bindings_ListOf_String_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_core_bindings_ListOf_String_iterator_get'));

Pointer<Void> heresdk_core_bindings_ListOf_String_toFfi(List<String> value) {
  final _result = _heresdk_core_bindings_ListOf_String_create_handle();
  for (final element in value) {
    final _element_handle = String_toFfi(element);
    _heresdk_core_bindings_ListOf_String_insert(_result, _element_handle);
    String_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<String> heresdk_core_bindings_ListOf_String_fromFfi(Pointer<Void> handle) {
  final result = List<String>();
  final _iterator_handle = _heresdk_core_bindings_ListOf_String_iterator(handle);
  while (_heresdk_core_bindings_ListOf_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_core_bindings_ListOf_String_iterator_get(_iterator_handle);
    try {
      result.add(String_fromFfi(_element_handle));
    } finally {
      String_releaseFfiHandle(_element_handle);
    }
    _heresdk_core_bindings_ListOf_String_iterator_increment(_iterator_handle);
  }
  _heresdk_core_bindings_ListOf_String_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_core_bindings_ListOf_String_releaseFfiHandle(Pointer<Void> handle) => _heresdk_core_bindings_ListOf_String_release_handle(handle);

final _heresdk_core_bindings_ListOf_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_core_bindings_ListOf_String_create_handle_nullable'));
final _heresdk_core_bindings_ListOf_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_core_bindings_ListOf_String_release_handle_nullable'));
final _heresdk_core_bindings_ListOf_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_core_bindings_ListOf_String_get_value_nullable'));

Pointer<Void> heresdk_core_bindings_ListOf_String_toFfi_nullable(List<String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_core_bindings_ListOf_String_toFfi(value);
  final result = _heresdk_core_bindings_ListOf_String_create_handle_nullable(_handle);
  heresdk_core_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

List<String> heresdk_core_bindings_ListOf_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_core_bindings_ListOf_String_get_value_nullable(handle);
  final result = heresdk_core_bindings_ListOf_String_fromFfi(_handle);
  heresdk_core_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

void heresdk_core_bindings_ListOf_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_core_bindings_ListOf_String_release_handle_nullable(handle);

final _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_create_handle'));
final _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_release_handle'));
final _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_insert'));
final _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_iterator'));
final _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle'));
final _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid'));
final _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment'));
final _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get'));

Pointer<Void> heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(List<GeoCoordinates> value) {
  final _result = _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_create_handle();
  for (final element in value) {
    final _element_handle = sdk_core_GeoCoordinates_toFfi(element);
    _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_insert(_result, _element_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<GeoCoordinates> heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(Pointer<Void> handle) {
  final result = List<GeoCoordinates>();
  final _iterator_handle = _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_iterator(handle);
  while (_heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get(_iterator_handle);
    try {
      result.add(sdk_core_GeoCoordinates_fromFfi(_element_handle));
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
    }
    _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment(_iterator_handle);
  }
  _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(Pointer<Void> handle) => _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_release_handle(handle);

final _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable'));
final _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable'));
final _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable'));

Pointer<Void> heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_toFfi_nullable(List<GeoCoordinates> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(value);
  final result = _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable(_handle);
  heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

List<GeoCoordinates> heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable(handle);
  final result = heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(_handle);
  heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

void heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_core_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable(handle);


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











final _heresdk_gestures_bindings_ListOf_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_gestures_bindings_ListOf_String_create_handle'));
final _heresdk_gestures_bindings_ListOf_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_gestures_bindings_ListOf_String_release_handle'));
final _heresdk_gestures_bindings_ListOf_String_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_gestures_bindings_ListOf_String_insert'));
final _heresdk_gestures_bindings_ListOf_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_gestures_bindings_ListOf_String_iterator'));
final _heresdk_gestures_bindings_ListOf_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_gestures_bindings_ListOf_String_iterator_release_handle'));
final _heresdk_gestures_bindings_ListOf_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_gestures_bindings_ListOf_String_iterator_is_valid'));
final _heresdk_gestures_bindings_ListOf_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_gestures_bindings_ListOf_String_iterator_increment'));
final _heresdk_gestures_bindings_ListOf_String_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_gestures_bindings_ListOf_String_iterator_get'));

Pointer<Void> heresdk_gestures_bindings_ListOf_String_toFfi(List<String> value) {
  final _result = _heresdk_gestures_bindings_ListOf_String_create_handle();
  for (final element in value) {
    final _element_handle = String_toFfi(element);
    _heresdk_gestures_bindings_ListOf_String_insert(_result, _element_handle);
    String_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<String> heresdk_gestures_bindings_ListOf_String_fromFfi(Pointer<Void> handle) {
  final result = List<String>();
  final _iterator_handle = _heresdk_gestures_bindings_ListOf_String_iterator(handle);
  while (_heresdk_gestures_bindings_ListOf_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_gestures_bindings_ListOf_String_iterator_get(_iterator_handle);
    try {
      result.add(String_fromFfi(_element_handle));
    } finally {
      String_releaseFfiHandle(_element_handle);
    }
    _heresdk_gestures_bindings_ListOf_String_iterator_increment(_iterator_handle);
  }
  _heresdk_gestures_bindings_ListOf_String_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_gestures_bindings_ListOf_String_releaseFfiHandle(Pointer<Void> handle) => _heresdk_gestures_bindings_ListOf_String_release_handle(handle);

final _heresdk_gestures_bindings_ListOf_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_gestures_bindings_ListOf_String_create_handle_nullable'));
final _heresdk_gestures_bindings_ListOf_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_gestures_bindings_ListOf_String_release_handle_nullable'));
final _heresdk_gestures_bindings_ListOf_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_gestures_bindings_ListOf_String_get_value_nullable'));

Pointer<Void> heresdk_gestures_bindings_ListOf_String_toFfi_nullable(List<String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_gestures_bindings_ListOf_String_toFfi(value);
  final result = _heresdk_gestures_bindings_ListOf_String_create_handle_nullable(_handle);
  heresdk_gestures_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

List<String> heresdk_gestures_bindings_ListOf_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_gestures_bindings_ListOf_String_get_value_nullable(handle);
  final result = heresdk_gestures_bindings_ListOf_String_fromFfi(_handle);
  heresdk_gestures_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

void heresdk_gestures_bindings_ListOf_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_gestures_bindings_ListOf_String_release_handle_nullable(handle);

final _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_create_handle'));
final _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_release_handle'));
final _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_insert'));
final _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_iterator'));
final _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle'));
final _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid'));
final _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment'));
final _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get'));

Pointer<Void> heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(List<GeoCoordinates> value) {
  final _result = _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_create_handle();
  for (final element in value) {
    final _element_handle = sdk_core_GeoCoordinates_toFfi(element);
    _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_insert(_result, _element_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<GeoCoordinates> heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(Pointer<Void> handle) {
  final result = List<GeoCoordinates>();
  final _iterator_handle = _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_iterator(handle);
  while (_heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get(_iterator_handle);
    try {
      result.add(sdk_core_GeoCoordinates_fromFfi(_element_handle));
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
    }
    _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment(_iterator_handle);
  }
  _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(Pointer<Void> handle) => _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_release_handle(handle);

final _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable'));
final _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable'));
final _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable'));

Pointer<Void> heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_toFfi_nullable(List<GeoCoordinates> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(value);
  final result = _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable(_handle);
  heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

List<GeoCoordinates> heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable(handle);
  final result = heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(_handle);
  heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

void heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_gestures_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable(handle);

final _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_create_handle'));
final _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_release_handle'));
final _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int64, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('here_sdk_heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_put'));
final _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator'));
final _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_release_handle'));
final _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_is_valid'));
final _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_increment'));
final _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_get_key'));
final _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_get_value'));

Pointer<Void> heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_toFfi(Map<int, TouchPoint> value) {
  final _result = _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = sdk_gestures_TouchPoint_toFfi(entry.value);
    _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_put(_result, _key_handle, _value_handle);
    (_key_handle);
    sdk_gestures_TouchPoint_releaseFfiHandle(_value_handle);
  }
  return _result;
}

Map<int, TouchPoint> heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_fromFfi(Pointer<Void> handle) {
  final result = Map<int, TouchPoint>();
  final _iterator_handle = _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator(handle);
  while (_heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_get_key(_iterator_handle);
    final _value_handle = _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        sdk_gestures_TouchPoint_fromFfi(_value_handle);
    } finally {
      (_key_handle);
      sdk_gestures_TouchPoint_releaseFfiHandle(_value_handle);
    }
    _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_increment(_iterator_handle);
  }
  _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_releaseFfiHandle(Pointer<Void> handle) => _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_release_handle(handle);

final _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_create_handle_nullable'));
final _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_release_handle_nullable'));
final _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_get_value_nullable'));

Pointer<Void> heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_toFfi_nullable(Map<int, TouchPoint> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_toFfi(value);
  final result = _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_create_handle_nullable(_handle);
  heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_releaseFfiHandle(_handle);
  return result;
}

Map<int, TouchPoint> heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_get_value_nullable(handle);
  final result = heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_fromFfi(_handle);
  heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_releaseFfiHandle(_handle);
  return result;
}

void heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_gestures_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_release_handle_nullable(handle);


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










final _heresdk_mapview_common_bindings_ListOf_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_mapview_common_bindings_ListOf_String_create_handle'));
final _heresdk_mapview_common_bindings_ListOf_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_common_bindings_ListOf_String_release_handle'));
final _heresdk_mapview_common_bindings_ListOf_String_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_mapview_common_bindings_ListOf_String_insert'));
final _heresdk_mapview_common_bindings_ListOf_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_common_bindings_ListOf_String_iterator'));
final _heresdk_mapview_common_bindings_ListOf_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_common_bindings_ListOf_String_iterator_release_handle'));
final _heresdk_mapview_common_bindings_ListOf_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_mapview_common_bindings_ListOf_String_iterator_is_valid'));
final _heresdk_mapview_common_bindings_ListOf_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_common_bindings_ListOf_String_iterator_increment'));
final _heresdk_mapview_common_bindings_ListOf_String_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_common_bindings_ListOf_String_iterator_get'));

Pointer<Void> heresdk_mapview_common_bindings_ListOf_String_toFfi(List<String> value) {
  final _result = _heresdk_mapview_common_bindings_ListOf_String_create_handle();
  for (final element in value) {
    final _element_handle = String_toFfi(element);
    _heresdk_mapview_common_bindings_ListOf_String_insert(_result, _element_handle);
    String_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<String> heresdk_mapview_common_bindings_ListOf_String_fromFfi(Pointer<Void> handle) {
  final result = List<String>();
  final _iterator_handle = _heresdk_mapview_common_bindings_ListOf_String_iterator(handle);
  while (_heresdk_mapview_common_bindings_ListOf_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_mapview_common_bindings_ListOf_String_iterator_get(_iterator_handle);
    try {
      result.add(String_fromFfi(_element_handle));
    } finally {
      String_releaseFfiHandle(_element_handle);
    }
    _heresdk_mapview_common_bindings_ListOf_String_iterator_increment(_iterator_handle);
  }
  _heresdk_mapview_common_bindings_ListOf_String_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_mapview_common_bindings_ListOf_String_releaseFfiHandle(Pointer<Void> handle) => _heresdk_mapview_common_bindings_ListOf_String_release_handle(handle);

final _heresdk_mapview_common_bindings_ListOf_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_common_bindings_ListOf_String_create_handle_nullable'));
final _heresdk_mapview_common_bindings_ListOf_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_common_bindings_ListOf_String_release_handle_nullable'));
final _heresdk_mapview_common_bindings_ListOf_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_common_bindings_ListOf_String_get_value_nullable'));

Pointer<Void> heresdk_mapview_common_bindings_ListOf_String_toFfi_nullable(List<String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_mapview_common_bindings_ListOf_String_toFfi(value);
  final result = _heresdk_mapview_common_bindings_ListOf_String_create_handle_nullable(_handle);
  heresdk_mapview_common_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

List<String> heresdk_mapview_common_bindings_ListOf_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_mapview_common_bindings_ListOf_String_get_value_nullable(handle);
  final result = heresdk_mapview_common_bindings_ListOf_String_fromFfi(_handle);
  heresdk_mapview_common_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

void heresdk_mapview_common_bindings_ListOf_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_mapview_common_bindings_ListOf_String_release_handle_nullable(handle);

final _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle'));
final _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle'));
final _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_insert'));
final _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator'));
final _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle'));
final _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid'));
final _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment'));
final _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get'));

Pointer<Void> heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(List<GeoCoordinates> value) {
  final _result = _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle();
  for (final element in value) {
    final _element_handle = sdk_core_GeoCoordinates_toFfi(element);
    _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_insert(_result, _element_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<GeoCoordinates> heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(Pointer<Void> handle) {
  final result = List<GeoCoordinates>();
  final _iterator_handle = _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator(handle);
  while (_heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get(_iterator_handle);
    try {
      result.add(sdk_core_GeoCoordinates_fromFfi(_element_handle));
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
    }
    _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment(_iterator_handle);
  }
  _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(Pointer<Void> handle) => _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle(handle);

final _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable'));
final _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable'));
final _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable'));

Pointer<Void> heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_toFfi_nullable(List<GeoCoordinates> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(value);
  final result = _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable(_handle);
  heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

List<GeoCoordinates> heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable(handle);
  final result = heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(_handle);
  heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

void heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_mapview_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable(handle);


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













final _heresdk_mapview_harp_bindings_ListOf_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_String_create_handle'));
final _heresdk_mapview_harp_bindings_ListOf_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_String_release_handle'));
final _heresdk_mapview_harp_bindings_ListOf_String_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_String_insert'));
final _heresdk_mapview_harp_bindings_ListOf_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_String_iterator'));
final _heresdk_mapview_harp_bindings_ListOf_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_String_iterator_release_handle'));
final _heresdk_mapview_harp_bindings_ListOf_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_String_iterator_is_valid'));
final _heresdk_mapview_harp_bindings_ListOf_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_String_iterator_increment'));
final _heresdk_mapview_harp_bindings_ListOf_String_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_String_iterator_get'));

Pointer<Void> heresdk_mapview_harp_bindings_ListOf_String_toFfi(List<String> value) {
  final _result = _heresdk_mapview_harp_bindings_ListOf_String_create_handle();
  for (final element in value) {
    final _element_handle = String_toFfi(element);
    _heresdk_mapview_harp_bindings_ListOf_String_insert(_result, _element_handle);
    String_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<String> heresdk_mapview_harp_bindings_ListOf_String_fromFfi(Pointer<Void> handle) {
  final result = List<String>();
  final _iterator_handle = _heresdk_mapview_harp_bindings_ListOf_String_iterator(handle);
  while (_heresdk_mapview_harp_bindings_ListOf_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_mapview_harp_bindings_ListOf_String_iterator_get(_iterator_handle);
    try {
      result.add(String_fromFfi(_element_handle));
    } finally {
      String_releaseFfiHandle(_element_handle);
    }
    _heresdk_mapview_harp_bindings_ListOf_String_iterator_increment(_iterator_handle);
  }
  _heresdk_mapview_harp_bindings_ListOf_String_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_mapview_harp_bindings_ListOf_String_releaseFfiHandle(Pointer<Void> handle) => _heresdk_mapview_harp_bindings_ListOf_String_release_handle(handle);

final _heresdk_mapview_harp_bindings_ListOf_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_String_create_handle_nullable'));
final _heresdk_mapview_harp_bindings_ListOf_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_String_release_handle_nullable'));
final _heresdk_mapview_harp_bindings_ListOf_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_String_get_value_nullable'));

Pointer<Void> heresdk_mapview_harp_bindings_ListOf_String_toFfi_nullable(List<String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_mapview_harp_bindings_ListOf_String_toFfi(value);
  final result = _heresdk_mapview_harp_bindings_ListOf_String_create_handle_nullable(_handle);
  heresdk_mapview_harp_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

List<String> heresdk_mapview_harp_bindings_ListOf_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_mapview_harp_bindings_ListOf_String_get_value_nullable(handle);
  final result = heresdk_mapview_harp_bindings_ListOf_String_fromFfi(_handle);
  heresdk_mapview_harp_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

void heresdk_mapview_harp_bindings_ListOf_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_mapview_harp_bindings_ListOf_String_release_handle_nullable(handle);

final _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_create_handle'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_release_handle'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_insert'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_iterator'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get'));

Pointer<Void> heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(List<GeoCoordinates> value) {
  final _result = _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_create_handle();
  for (final element in value) {
    final _element_handle = sdk_core_GeoCoordinates_toFfi(element);
    _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_insert(_result, _element_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<GeoCoordinates> heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(Pointer<Void> handle) {
  final result = List<GeoCoordinates>();
  final _iterator_handle = _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_iterator(handle);
  while (_heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get(_iterator_handle);
    try {
      result.add(sdk_core_GeoCoordinates_fromFfi(_element_handle));
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
    }
    _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment(_iterator_handle);
  }
  _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(Pointer<Void> handle) => _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_release_handle(handle);

final _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable'));

Pointer<Void> heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_toFfi_nullable(List<GeoCoordinates> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(value);
  final result = _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable(_handle);
  heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

List<GeoCoordinates> heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable(handle);
  final result = heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(_handle);
  heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

void heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_mapview_harp_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable(handle);

final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_create_handle'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_release_handle'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_insert'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_iterator'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_iterator_release_handle'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_iterator_is_valid'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_iterator_increment'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_iterator_get'));

Pointer<Void> heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_toFfi(List<MapMarker> value) {
  final _result = _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_create_handle();
  for (final element in value) {
    final _element_handle = sdk_mapview_MapMarker_toFfi(element);
    _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_insert(_result, _element_handle);
    sdk_mapview_MapMarker_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<MapMarker> heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_fromFfi(Pointer<Void> handle) {
  final result = List<MapMarker>();
  final _iterator_handle = _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_iterator(handle);
  while (_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_iterator_get(_iterator_handle);
    try {
      result.add(sdk_mapview_MapMarker_fromFfi(_element_handle));
    } finally {
      sdk_mapview_MapMarker_releaseFfiHandle(_element_handle);
    }
    _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_iterator_increment(_iterator_handle);
  }
  _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_releaseFfiHandle(Pointer<Void> handle) => _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_release_handle(handle);

final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_create_handle_nullable'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_release_handle_nullable'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_get_value_nullable'));

Pointer<Void> heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_toFfi_nullable(List<MapMarker> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_toFfi(value);
  final result = _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_create_handle_nullable(_handle);
  heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_releaseFfiHandle(_handle);
  return result;
}

List<MapMarker> heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_get_value_nullable(handle);
  final result = heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_fromFfi(_handle);
  heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_releaseFfiHandle(_handle);
  return result;
}

void heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapMarker_release_handle_nullable(handle);

final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_create_handle'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_release_handle'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_insert'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_iterator'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_iterator_release_handle'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_iterator_is_valid'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_iterator_increment'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_iterator_get'));

Pointer<Void> heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_toFfi(List<MapPolyline> value) {
  final _result = _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_create_handle();
  for (final element in value) {
    final _element_handle = sdk_mapview_MapPolyline_toFfi(element);
    _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_insert(_result, _element_handle);
    sdk_mapview_MapPolyline_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<MapPolyline> heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_fromFfi(Pointer<Void> handle) {
  final result = List<MapPolyline>();
  final _iterator_handle = _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_iterator(handle);
  while (_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_iterator_get(_iterator_handle);
    try {
      result.add(sdk_mapview_MapPolyline_fromFfi(_element_handle));
    } finally {
      sdk_mapview_MapPolyline_releaseFfiHandle(_element_handle);
    }
    _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_iterator_increment(_iterator_handle);
  }
  _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_releaseFfiHandle(Pointer<Void> handle) => _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_release_handle(handle);

final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_create_handle_nullable'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_release_handle_nullable'));
final _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_get_value_nullable'));

Pointer<Void> heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_toFfi_nullable(List<MapPolyline> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_toFfi(value);
  final result = _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_create_handle_nullable(_handle);
  heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_releaseFfiHandle(_handle);
  return result;
}

List<MapPolyline> heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_get_value_nullable(handle);
  final result = heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_fromFfi(_handle);
  heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_releaseFfiHandle(_handle);
  return result;
}

void heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_mapview_harp_bindings_ListOf_sdk_mapview_MapPolyline_release_handle_nullable(handle);

final _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_create_handle'));
final _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_release_handle'));
final _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int64, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_put'));
final _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator'));
final _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_release_handle'));
final _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_is_valid'));
final _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_increment'));
final _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_get_key'));
final _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_get_value'));

Pointer<Void> heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_toFfi(Map<int, TouchPoint> value) {
  final _result = _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = sdk_gestures_TouchPoint_toFfi(entry.value);
    _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_put(_result, _key_handle, _value_handle);
    (_key_handle);
    sdk_gestures_TouchPoint_releaseFfiHandle(_value_handle);
  }
  return _result;
}

Map<int, TouchPoint> heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_fromFfi(Pointer<Void> handle) {
  final result = Map<int, TouchPoint>();
  final _iterator_handle = _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator(handle);
  while (_heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_get_key(_iterator_handle);
    final _value_handle = _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        sdk_gestures_TouchPoint_fromFfi(_value_handle);
    } finally {
      (_key_handle);
      sdk_gestures_TouchPoint_releaseFfiHandle(_value_handle);
    }
    _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_increment(_iterator_handle);
  }
  _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_releaseFfiHandle(Pointer<Void> handle) => _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_release_handle(handle);

final _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_create_handle_nullable'));
final _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_release_handle_nullable'));
final _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_get_value_nullable'));

Pointer<Void> heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_toFfi_nullable(Map<int, TouchPoint> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_toFfi(value);
  final result = _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_create_handle_nullable(_handle);
  heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_releaseFfiHandle(_handle);
  return result;
}

Map<int, TouchPoint> heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_get_value_nullable(handle);
  final result = heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_fromFfi(_handle);
  heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_releaseFfiHandle(_handle);
  return result;
}

void heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_mapview_harp_bindings_MapOf_Long_to_sdk_gestures_TouchPoint_release_handle_nullable(handle);


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










final _heresdk_mapview_omv_bindings_ListOf_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_mapview_omv_bindings_ListOf_String_create_handle'));
final _heresdk_mapview_omv_bindings_ListOf_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_omv_bindings_ListOf_String_release_handle'));
final _heresdk_mapview_omv_bindings_ListOf_String_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_mapview_omv_bindings_ListOf_String_insert'));
final _heresdk_mapview_omv_bindings_ListOf_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_omv_bindings_ListOf_String_iterator'));
final _heresdk_mapview_omv_bindings_ListOf_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_omv_bindings_ListOf_String_iterator_release_handle'));
final _heresdk_mapview_omv_bindings_ListOf_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_mapview_omv_bindings_ListOf_String_iterator_is_valid'));
final _heresdk_mapview_omv_bindings_ListOf_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_omv_bindings_ListOf_String_iterator_increment'));
final _heresdk_mapview_omv_bindings_ListOf_String_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_omv_bindings_ListOf_String_iterator_get'));

Pointer<Void> heresdk_mapview_omv_bindings_ListOf_String_toFfi(List<String> value) {
  final _result = _heresdk_mapview_omv_bindings_ListOf_String_create_handle();
  for (final element in value) {
    final _element_handle = String_toFfi(element);
    _heresdk_mapview_omv_bindings_ListOf_String_insert(_result, _element_handle);
    String_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<String> heresdk_mapview_omv_bindings_ListOf_String_fromFfi(Pointer<Void> handle) {
  final result = List<String>();
  final _iterator_handle = _heresdk_mapview_omv_bindings_ListOf_String_iterator(handle);
  while (_heresdk_mapview_omv_bindings_ListOf_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_mapview_omv_bindings_ListOf_String_iterator_get(_iterator_handle);
    try {
      result.add(String_fromFfi(_element_handle));
    } finally {
      String_releaseFfiHandle(_element_handle);
    }
    _heresdk_mapview_omv_bindings_ListOf_String_iterator_increment(_iterator_handle);
  }
  _heresdk_mapview_omv_bindings_ListOf_String_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_mapview_omv_bindings_ListOf_String_releaseFfiHandle(Pointer<Void> handle) => _heresdk_mapview_omv_bindings_ListOf_String_release_handle(handle);

final _heresdk_mapview_omv_bindings_ListOf_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_omv_bindings_ListOf_String_create_handle_nullable'));
final _heresdk_mapview_omv_bindings_ListOf_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_omv_bindings_ListOf_String_release_handle_nullable'));
final _heresdk_mapview_omv_bindings_ListOf_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_omv_bindings_ListOf_String_get_value_nullable'));

Pointer<Void> heresdk_mapview_omv_bindings_ListOf_String_toFfi_nullable(List<String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_mapview_omv_bindings_ListOf_String_toFfi(value);
  final result = _heresdk_mapview_omv_bindings_ListOf_String_create_handle_nullable(_handle);
  heresdk_mapview_omv_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

List<String> heresdk_mapview_omv_bindings_ListOf_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_mapview_omv_bindings_ListOf_String_get_value_nullable(handle);
  final result = heresdk_mapview_omv_bindings_ListOf_String_fromFfi(_handle);
  heresdk_mapview_omv_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

void heresdk_mapview_omv_bindings_ListOf_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_mapview_omv_bindings_ListOf_String_release_handle_nullable(handle);

final _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_create_handle'));
final _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_release_handle'));
final _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_insert'));
final _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_iterator'));
final _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle'));
final _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid'));
final _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment'));
final _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get'));

Pointer<Void> heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(List<GeoCoordinates> value) {
  final _result = _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_create_handle();
  for (final element in value) {
    final _element_handle = sdk_core_GeoCoordinates_toFfi(element);
    _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_insert(_result, _element_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<GeoCoordinates> heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(Pointer<Void> handle) {
  final result = List<GeoCoordinates>();
  final _iterator_handle = _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_iterator(handle);
  while (_heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get(_iterator_handle);
    try {
      result.add(sdk_core_GeoCoordinates_fromFfi(_element_handle));
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
    }
    _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment(_iterator_handle);
  }
  _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(Pointer<Void> handle) => _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_release_handle(handle);

final _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable'));
final _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable'));
final _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable'));

Pointer<Void> heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_toFfi_nullable(List<GeoCoordinates> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(value);
  final result = _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable(_handle);
  heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

List<GeoCoordinates> heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable(handle);
  final result = heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(_handle);
  heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

void heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_mapview_omv_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable(handle);


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























final _heresdk_routing_bindings_ListOf_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_ListOf_String_create_handle'));
final _heresdk_routing_bindings_ListOf_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_String_release_handle'));
final _heresdk_routing_bindings_ListOf_String_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_String_insert'));
final _heresdk_routing_bindings_ListOf_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_String_iterator'));
final _heresdk_routing_bindings_ListOf_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_String_iterator_release_handle'));
final _heresdk_routing_bindings_ListOf_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_String_iterator_is_valid'));
final _heresdk_routing_bindings_ListOf_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_String_iterator_increment'));
final _heresdk_routing_bindings_ListOf_String_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_String_iterator_get'));

Pointer<Void> heresdk_routing_bindings_ListOf_String_toFfi(List<String> value) {
  final _result = _heresdk_routing_bindings_ListOf_String_create_handle();
  for (final element in value) {
    final _element_handle = String_toFfi(element);
    _heresdk_routing_bindings_ListOf_String_insert(_result, _element_handle);
    String_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<String> heresdk_routing_bindings_ListOf_String_fromFfi(Pointer<Void> handle) {
  final result = List<String>();
  final _iterator_handle = _heresdk_routing_bindings_ListOf_String_iterator(handle);
  while (_heresdk_routing_bindings_ListOf_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_bindings_ListOf_String_iterator_get(_iterator_handle);
    try {
      result.add(String_fromFfi(_element_handle));
    } finally {
      String_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_bindings_ListOf_String_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_ListOf_String_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_String_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_ListOf_String_release_handle(handle);

final _heresdk_routing_bindings_ListOf_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_String_create_handle_nullable'));
final _heresdk_routing_bindings_ListOf_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_String_release_handle_nullable'));
final _heresdk_routing_bindings_ListOf_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_String_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_ListOf_String_toFfi_nullable(List<String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_ListOf_String_toFfi(value);
  final result = _heresdk_routing_bindings_ListOf_String_create_handle_nullable(_handle);
  heresdk_routing_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

List<String> heresdk_routing_bindings_ListOf_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_ListOf_String_get_value_nullable(handle);
  final result = heresdk_routing_bindings_ListOf_String_fromFfi(_handle);
  heresdk_routing_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_ListOf_String_release_handle_nullable(handle);

final _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_CountryCode_create_handle'));
final _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_CountryCode_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_CountryCode_insert'));
final _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_CountryCode_iterator'));
final _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_CountryCode_iterator_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_CountryCode_iterator_is_valid'));
final _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_CountryCode_iterator_increment'));
final _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_CountryCode_iterator_get'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_core_CountryCode_toFfi(List<CountryCode> value) {
  final _result = _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_create_handle();
  for (final element in value) {
    final _element_handle = sdk_core_CountryCode_toFfi(element);
    _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_insert(_result, _element_handle);
    sdk_core_CountryCode_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<CountryCode> heresdk_routing_bindings_ListOf_sdk_core_CountryCode_fromFfi(Pointer<Void> handle) {
  final result = List<CountryCode>();
  final _iterator_handle = _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_iterator(handle);
  while (_heresdk_routing_bindings_ListOf_sdk_core_CountryCode_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_iterator_get(_iterator_handle);
    try {
      result.add(sdk_core_CountryCode_fromFfi(_element_handle));
    } finally {
      sdk_core_CountryCode_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_release_handle(handle);

final _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_CountryCode_create_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_CountryCode_release_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_CountryCode_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_core_CountryCode_toFfi_nullable(List<CountryCode> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_ListOf_sdk_core_CountryCode_toFfi(value);
  final result = _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_create_handle_nullable(_handle);
  heresdk_routing_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(_handle);
  return result;
}

List<CountryCode> heresdk_routing_bindings_ListOf_sdk_core_CountryCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_get_value_nullable(handle);
  final result = heresdk_routing_bindings_ListOf_sdk_core_CountryCode_fromFfi(_handle);
  heresdk_routing_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_ListOf_sdk_core_CountryCode_release_handle_nullable(handle);

final _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoBox_create_handle'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoBox_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoBox_insert'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoBox_iterator'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoBox_iterator_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoBox_iterator_is_valid'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoBox_iterator_increment'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoBox_iterator_get'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_core_GeoBox_toFfi(List<GeoBox> value) {
  final _result = _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_create_handle();
  for (final element in value) {
    final _element_handle = sdk_core_GeoBox_toFfi(element);
    _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_insert(_result, _element_handle);
    sdk_core_GeoBox_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<GeoBox> heresdk_routing_bindings_ListOf_sdk_core_GeoBox_fromFfi(Pointer<Void> handle) {
  final result = List<GeoBox>();
  final _iterator_handle = _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_iterator(handle);
  while (_heresdk_routing_bindings_ListOf_sdk_core_GeoBox_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_iterator_get(_iterator_handle);
    try {
      result.add(sdk_core_GeoBox_fromFfi(_element_handle));
    } finally {
      sdk_core_GeoBox_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_core_GeoBox_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_release_handle(handle);

final _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoBox_create_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoBox_release_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoBox_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_core_GeoBox_toFfi_nullable(List<GeoBox> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_ListOf_sdk_core_GeoBox_toFfi(value);
  final result = _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_create_handle_nullable(_handle);
  heresdk_routing_bindings_ListOf_sdk_core_GeoBox_releaseFfiHandle(_handle);
  return result;
}

List<GeoBox> heresdk_routing_bindings_ListOf_sdk_core_GeoBox_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_get_value_nullable(handle);
  final result = heresdk_routing_bindings_ListOf_sdk_core_GeoBox_fromFfi(_handle);
  heresdk_routing_bindings_ListOf_sdk_core_GeoBox_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_core_GeoBox_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_ListOf_sdk_core_GeoBox_release_handle_nullable(handle);

final _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_create_handle'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_insert'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_iterator'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(List<GeoCoordinates> value) {
  final _result = _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_create_handle();
  for (final element in value) {
    final _element_handle = sdk_core_GeoCoordinates_toFfi(element);
    _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_insert(_result, _element_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<GeoCoordinates> heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(Pointer<Void> handle) {
  final result = List<GeoCoordinates>();
  final _iterator_handle = _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_iterator(handle);
  while (_heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get(_iterator_handle);
    try {
      result.add(sdk_core_GeoCoordinates_fromFfi(_element_handle));
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_release_handle(handle);

final _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_toFfi_nullable(List<GeoCoordinates> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(value);
  final result = _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable(_handle);
  heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

List<GeoCoordinates> heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable(handle);
  final result = heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(_handle);
  heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_create_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_insert'));
final _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator'));
final _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_is_valid'));
final _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_increment'));
final _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_get'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_toFfi(List<ChargingConnectorType> value) {
  final _result = _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_ChargingConnectorType_toFfi(element);
    _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_insert(_result, _element_handle);
    sdk_routing_ChargingConnectorType_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<ChargingConnectorType> heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_fromFfi(Pointer<Void> handle) {
  final result = List<ChargingConnectorType>();
  final _iterator_handle = _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator(handle);
  while (_heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_ChargingConnectorType_fromFfi(_element_handle));
    } finally {
      sdk_routing_ChargingConnectorType_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_release_handle(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_create_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_release_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_toFfi_nullable(List<ChargingConnectorType> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_toFfi(value);
  final result = _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_create_handle_nullable(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_releaseFfiHandle(_handle);
  return result;
}

List<ChargingConnectorType> heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_get_value_nullable(handle);
  final result = heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_fromFfi(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_ListOf_sdk_routing_ChargingConnectorType_release_handle_nullable(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_create_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_insert'));
final _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_iterator'));
final _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_iterator_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_iterator_is_valid'));
final _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_iterator_increment'));
final _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_iterator_get'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_toFfi(List<HazardousGood> value) {
  final _result = _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_HazardousGood_toFfi(element);
    _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_insert(_result, _element_handle);
    sdk_routing_HazardousGood_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<HazardousGood> heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_fromFfi(Pointer<Void> handle) {
  final result = List<HazardousGood>();
  final _iterator_handle = _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_iterator(handle);
  while (_heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_HazardousGood_fromFfi(_element_handle));
    } finally {
      sdk_routing_HazardousGood_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_release_handle(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_create_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_release_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_toFfi_nullable(List<HazardousGood> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_toFfi(value);
  final result = _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_create_handle_nullable(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_releaseFfiHandle(_handle);
  return result;
}

List<HazardousGood> heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_get_value_nullable(handle);
  final result = heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_fromFfi(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_ListOf_sdk_routing_HazardousGood_release_handle_nullable(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_Link_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Link_create_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Link_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Link_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Link_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Link_insert'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Link_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Link_iterator'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Link_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Link_iterator_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Link_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Link_iterator_is_valid'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Link_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Link_iterator_increment'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Link_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Link_iterator_get'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_Link_toFfi(List<Link> value) {
  final _result = _heresdk_routing_bindings_ListOf_sdk_routing_Link_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_Link_toFfi(element);
    _heresdk_routing_bindings_ListOf_sdk_routing_Link_insert(_result, _element_handle);
    sdk_routing_Link_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<Link> heresdk_routing_bindings_ListOf_sdk_routing_Link_fromFfi(Pointer<Void> handle) {
  final result = List<Link>();
  final _iterator_handle = _heresdk_routing_bindings_ListOf_sdk_routing_Link_iterator(handle);
  while (_heresdk_routing_bindings_ListOf_sdk_routing_Link_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_bindings_ListOf_sdk_routing_Link_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_Link_fromFfi(_element_handle));
    } finally {
      sdk_routing_Link_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_bindings_ListOf_sdk_routing_Link_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_ListOf_sdk_routing_Link_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_Link_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_ListOf_sdk_routing_Link_release_handle(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_Link_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Link_create_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Link_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Link_release_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Link_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Link_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_Link_toFfi_nullable(List<Link> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_ListOf_sdk_routing_Link_toFfi(value);
  final result = _heresdk_routing_bindings_ListOf_sdk_routing_Link_create_handle_nullable(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_Link_releaseFfiHandle(_handle);
  return result;
}

List<Link> heresdk_routing_bindings_ListOf_sdk_routing_Link_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_ListOf_sdk_routing_Link_get_value_nullable(handle);
  final result = heresdk_routing_bindings_ListOf_sdk_routing_Link_fromFfi(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_Link_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_Link_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_ListOf_sdk_routing_Link_release_handle_nullable(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_create_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_insert'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_iterator'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_iterator_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_iterator_is_valid'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_iterator_increment'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_iterator_get'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_toFfi(List<Maneuver> value) {
  final _result = _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_Maneuver_toFfi(element);
    _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_insert(_result, _element_handle);
    sdk_routing_Maneuver_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<Maneuver> heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_fromFfi(Pointer<Void> handle) {
  final result = List<Maneuver>();
  final _iterator_handle = _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_iterator(handle);
  while (_heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_Maneuver_fromFfi(_element_handle));
    } finally {
      sdk_routing_Maneuver_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_release_handle(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_create_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_release_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_toFfi_nullable(List<Maneuver> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_toFfi(value);
  final result = _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_create_handle_nullable(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_releaseFfiHandle(_handle);
  return result;
}

List<Maneuver> heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_get_value_nullable(handle);
  final result = heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_fromFfi(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_ListOf_sdk_routing_Maneuver_release_handle_nullable(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_PostAction_create_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_PostAction_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_PostAction_insert'));
final _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_PostAction_iterator'));
final _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_PostAction_iterator_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_PostAction_iterator_is_valid'));
final _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_PostAction_iterator_increment'));
final _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_PostAction_iterator_get'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_PostAction_toFfi(List<PostAction> value) {
  final _result = _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_PostAction_toFfi(element);
    _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_insert(_result, _element_handle);
    sdk_routing_PostAction_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<PostAction> heresdk_routing_bindings_ListOf_sdk_routing_PostAction_fromFfi(Pointer<Void> handle) {
  final result = List<PostAction>();
  final _iterator_handle = _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_iterator(handle);
  while (_heresdk_routing_bindings_ListOf_sdk_routing_PostAction_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_PostAction_fromFfi(_element_handle));
    } finally {
      sdk_routing_PostAction_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_PostAction_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_release_handle(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_PostAction_create_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_PostAction_release_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_PostAction_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_PostAction_toFfi_nullable(List<PostAction> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_ListOf_sdk_routing_PostAction_toFfi(value);
  final result = _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_create_handle_nullable(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_PostAction_releaseFfiHandle(_handle);
  return result;
}

List<PostAction> heresdk_routing_bindings_ListOf_sdk_routing_PostAction_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_get_value_nullable(handle);
  final result = heresdk_routing_bindings_ListOf_sdk_routing_PostAction_fromFfi(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_PostAction_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_PostAction_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_ListOf_sdk_routing_PostAction_release_handle_nullable(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_create_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_insert'));
final _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_iterator'));
final _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_iterator_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_iterator_is_valid'));
final _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_iterator_increment'));
final _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_iterator_get'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_toFfi(List<RoadFeatures> value) {
  final _result = _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_RoadFeatures_toFfi(element);
    _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_insert(_result, _element_handle);
    sdk_routing_RoadFeatures_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<RoadFeatures> heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_fromFfi(Pointer<Void> handle) {
  final result = List<RoadFeatures>();
  final _iterator_handle = _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_iterator(handle);
  while (_heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_RoadFeatures_fromFfi(_element_handle));
    } finally {
      sdk_routing_RoadFeatures_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_release_handle(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_create_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_release_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_toFfi_nullable(List<RoadFeatures> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_toFfi(value);
  final result = _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_create_handle_nullable(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_releaseFfiHandle(_handle);
  return result;
}

List<RoadFeatures> heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_get_value_nullable(handle);
  final result = heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_fromFfi(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_ListOf_sdk_routing_RoadFeatures_release_handle_nullable(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_Route_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Route_create_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Route_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Route_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Route_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Route_insert'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Route_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Route_iterator'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Route_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Route_iterator_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Route_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Route_iterator_is_valid'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Route_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Route_iterator_increment'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Route_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Route_iterator_get'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_Route_toFfi(List<Route> value) {
  final _result = _heresdk_routing_bindings_ListOf_sdk_routing_Route_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_Route_toFfi(element);
    _heresdk_routing_bindings_ListOf_sdk_routing_Route_insert(_result, _element_handle);
    sdk_routing_Route_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<Route> heresdk_routing_bindings_ListOf_sdk_routing_Route_fromFfi(Pointer<Void> handle) {
  final result = List<Route>();
  final _iterator_handle = _heresdk_routing_bindings_ListOf_sdk_routing_Route_iterator(handle);
  while (_heresdk_routing_bindings_ListOf_sdk_routing_Route_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_bindings_ListOf_sdk_routing_Route_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_Route_fromFfi(_element_handle));
    } finally {
      sdk_routing_Route_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_bindings_ListOf_sdk_routing_Route_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_ListOf_sdk_routing_Route_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_Route_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_ListOf_sdk_routing_Route_release_handle(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_Route_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Route_create_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Route_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Route_release_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Route_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Route_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_Route_toFfi_nullable(List<Route> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_ListOf_sdk_routing_Route_toFfi(value);
  final result = _heresdk_routing_bindings_ListOf_sdk_routing_Route_create_handle_nullable(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_Route_releaseFfiHandle(_handle);
  return result;
}

List<Route> heresdk_routing_bindings_ListOf_sdk_routing_Route_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_ListOf_sdk_routing_Route_get_value_nullable(handle);
  final result = heresdk_routing_bindings_ListOf_sdk_routing_Route_fromFfi(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_Route_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_Route_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_ListOf_sdk_routing_Route_release_handle_nullable(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_Section_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Section_create_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Section_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Section_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Section_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Section_insert'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Section_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Section_iterator'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Section_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Section_iterator_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Section_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Section_iterator_is_valid'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Section_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Section_iterator_increment'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Section_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Section_iterator_get'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_Section_toFfi(List<Section> value) {
  final _result = _heresdk_routing_bindings_ListOf_sdk_routing_Section_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_Section_toFfi(element);
    _heresdk_routing_bindings_ListOf_sdk_routing_Section_insert(_result, _element_handle);
    sdk_routing_Section_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<Section> heresdk_routing_bindings_ListOf_sdk_routing_Section_fromFfi(Pointer<Void> handle) {
  final result = List<Section>();
  final _iterator_handle = _heresdk_routing_bindings_ListOf_sdk_routing_Section_iterator(handle);
  while (_heresdk_routing_bindings_ListOf_sdk_routing_Section_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_bindings_ListOf_sdk_routing_Section_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_Section_fromFfi(_element_handle));
    } finally {
      sdk_routing_Section_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_bindings_ListOf_sdk_routing_Section_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_ListOf_sdk_routing_Section_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_Section_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_ListOf_sdk_routing_Section_release_handle(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_Section_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Section_create_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Section_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Section_release_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Section_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Section_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_Section_toFfi_nullable(List<Section> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_ListOf_sdk_routing_Section_toFfi(value);
  final result = _heresdk_routing_bindings_ListOf_sdk_routing_Section_create_handle_nullable(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_Section_releaseFfiHandle(_handle);
  return result;
}

List<Section> heresdk_routing_bindings_ListOf_sdk_routing_Section_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_ListOf_sdk_routing_Section_get_value_nullable(handle);
  final result = heresdk_routing_bindings_ListOf_sdk_routing_Section_fromFfi(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_Section_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_Section_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_ListOf_sdk_routing_Section_release_handle_nullable(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_create_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_insert'));
final _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_iterator'));
final _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_iterator_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_iterator_is_valid'));
final _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_iterator_increment'));
final _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_iterator_get'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_toFfi(List<StreetAttributes> value) {
  final _result = _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_StreetAttributes_toFfi(element);
    _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_insert(_result, _element_handle);
    sdk_routing_StreetAttributes_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<StreetAttributes> heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_fromFfi(Pointer<Void> handle) {
  final result = List<StreetAttributes>();
  final _iterator_handle = _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_iterator(handle);
  while (_heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_StreetAttributes_fromFfi(_element_handle));
    } finally {
      sdk_routing_StreetAttributes_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_release_handle(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_create_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_release_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_toFfi_nullable(List<StreetAttributes> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_toFfi(value);
  final result = _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_create_handle_nullable(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_releaseFfiHandle(_handle);
  return result;
}

List<StreetAttributes> heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_get_value_nullable(handle);
  final result = heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_fromFfi(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_ListOf_sdk_routing_StreetAttributes_release_handle_nullable(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_create_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_insert'));
final _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_iterator'));
final _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_is_valid'));
final _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_increment'));
final _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_get'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_toFfi(List<TrafficSpeed> value) {
  final _result = _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_TrafficSpeed_toFfi(element);
    _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_insert(_result, _element_handle);
    sdk_routing_TrafficSpeed_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<TrafficSpeed> heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_fromFfi(Pointer<Void> handle) {
  final result = List<TrafficSpeed>();
  final _iterator_handle = _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_iterator(handle);
  while (_heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_TrafficSpeed_fromFfi(_element_handle));
    } finally {
      sdk_routing_TrafficSpeed_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_release_handle(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_create_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_release_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_toFfi_nullable(List<TrafficSpeed> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_toFfi(value);
  final result = _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_create_handle_nullable(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_releaseFfiHandle(_handle);
  return result;
}

List<TrafficSpeed> heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_get_value_nullable(handle);
  final result = heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_fromFfi(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_ListOf_sdk_routing_TrafficSpeed_release_handle_nullable(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_create_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_insert'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_iterator'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_iterator_release_handle'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_iterator_is_valid'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_iterator_increment'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_iterator_get'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_toFfi(List<Waypoint> value) {
  final _result = _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_Waypoint_toFfi(element);
    _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_insert(_result, _element_handle);
    sdk_routing_Waypoint_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<Waypoint> heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_fromFfi(Pointer<Void> handle) {
  final result = List<Waypoint>();
  final _iterator_handle = _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_iterator(handle);
  while (_heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_Waypoint_fromFfi(_element_handle));
    } finally {
      sdk_routing_Waypoint_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_release_handle(handle);

final _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_create_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_release_handle_nullable'));
final _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_toFfi_nullable(List<Waypoint> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_toFfi(value);
  final result = _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_create_handle_nullable(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(_handle);
  return result;
}

List<Waypoint> heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_get_value_nullable(handle);
  final result = heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_fromFfi(_handle);
  heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_ListOf_sdk_routing_Waypoint_release_handle_nullable(handle);

final _heresdk_routing_bindings_MapOf_Double_to_Double_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_MapOf_Double_to_Double_create_handle'));
final _heresdk_routing_bindings_MapOf_Double_to_Double_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_MapOf_Double_to_Double_release_handle'));
final _heresdk_routing_bindings_MapOf_Double_to_Double_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Double, Double),
    void Function(Pointer<Void>, double, double)
  >('here_sdk_heresdk_routing_bindings_MapOf_Double_to_Double_put'));
final _heresdk_routing_bindings_MapOf_Double_to_Double_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_MapOf_Double_to_Double_iterator'));
final _heresdk_routing_bindings_MapOf_Double_to_Double_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_MapOf_Double_to_Double_iterator_release_handle'));
final _heresdk_routing_bindings_MapOf_Double_to_Double_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_MapOf_Double_to_Double_iterator_is_valid'));
final _heresdk_routing_bindings_MapOf_Double_to_Double_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_MapOf_Double_to_Double_iterator_increment'));
final _heresdk_routing_bindings_MapOf_Double_to_Double_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_MapOf_Double_to_Double_iterator_get_key'));
final _heresdk_routing_bindings_MapOf_Double_to_Double_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_MapOf_Double_to_Double_iterator_get_value'));

Pointer<Void> heresdk_routing_bindings_MapOf_Double_to_Double_toFfi(Map<double, double> value) {
  final _result = _heresdk_routing_bindings_MapOf_Double_to_Double_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = (entry.value);
    _heresdk_routing_bindings_MapOf_Double_to_Double_put(_result, _key_handle, _value_handle);
    (_key_handle);
    (_value_handle);
  }
  return _result;
}

Map<double, double> heresdk_routing_bindings_MapOf_Double_to_Double_fromFfi(Pointer<Void> handle) {
  final result = Map<double, double>();
  final _iterator_handle = _heresdk_routing_bindings_MapOf_Double_to_Double_iterator(handle);
  while (_heresdk_routing_bindings_MapOf_Double_to_Double_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _heresdk_routing_bindings_MapOf_Double_to_Double_iterator_get_key(_iterator_handle);
    final _value_handle = _heresdk_routing_bindings_MapOf_Double_to_Double_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        (_value_handle);
    } finally {
      (_key_handle);
      (_value_handle);
    }
    _heresdk_routing_bindings_MapOf_Double_to_Double_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_MapOf_Double_to_Double_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_MapOf_Double_to_Double_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_MapOf_Double_to_Double_release_handle(handle);

final _heresdk_routing_bindings_MapOf_Double_to_Double_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_MapOf_Double_to_Double_create_handle_nullable'));
final _heresdk_routing_bindings_MapOf_Double_to_Double_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_MapOf_Double_to_Double_release_handle_nullable'));
final _heresdk_routing_bindings_MapOf_Double_to_Double_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_MapOf_Double_to_Double_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_MapOf_Double_to_Double_toFfi_nullable(Map<double, double> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_MapOf_Double_to_Double_toFfi(value);
  final result = _heresdk_routing_bindings_MapOf_Double_to_Double_create_handle_nullable(_handle);
  heresdk_routing_bindings_MapOf_Double_to_Double_releaseFfiHandle(_handle);
  return result;
}

Map<double, double> heresdk_routing_bindings_MapOf_Double_to_Double_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_MapOf_Double_to_Double_get_value_nullable(handle);
  final result = heresdk_routing_bindings_MapOf_Double_to_Double_fromFfi(_handle);
  heresdk_routing_bindings_MapOf_Double_to_Double_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_MapOf_Double_to_Double_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_MapOf_Double_to_Double_release_handle_nullable(handle);

final _heresdk_routing_bindings_MapOf_Int_to_Double_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_bindings_MapOf_Int_to_Double_create_handle'));
final _heresdk_routing_bindings_MapOf_Int_to_Double_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_MapOf_Int_to_Double_release_handle'));
final _heresdk_routing_bindings_MapOf_Int_to_Double_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Double),
    void Function(Pointer<Void>, int, double)
  >('here_sdk_heresdk_routing_bindings_MapOf_Int_to_Double_put'));
final _heresdk_routing_bindings_MapOf_Int_to_Double_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_MapOf_Int_to_Double_iterator'));
final _heresdk_routing_bindings_MapOf_Int_to_Double_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_MapOf_Int_to_Double_iterator_release_handle'));
final _heresdk_routing_bindings_MapOf_Int_to_Double_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_MapOf_Int_to_Double_iterator_is_valid'));
final _heresdk_routing_bindings_MapOf_Int_to_Double_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_MapOf_Int_to_Double_iterator_increment'));
final _heresdk_routing_bindings_MapOf_Int_to_Double_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_MapOf_Int_to_Double_iterator_get_key'));
final _heresdk_routing_bindings_MapOf_Int_to_Double_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
>('here_sdk_heresdk_routing_bindings_MapOf_Int_to_Double_iterator_get_value'));

Pointer<Void> heresdk_routing_bindings_MapOf_Int_to_Double_toFfi(Map<int, double> value) {
  final _result = _heresdk_routing_bindings_MapOf_Int_to_Double_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = (entry.value);
    _heresdk_routing_bindings_MapOf_Int_to_Double_put(_result, _key_handle, _value_handle);
    (_key_handle);
    (_value_handle);
  }
  return _result;
}

Map<int, double> heresdk_routing_bindings_MapOf_Int_to_Double_fromFfi(Pointer<Void> handle) {
  final result = Map<int, double>();
  final _iterator_handle = _heresdk_routing_bindings_MapOf_Int_to_Double_iterator(handle);
  while (_heresdk_routing_bindings_MapOf_Int_to_Double_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _heresdk_routing_bindings_MapOf_Int_to_Double_iterator_get_key(_iterator_handle);
    final _value_handle = _heresdk_routing_bindings_MapOf_Int_to_Double_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        (_value_handle);
    } finally {
      (_key_handle);
      (_value_handle);
    }
    _heresdk_routing_bindings_MapOf_Int_to_Double_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_bindings_MapOf_Int_to_Double_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_bindings_MapOf_Int_to_Double_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_bindings_MapOf_Int_to_Double_release_handle(handle);

final _heresdk_routing_bindings_MapOf_Int_to_Double_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_MapOf_Int_to_Double_create_handle_nullable'));
final _heresdk_routing_bindings_MapOf_Int_to_Double_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_MapOf_Int_to_Double_release_handle_nullable'));
final _heresdk_routing_bindings_MapOf_Int_to_Double_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_bindings_MapOf_Int_to_Double_get_value_nullable'));

Pointer<Void> heresdk_routing_bindings_MapOf_Int_to_Double_toFfi_nullable(Map<int, double> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_bindings_MapOf_Int_to_Double_toFfi(value);
  final result = _heresdk_routing_bindings_MapOf_Int_to_Double_create_handle_nullable(_handle);
  heresdk_routing_bindings_MapOf_Int_to_Double_releaseFfiHandle(_handle);
  return result;
}

Map<int, double> heresdk_routing_bindings_MapOf_Int_to_Double_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_bindings_MapOf_Int_to_Double_get_value_nullable(handle);
  final result = heresdk_routing_bindings_MapOf_Int_to_Double_fromFfi(_handle);
  heresdk_routing_bindings_MapOf_Int_to_Double_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_bindings_MapOf_Int_to_Double_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_bindings_MapOf_Int_to_Double_release_handle_nullable(handle);


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























final _heresdk_routing_common_bindings_ListOf_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_ListOf_String_create_handle'));
final _heresdk_routing_common_bindings_ListOf_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_String_release_handle'));
final _heresdk_routing_common_bindings_ListOf_String_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_String_insert'));
final _heresdk_routing_common_bindings_ListOf_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_String_iterator'));
final _heresdk_routing_common_bindings_ListOf_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_String_iterator_release_handle'));
final _heresdk_routing_common_bindings_ListOf_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_String_iterator_is_valid'));
final _heresdk_routing_common_bindings_ListOf_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_String_iterator_increment'));
final _heresdk_routing_common_bindings_ListOf_String_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_String_iterator_get'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_String_toFfi(List<String> value) {
  final _result = _heresdk_routing_common_bindings_ListOf_String_create_handle();
  for (final element in value) {
    final _element_handle = String_toFfi(element);
    _heresdk_routing_common_bindings_ListOf_String_insert(_result, _element_handle);
    String_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<String> heresdk_routing_common_bindings_ListOf_String_fromFfi(Pointer<Void> handle) {
  final result = List<String>();
  final _iterator_handle = _heresdk_routing_common_bindings_ListOf_String_iterator(handle);
  while (_heresdk_routing_common_bindings_ListOf_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_common_bindings_ListOf_String_iterator_get(_iterator_handle);
    try {
      result.add(String_fromFfi(_element_handle));
    } finally {
      String_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_common_bindings_ListOf_String_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_ListOf_String_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_String_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_ListOf_String_release_handle(handle);

final _heresdk_routing_common_bindings_ListOf_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_String_create_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_String_release_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_String_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_String_toFfi_nullable(List<String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_ListOf_String_toFfi(value);
  final result = _heresdk_routing_common_bindings_ListOf_String_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

List<String> heresdk_routing_common_bindings_ListOf_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_ListOf_String_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_ListOf_String_fromFfi(_handle);
  heresdk_routing_common_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_ListOf_String_release_handle_nullable(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_create_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_insert'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_iterator'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_iterator_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_iterator_is_valid'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_iterator_increment'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_iterator_get'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_toFfi(List<CountryCode> value) {
  final _result = _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_create_handle();
  for (final element in value) {
    final _element_handle = sdk_core_CountryCode_toFfi(element);
    _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_insert(_result, _element_handle);
    sdk_core_CountryCode_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<CountryCode> heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_fromFfi(Pointer<Void> handle) {
  final result = List<CountryCode>();
  final _iterator_handle = _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_iterator(handle);
  while (_heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_iterator_get(_iterator_handle);
    try {
      result.add(sdk_core_CountryCode_fromFfi(_element_handle));
    } finally {
      sdk_core_CountryCode_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_release_handle(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_create_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_release_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_toFfi_nullable(List<CountryCode> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_toFfi(value);
  final result = _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(_handle);
  return result;
}

List<CountryCode> heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_fromFfi(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_release_handle_nullable(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_create_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_insert'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_iterator'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_iterator_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_iterator_is_valid'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_iterator_increment'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_iterator_get'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_toFfi(List<GeoBox> value) {
  final _result = _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_create_handle();
  for (final element in value) {
    final _element_handle = sdk_core_GeoBox_toFfi(element);
    _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_insert(_result, _element_handle);
    sdk_core_GeoBox_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<GeoBox> heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_fromFfi(Pointer<Void> handle) {
  final result = List<GeoBox>();
  final _iterator_handle = _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_iterator(handle);
  while (_heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_iterator_get(_iterator_handle);
    try {
      result.add(sdk_core_GeoBox_fromFfi(_element_handle));
    } finally {
      sdk_core_GeoBox_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_release_handle(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_create_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_release_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_toFfi_nullable(List<GeoBox> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_toFfi(value);
  final result = _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_releaseFfiHandle(_handle);
  return result;
}

List<GeoBox> heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_fromFfi(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_release_handle_nullable(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_insert'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(List<GeoCoordinates> value) {
  final _result = _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle();
  for (final element in value) {
    final _element_handle = sdk_core_GeoCoordinates_toFfi(element);
    _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_insert(_result, _element_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<GeoCoordinates> heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(Pointer<Void> handle) {
  final result = List<GeoCoordinates>();
  final _iterator_handle = _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator(handle);
  while (_heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get(_iterator_handle);
    try {
      result.add(sdk_core_GeoCoordinates_fromFfi(_element_handle));
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_toFfi_nullable(List<GeoCoordinates> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(value);
  final result = _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

List<GeoCoordinates> heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_create_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_insert'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_is_valid'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_increment'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_get'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_toFfi(List<ChargingConnectorType> value) {
  final _result = _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_ChargingConnectorType_toFfi(element);
    _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_insert(_result, _element_handle);
    sdk_routing_ChargingConnectorType_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<ChargingConnectorType> heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_fromFfi(Pointer<Void> handle) {
  final result = List<ChargingConnectorType>();
  final _iterator_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator(handle);
  while (_heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_ChargingConnectorType_fromFfi(_element_handle));
    } finally {
      sdk_routing_ChargingConnectorType_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_release_handle(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_create_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_release_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_toFfi_nullable(List<ChargingConnectorType> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_toFfi(value);
  final result = _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_releaseFfiHandle(_handle);
  return result;
}

List<ChargingConnectorType> heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_fromFfi(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_ListOf_sdk_routing_ChargingConnectorType_release_handle_nullable(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_create_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_insert'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_iterator'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_iterator_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_iterator_is_valid'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_iterator_increment'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_iterator_get'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_toFfi(List<HazardousGood> value) {
  final _result = _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_HazardousGood_toFfi(element);
    _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_insert(_result, _element_handle);
    sdk_routing_HazardousGood_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<HazardousGood> heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_fromFfi(Pointer<Void> handle) {
  final result = List<HazardousGood>();
  final _iterator_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_iterator(handle);
  while (_heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_HazardousGood_fromFfi(_element_handle));
    } finally {
      sdk_routing_HazardousGood_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_release_handle(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_create_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_release_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_toFfi_nullable(List<HazardousGood> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_toFfi(value);
  final result = _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_releaseFfiHandle(_handle);
  return result;
}

List<HazardousGood> heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_fromFfi(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_release_handle_nullable(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Link_create_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Link_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Link_insert'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Link_iterator'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Link_iterator_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Link_iterator_is_valid'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Link_iterator_increment'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Link_iterator_get'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_Link_toFfi(List<Link> value) {
  final _result = _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_Link_toFfi(element);
    _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_insert(_result, _element_handle);
    sdk_routing_Link_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<Link> heresdk_routing_common_bindings_ListOf_sdk_routing_Link_fromFfi(Pointer<Void> handle) {
  final result = List<Link>();
  final _iterator_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_iterator(handle);
  while (_heresdk_routing_common_bindings_ListOf_sdk_routing_Link_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_Link_fromFfi(_element_handle));
    } finally {
      sdk_routing_Link_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_Link_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_release_handle(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Link_create_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Link_release_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Link_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_Link_toFfi_nullable(List<Link> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_ListOf_sdk_routing_Link_toFfi(value);
  final result = _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_Link_releaseFfiHandle(_handle);
  return result;
}

List<Link> heresdk_routing_common_bindings_ListOf_sdk_routing_Link_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_ListOf_sdk_routing_Link_fromFfi(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_Link_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_Link_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_ListOf_sdk_routing_Link_release_handle_nullable(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_create_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_insert'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_iterator'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_iterator_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_iterator_is_valid'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_iterator_increment'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_iterator_get'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_toFfi(List<Maneuver> value) {
  final _result = _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_Maneuver_toFfi(element);
    _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_insert(_result, _element_handle);
    sdk_routing_Maneuver_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<Maneuver> heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_fromFfi(Pointer<Void> handle) {
  final result = List<Maneuver>();
  final _iterator_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_iterator(handle);
  while (_heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_Maneuver_fromFfi(_element_handle));
    } finally {
      sdk_routing_Maneuver_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_release_handle(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_create_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_release_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_toFfi_nullable(List<Maneuver> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_toFfi(value);
  final result = _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_releaseFfiHandle(_handle);
  return result;
}

List<Maneuver> heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_fromFfi(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_ListOf_sdk_routing_Maneuver_release_handle_nullable(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_create_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_insert'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_iterator'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_iterator_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_iterator_is_valid'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_iterator_increment'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_iterator_get'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_toFfi(List<PostAction> value) {
  final _result = _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_PostAction_toFfi(element);
    _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_insert(_result, _element_handle);
    sdk_routing_PostAction_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<PostAction> heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_fromFfi(Pointer<Void> handle) {
  final result = List<PostAction>();
  final _iterator_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_iterator(handle);
  while (_heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_PostAction_fromFfi(_element_handle));
    } finally {
      sdk_routing_PostAction_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_release_handle(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_create_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_release_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_toFfi_nullable(List<PostAction> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_toFfi(value);
  final result = _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_releaseFfiHandle(_handle);
  return result;
}

List<PostAction> heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_fromFfi(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_ListOf_sdk_routing_PostAction_release_handle_nullable(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_create_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_insert'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_iterator'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_iterator_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_iterator_is_valid'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_iterator_increment'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_iterator_get'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_toFfi(List<RoadFeatures> value) {
  final _result = _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_RoadFeatures_toFfi(element);
    _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_insert(_result, _element_handle);
    sdk_routing_RoadFeatures_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<RoadFeatures> heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_fromFfi(Pointer<Void> handle) {
  final result = List<RoadFeatures>();
  final _iterator_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_iterator(handle);
  while (_heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_RoadFeatures_fromFfi(_element_handle));
    } finally {
      sdk_routing_RoadFeatures_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_release_handle(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_create_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_release_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_toFfi_nullable(List<RoadFeatures> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_toFfi(value);
  final result = _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_releaseFfiHandle(_handle);
  return result;
}

List<RoadFeatures> heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_fromFfi(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_release_handle_nullable(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Route_create_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Route_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Route_insert'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Route_iterator'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Route_iterator_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Route_iterator_is_valid'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Route_iterator_increment'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Route_iterator_get'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_Route_toFfi(List<Route> value) {
  final _result = _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_Route_toFfi(element);
    _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_insert(_result, _element_handle);
    sdk_routing_Route_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<Route> heresdk_routing_common_bindings_ListOf_sdk_routing_Route_fromFfi(Pointer<Void> handle) {
  final result = List<Route>();
  final _iterator_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_iterator(handle);
  while (_heresdk_routing_common_bindings_ListOf_sdk_routing_Route_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_Route_fromFfi(_element_handle));
    } finally {
      sdk_routing_Route_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_Route_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_release_handle(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Route_create_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Route_release_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Route_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_Route_toFfi_nullable(List<Route> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_ListOf_sdk_routing_Route_toFfi(value);
  final result = _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_Route_releaseFfiHandle(_handle);
  return result;
}

List<Route> heresdk_routing_common_bindings_ListOf_sdk_routing_Route_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_ListOf_sdk_routing_Route_fromFfi(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_Route_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_Route_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_ListOf_sdk_routing_Route_release_handle_nullable(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Section_create_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Section_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Section_insert'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Section_iterator'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Section_iterator_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Section_iterator_is_valid'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Section_iterator_increment'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Section_iterator_get'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_Section_toFfi(List<Section> value) {
  final _result = _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_Section_toFfi(element);
    _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_insert(_result, _element_handle);
    sdk_routing_Section_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<Section> heresdk_routing_common_bindings_ListOf_sdk_routing_Section_fromFfi(Pointer<Void> handle) {
  final result = List<Section>();
  final _iterator_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_iterator(handle);
  while (_heresdk_routing_common_bindings_ListOf_sdk_routing_Section_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_Section_fromFfi(_element_handle));
    } finally {
      sdk_routing_Section_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_Section_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_release_handle(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Section_create_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Section_release_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Section_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_Section_toFfi_nullable(List<Section> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_ListOf_sdk_routing_Section_toFfi(value);
  final result = _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_Section_releaseFfiHandle(_handle);
  return result;
}

List<Section> heresdk_routing_common_bindings_ListOf_sdk_routing_Section_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_ListOf_sdk_routing_Section_fromFfi(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_Section_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_Section_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_ListOf_sdk_routing_Section_release_handle_nullable(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_create_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_insert'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_iterator'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_iterator_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_iterator_is_valid'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_iterator_increment'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_iterator_get'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_toFfi(List<StreetAttributes> value) {
  final _result = _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_StreetAttributes_toFfi(element);
    _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_insert(_result, _element_handle);
    sdk_routing_StreetAttributes_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<StreetAttributes> heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_fromFfi(Pointer<Void> handle) {
  final result = List<StreetAttributes>();
  final _iterator_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_iterator(handle);
  while (_heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_StreetAttributes_fromFfi(_element_handle));
    } finally {
      sdk_routing_StreetAttributes_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_release_handle(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_create_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_release_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_toFfi_nullable(List<StreetAttributes> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_toFfi(value);
  final result = _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_releaseFfiHandle(_handle);
  return result;
}

List<StreetAttributes> heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_fromFfi(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_release_handle_nullable(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_create_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_insert'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_iterator'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_is_valid'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_increment'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_get'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_toFfi(List<TrafficSpeed> value) {
  final _result = _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_TrafficSpeed_toFfi(element);
    _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_insert(_result, _element_handle);
    sdk_routing_TrafficSpeed_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<TrafficSpeed> heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_fromFfi(Pointer<Void> handle) {
  final result = List<TrafficSpeed>();
  final _iterator_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_iterator(handle);
  while (_heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_TrafficSpeed_fromFfi(_element_handle));
    } finally {
      sdk_routing_TrafficSpeed_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_release_handle(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_create_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_release_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_toFfi_nullable(List<TrafficSpeed> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_toFfi(value);
  final result = _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_releaseFfiHandle(_handle);
  return result;
}

List<TrafficSpeed> heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_fromFfi(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_ListOf_sdk_routing_TrafficSpeed_release_handle_nullable(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_create_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_insert'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_iterator'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_iterator_release_handle'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_iterator_is_valid'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_iterator_increment'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_iterator_get'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_toFfi(List<Waypoint> value) {
  final _result = _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_create_handle();
  for (final element in value) {
    final _element_handle = sdk_routing_Waypoint_toFfi(element);
    _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_insert(_result, _element_handle);
    sdk_routing_Waypoint_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<Waypoint> heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_fromFfi(Pointer<Void> handle) {
  final result = List<Waypoint>();
  final _iterator_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_iterator(handle);
  while (_heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_iterator_get(_iterator_handle);
    try {
      result.add(sdk_routing_Waypoint_fromFfi(_element_handle));
    } finally {
      sdk_routing_Waypoint_releaseFfiHandle(_element_handle);
    }
    _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_release_handle(handle);

final _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_create_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_release_handle_nullable'));
final _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_toFfi_nullable(List<Waypoint> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_toFfi(value);
  final result = _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(_handle);
  return result;
}

List<Waypoint> heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_fromFfi(_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_ListOf_sdk_routing_Waypoint_release_handle_nullable(handle);

final _heresdk_routing_common_bindings_MapOf_Double_to_Double_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_MapOf_Double_to_Double_create_handle'));
final _heresdk_routing_common_bindings_MapOf_Double_to_Double_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_MapOf_Double_to_Double_release_handle'));
final _heresdk_routing_common_bindings_MapOf_Double_to_Double_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Double, Double),
    void Function(Pointer<Void>, double, double)
  >('here_sdk_heresdk_routing_common_bindings_MapOf_Double_to_Double_put'));
final _heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator'));
final _heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator_release_handle'));
final _heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator_is_valid'));
final _heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator_increment'));
final _heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator_get_key'));
final _heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator_get_value'));

Pointer<Void> heresdk_routing_common_bindings_MapOf_Double_to_Double_toFfi(Map<double, double> value) {
  final _result = _heresdk_routing_common_bindings_MapOf_Double_to_Double_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = (entry.value);
    _heresdk_routing_common_bindings_MapOf_Double_to_Double_put(_result, _key_handle, _value_handle);
    (_key_handle);
    (_value_handle);
  }
  return _result;
}

Map<double, double> heresdk_routing_common_bindings_MapOf_Double_to_Double_fromFfi(Pointer<Void> handle) {
  final result = Map<double, double>();
  final _iterator_handle = _heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator(handle);
  while (_heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator_get_key(_iterator_handle);
    final _value_handle = _heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        (_value_handle);
    } finally {
      (_key_handle);
      (_value_handle);
    }
    _heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_MapOf_Double_to_Double_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_MapOf_Double_to_Double_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_MapOf_Double_to_Double_release_handle(handle);

final _heresdk_routing_common_bindings_MapOf_Double_to_Double_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_MapOf_Double_to_Double_create_handle_nullable'));
final _heresdk_routing_common_bindings_MapOf_Double_to_Double_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_MapOf_Double_to_Double_release_handle_nullable'));
final _heresdk_routing_common_bindings_MapOf_Double_to_Double_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_MapOf_Double_to_Double_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_MapOf_Double_to_Double_toFfi_nullable(Map<double, double> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_MapOf_Double_to_Double_toFfi(value);
  final result = _heresdk_routing_common_bindings_MapOf_Double_to_Double_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_MapOf_Double_to_Double_releaseFfiHandle(_handle);
  return result;
}

Map<double, double> heresdk_routing_common_bindings_MapOf_Double_to_Double_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_MapOf_Double_to_Double_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_MapOf_Double_to_Double_fromFfi(_handle);
  heresdk_routing_common_bindings_MapOf_Double_to_Double_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_MapOf_Double_to_Double_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_MapOf_Double_to_Double_release_handle_nullable(handle);

final _heresdk_routing_common_bindings_MapOf_Int_to_Double_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_routing_common_bindings_MapOf_Int_to_Double_create_handle'));
final _heresdk_routing_common_bindings_MapOf_Int_to_Double_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_MapOf_Int_to_Double_release_handle'));
final _heresdk_routing_common_bindings_MapOf_Int_to_Double_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Double),
    void Function(Pointer<Void>, int, double)
  >('here_sdk_heresdk_routing_common_bindings_MapOf_Int_to_Double_put'));
final _heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator'));
final _heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator_release_handle'));
final _heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator_is_valid'));
final _heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator_increment'));
final _heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator_get_key'));
final _heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
>('here_sdk_heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator_get_value'));

Pointer<Void> heresdk_routing_common_bindings_MapOf_Int_to_Double_toFfi(Map<int, double> value) {
  final _result = _heresdk_routing_common_bindings_MapOf_Int_to_Double_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = (entry.value);
    _heresdk_routing_common_bindings_MapOf_Int_to_Double_put(_result, _key_handle, _value_handle);
    (_key_handle);
    (_value_handle);
  }
  return _result;
}

Map<int, double> heresdk_routing_common_bindings_MapOf_Int_to_Double_fromFfi(Pointer<Void> handle) {
  final result = Map<int, double>();
  final _iterator_handle = _heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator(handle);
  while (_heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator_get_key(_iterator_handle);
    final _value_handle = _heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        (_value_handle);
    } finally {
      (_key_handle);
      (_value_handle);
    }
    _heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator_increment(_iterator_handle);
  }
  _heresdk_routing_common_bindings_MapOf_Int_to_Double_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_routing_common_bindings_MapOf_Int_to_Double_releaseFfiHandle(Pointer<Void> handle) => _heresdk_routing_common_bindings_MapOf_Int_to_Double_release_handle(handle);

final _heresdk_routing_common_bindings_MapOf_Int_to_Double_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_MapOf_Int_to_Double_create_handle_nullable'));
final _heresdk_routing_common_bindings_MapOf_Int_to_Double_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_MapOf_Int_to_Double_release_handle_nullable'));
final _heresdk_routing_common_bindings_MapOf_Int_to_Double_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_routing_common_bindings_MapOf_Int_to_Double_get_value_nullable'));

Pointer<Void> heresdk_routing_common_bindings_MapOf_Int_to_Double_toFfi_nullable(Map<int, double> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_routing_common_bindings_MapOf_Int_to_Double_toFfi(value);
  final result = _heresdk_routing_common_bindings_MapOf_Int_to_Double_create_handle_nullable(_handle);
  heresdk_routing_common_bindings_MapOf_Int_to_Double_releaseFfiHandle(_handle);
  return result;
}

Map<int, double> heresdk_routing_common_bindings_MapOf_Int_to_Double_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_routing_common_bindings_MapOf_Int_to_Double_get_value_nullable(handle);
  final result = heresdk_routing_common_bindings_MapOf_Int_to_Double_fromFfi(_handle);
  heresdk_routing_common_bindings_MapOf_Int_to_Double_releaseFfiHandle(_handle);
  return result;
}

void heresdk_routing_common_bindings_MapOf_Int_to_Double_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_routing_common_bindings_MapOf_Int_to_Double_release_handle_nullable(handle);


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






















final _heresdk_search_bindings_ListOf_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_bindings_ListOf_String_create_handle'));
final _heresdk_search_bindings_ListOf_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_String_release_handle'));
final _heresdk_search_bindings_ListOf_String_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_String_insert'));
final _heresdk_search_bindings_ListOf_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_String_iterator'));
final _heresdk_search_bindings_ListOf_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_String_iterator_release_handle'));
final _heresdk_search_bindings_ListOf_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_String_iterator_is_valid'));
final _heresdk_search_bindings_ListOf_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_String_iterator_increment'));
final _heresdk_search_bindings_ListOf_String_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_String_iterator_get'));

Pointer<Void> heresdk_search_bindings_ListOf_String_toFfi(List<String> value) {
  final _result = _heresdk_search_bindings_ListOf_String_create_handle();
  for (final element in value) {
    final _element_handle = String_toFfi(element);
    _heresdk_search_bindings_ListOf_String_insert(_result, _element_handle);
    String_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<String> heresdk_search_bindings_ListOf_String_fromFfi(Pointer<Void> handle) {
  final result = List<String>();
  final _iterator_handle = _heresdk_search_bindings_ListOf_String_iterator(handle);
  while (_heresdk_search_bindings_ListOf_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_bindings_ListOf_String_iterator_get(_iterator_handle);
    try {
      result.add(String_fromFfi(_element_handle));
    } finally {
      String_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_bindings_ListOf_String_iterator_increment(_iterator_handle);
  }
  _heresdk_search_bindings_ListOf_String_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_bindings_ListOf_String_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_bindings_ListOf_String_release_handle(handle);

final _heresdk_search_bindings_ListOf_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_String_create_handle_nullable'));
final _heresdk_search_bindings_ListOf_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_String_release_handle_nullable'));
final _heresdk_search_bindings_ListOf_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_String_get_value_nullable'));

Pointer<Void> heresdk_search_bindings_ListOf_String_toFfi_nullable(List<String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_bindings_ListOf_String_toFfi(value);
  final result = _heresdk_search_bindings_ListOf_String_create_handle_nullable(_handle);
  heresdk_search_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

List<String> heresdk_search_bindings_ListOf_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_bindings_ListOf_String_get_value_nullable(handle);
  final result = heresdk_search_bindings_ListOf_String_fromFfi(_handle);
  heresdk_search_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_bindings_ListOf_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_bindings_ListOf_String_release_handle_nullable(handle);

final _heresdk_search_bindings_ListOf_sdk_core_CountryCode_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_core_CountryCode_create_handle'));
final _heresdk_search_bindings_ListOf_sdk_core_CountryCode_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_core_CountryCode_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_core_CountryCode_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_core_CountryCode_insert'));
final _heresdk_search_bindings_ListOf_sdk_core_CountryCode_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_core_CountryCode_iterator'));
final _heresdk_search_bindings_ListOf_sdk_core_CountryCode_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_core_CountryCode_iterator_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_core_CountryCode_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_core_CountryCode_iterator_is_valid'));
final _heresdk_search_bindings_ListOf_sdk_core_CountryCode_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_core_CountryCode_iterator_increment'));
final _heresdk_search_bindings_ListOf_sdk_core_CountryCode_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_core_CountryCode_iterator_get'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_core_CountryCode_toFfi(List<CountryCode> value) {
  final _result = _heresdk_search_bindings_ListOf_sdk_core_CountryCode_create_handle();
  for (final element in value) {
    final _element_handle = sdk_core_CountryCode_toFfi(element);
    _heresdk_search_bindings_ListOf_sdk_core_CountryCode_insert(_result, _element_handle);
    sdk_core_CountryCode_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<CountryCode> heresdk_search_bindings_ListOf_sdk_core_CountryCode_fromFfi(Pointer<Void> handle) {
  final result = List<CountryCode>();
  final _iterator_handle = _heresdk_search_bindings_ListOf_sdk_core_CountryCode_iterator(handle);
  while (_heresdk_search_bindings_ListOf_sdk_core_CountryCode_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_bindings_ListOf_sdk_core_CountryCode_iterator_get(_iterator_handle);
    try {
      result.add(sdk_core_CountryCode_fromFfi(_element_handle));
    } finally {
      sdk_core_CountryCode_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_bindings_ListOf_sdk_core_CountryCode_iterator_increment(_iterator_handle);
  }
  _heresdk_search_bindings_ListOf_sdk_core_CountryCode_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_bindings_ListOf_sdk_core_CountryCode_release_handle(handle);

final _heresdk_search_bindings_ListOf_sdk_core_CountryCode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_core_CountryCode_create_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_core_CountryCode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_core_CountryCode_release_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_core_CountryCode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_core_CountryCode_get_value_nullable'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_core_CountryCode_toFfi_nullable(List<CountryCode> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_bindings_ListOf_sdk_core_CountryCode_toFfi(value);
  final result = _heresdk_search_bindings_ListOf_sdk_core_CountryCode_create_handle_nullable(_handle);
  heresdk_search_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(_handle);
  return result;
}

List<CountryCode> heresdk_search_bindings_ListOf_sdk_core_CountryCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_bindings_ListOf_sdk_core_CountryCode_get_value_nullable(handle);
  final result = heresdk_search_bindings_ListOf_sdk_core_CountryCode_fromFfi(_handle);
  heresdk_search_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_bindings_ListOf_sdk_core_CountryCode_release_handle_nullable(handle);

final _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_create_handle'));
final _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_insert'));
final _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_iterator'));
final _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid'));
final _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment'));
final _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(List<GeoCoordinates> value) {
  final _result = _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_create_handle();
  for (final element in value) {
    final _element_handle = sdk_core_GeoCoordinates_toFfi(element);
    _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_insert(_result, _element_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<GeoCoordinates> heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(Pointer<Void> handle) {
  final result = List<GeoCoordinates>();
  final _iterator_handle = _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_iterator(handle);
  while (_heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get(_iterator_handle);
    try {
      result.add(sdk_core_GeoCoordinates_fromFfi(_element_handle));
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment(_iterator_handle);
  }
  _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_release_handle(handle);

final _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_toFfi_nullable(List<GeoCoordinates> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(value);
  final result = _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable(_handle);
  heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

List<GeoCoordinates> heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable(handle);
  final result = heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(_handle);
  heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable(handle);

final _heresdk_search_bindings_ListOf_sdk_search_Contact_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Contact_create_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_Contact_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Contact_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_Contact_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Contact_insert'));
final _heresdk_search_bindings_ListOf_sdk_search_Contact_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Contact_iterator'));
final _heresdk_search_bindings_ListOf_sdk_search_Contact_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Contact_iterator_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_Contact_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Contact_iterator_is_valid'));
final _heresdk_search_bindings_ListOf_sdk_search_Contact_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Contact_iterator_increment'));
final _heresdk_search_bindings_ListOf_sdk_search_Contact_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Contact_iterator_get'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_Contact_toFfi(List<Contact> value) {
  final _result = _heresdk_search_bindings_ListOf_sdk_search_Contact_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_Contact_toFfi(element);
    _heresdk_search_bindings_ListOf_sdk_search_Contact_insert(_result, _element_handle);
    sdk_search_Contact_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<Contact> heresdk_search_bindings_ListOf_sdk_search_Contact_fromFfi(Pointer<Void> handle) {
  final result = List<Contact>();
  final _iterator_handle = _heresdk_search_bindings_ListOf_sdk_search_Contact_iterator(handle);
  while (_heresdk_search_bindings_ListOf_sdk_search_Contact_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_bindings_ListOf_sdk_search_Contact_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_Contact_fromFfi(_element_handle));
    } finally {
      sdk_search_Contact_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_bindings_ListOf_sdk_search_Contact_iterator_increment(_iterator_handle);
  }
  _heresdk_search_bindings_ListOf_sdk_search_Contact_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_Contact_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_bindings_ListOf_sdk_search_Contact_release_handle(handle);

final _heresdk_search_bindings_ListOf_sdk_search_Contact_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Contact_create_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_Contact_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Contact_release_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_Contact_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Contact_get_value_nullable'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_Contact_toFfi_nullable(List<Contact> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_bindings_ListOf_sdk_search_Contact_toFfi(value);
  final result = _heresdk_search_bindings_ListOf_sdk_search_Contact_create_handle_nullable(_handle);
  heresdk_search_bindings_ListOf_sdk_search_Contact_releaseFfiHandle(_handle);
  return result;
}

List<Contact> heresdk_search_bindings_ListOf_sdk_search_Contact_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_bindings_ListOf_sdk_search_Contact_get_value_nullable(handle);
  final result = heresdk_search_bindings_ListOf_sdk_search_Contact_fromFfi(_handle);
  heresdk_search_bindings_ListOf_sdk_search_Contact_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_Contact_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_bindings_ListOf_sdk_search_Contact_release_handle_nullable(handle);

final _heresdk_search_bindings_ListOf_sdk_search_IndexRange_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_IndexRange_create_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_IndexRange_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_IndexRange_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_IndexRange_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_IndexRange_insert'));
final _heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator'));
final _heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_is_valid'));
final _heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_increment'));
final _heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_get'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_IndexRange_toFfi(List<IndexRange> value) {
  final _result = _heresdk_search_bindings_ListOf_sdk_search_IndexRange_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_IndexRange_toFfi(element);
    _heresdk_search_bindings_ListOf_sdk_search_IndexRange_insert(_result, _element_handle);
    sdk_search_IndexRange_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<IndexRange> heresdk_search_bindings_ListOf_sdk_search_IndexRange_fromFfi(Pointer<Void> handle) {
  final result = List<IndexRange>();
  final _iterator_handle = _heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator(handle);
  while (_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_IndexRange_fromFfi(_element_handle));
    } finally {
      sdk_search_IndexRange_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_increment(_iterator_handle);
  }
  _heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_IndexRange_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_bindings_ListOf_sdk_search_IndexRange_release_handle(handle);

final _heresdk_search_bindings_ListOf_sdk_search_IndexRange_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_IndexRange_create_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_IndexRange_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_IndexRange_release_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_IndexRange_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_IndexRange_get_value_nullable'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_IndexRange_toFfi_nullable(List<IndexRange> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_bindings_ListOf_sdk_search_IndexRange_toFfi(value);
  final result = _heresdk_search_bindings_ListOf_sdk_search_IndexRange_create_handle_nullable(_handle);
  heresdk_search_bindings_ListOf_sdk_search_IndexRange_releaseFfiHandle(_handle);
  return result;
}

List<IndexRange> heresdk_search_bindings_ListOf_sdk_search_IndexRange_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_bindings_ListOf_sdk_search_IndexRange_get_value_nullable(handle);
  final result = heresdk_search_bindings_ListOf_sdk_search_IndexRange_fromFfi(_handle);
  heresdk_search_bindings_ListOf_sdk_search_IndexRange_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_IndexRange_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_bindings_ListOf_sdk_search_IndexRange_release_handle_nullable(handle);

final _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_OpeningHours_create_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_OpeningHours_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_OpeningHours_insert'));
final _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_OpeningHours_iterator'));
final _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_OpeningHours_iterator_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_OpeningHours_iterator_is_valid'));
final _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_OpeningHours_iterator_increment'));
final _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_OpeningHours_iterator_get'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_OpeningHours_toFfi(List<OpeningHours> value) {
  final _result = _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_OpeningHours_toFfi(element);
    _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_insert(_result, _element_handle);
    sdk_search_OpeningHours_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<OpeningHours> heresdk_search_bindings_ListOf_sdk_search_OpeningHours_fromFfi(Pointer<Void> handle) {
  final result = List<OpeningHours>();
  final _iterator_handle = _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_iterator(handle);
  while (_heresdk_search_bindings_ListOf_sdk_search_OpeningHours_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_OpeningHours_fromFfi(_element_handle));
    } finally {
      sdk_search_OpeningHours_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_iterator_increment(_iterator_handle);
  }
  _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_OpeningHours_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_release_handle(handle);

final _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_OpeningHours_create_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_OpeningHours_release_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_OpeningHours_get_value_nullable'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_OpeningHours_toFfi_nullable(List<OpeningHours> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_bindings_ListOf_sdk_search_OpeningHours_toFfi(value);
  final result = _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_create_handle_nullable(_handle);
  heresdk_search_bindings_ListOf_sdk_search_OpeningHours_releaseFfiHandle(_handle);
  return result;
}

List<OpeningHours> heresdk_search_bindings_ListOf_sdk_search_OpeningHours_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_get_value_nullable(handle);
  final result = heresdk_search_bindings_ListOf_sdk_search_OpeningHours_fromFfi(_handle);
  heresdk_search_bindings_ListOf_sdk_search_OpeningHours_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_OpeningHours_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_bindings_ListOf_sdk_search_OpeningHours_release_handle_nullable(handle);

final _heresdk_search_bindings_ListOf_sdk_search_Place_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Place_create_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_Place_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Place_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_Place_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Place_insert'));
final _heresdk_search_bindings_ListOf_sdk_search_Place_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Place_iterator'));
final _heresdk_search_bindings_ListOf_sdk_search_Place_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Place_iterator_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_Place_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Place_iterator_is_valid'));
final _heresdk_search_bindings_ListOf_sdk_search_Place_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Place_iterator_increment'));
final _heresdk_search_bindings_ListOf_sdk_search_Place_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Place_iterator_get'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_Place_toFfi(List<Place> value) {
  final _result = _heresdk_search_bindings_ListOf_sdk_search_Place_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_Place_toFfi(element);
    _heresdk_search_bindings_ListOf_sdk_search_Place_insert(_result, _element_handle);
    sdk_search_Place_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<Place> heresdk_search_bindings_ListOf_sdk_search_Place_fromFfi(Pointer<Void> handle) {
  final result = List<Place>();
  final _iterator_handle = _heresdk_search_bindings_ListOf_sdk_search_Place_iterator(handle);
  while (_heresdk_search_bindings_ListOf_sdk_search_Place_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_bindings_ListOf_sdk_search_Place_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_Place_fromFfi(_element_handle));
    } finally {
      sdk_search_Place_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_bindings_ListOf_sdk_search_Place_iterator_increment(_iterator_handle);
  }
  _heresdk_search_bindings_ListOf_sdk_search_Place_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_Place_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_bindings_ListOf_sdk_search_Place_release_handle(handle);

final _heresdk_search_bindings_ListOf_sdk_search_Place_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Place_create_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_Place_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Place_release_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_Place_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Place_get_value_nullable'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_Place_toFfi_nullable(List<Place> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_bindings_ListOf_sdk_search_Place_toFfi(value);
  final result = _heresdk_search_bindings_ListOf_sdk_search_Place_create_handle_nullable(_handle);
  heresdk_search_bindings_ListOf_sdk_search_Place_releaseFfiHandle(_handle);
  return result;
}

List<Place> heresdk_search_bindings_ListOf_sdk_search_Place_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_bindings_ListOf_sdk_search_Place_get_value_nullable(handle);
  final result = heresdk_search_bindings_ListOf_sdk_search_Place_fromFfi(_handle);
  heresdk_search_bindings_ListOf_sdk_search_Place_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_Place_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_bindings_ListOf_sdk_search_Place_release_handle_nullable(handle);

final _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_create_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_insert'));
final _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_iterator'));
final _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_iterator_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_iterator_is_valid'));
final _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_iterator_increment'));
final _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_iterator_get'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_toFfi(List<PlaceCategory> value) {
  final _result = _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_PlaceCategory_toFfi(element);
    _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_insert(_result, _element_handle);
    sdk_search_PlaceCategory_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<PlaceCategory> heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_fromFfi(Pointer<Void> handle) {
  final result = List<PlaceCategory>();
  final _iterator_handle = _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_iterator(handle);
  while (_heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_PlaceCategory_fromFfi(_element_handle));
    } finally {
      sdk_search_PlaceCategory_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_iterator_increment(_iterator_handle);
  }
  _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_release_handle(handle);

final _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_create_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_release_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_get_value_nullable'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_toFfi_nullable(List<PlaceCategory> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_toFfi(value);
  final result = _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_create_handle_nullable(_handle);
  heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(_handle);
  return result;
}

List<PlaceCategory> heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_get_value_nullable(handle);
  final result = heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_fromFfi(_handle);
  heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_bindings_ListOf_sdk_search_PlaceCategory_release_handle_nullable(handle);

final _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_create_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_insert'));
final _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_iterator'));
final _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_iterator_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_iterator_is_valid'));
final _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_iterator_increment'));
final _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_iterator_get'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_toFfi(List<ScheduleDetails> value) {
  final _result = _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_ScheduleDetails_toFfi(element);
    _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_insert(_result, _element_handle);
    sdk_search_ScheduleDetails_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<ScheduleDetails> heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_fromFfi(Pointer<Void> handle) {
  final result = List<ScheduleDetails>();
  final _iterator_handle = _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_iterator(handle);
  while (_heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_ScheduleDetails_fromFfi(_element_handle));
    } finally {
      sdk_search_ScheduleDetails_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_iterator_increment(_iterator_handle);
  }
  _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_release_handle(handle);

final _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_create_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_release_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_get_value_nullable'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_toFfi_nullable(List<ScheduleDetails> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_toFfi(value);
  final result = _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_create_handle_nullable(_handle);
  heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_releaseFfiHandle(_handle);
  return result;
}

List<ScheduleDetails> heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_get_value_nullable(handle);
  final result = heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_fromFfi(_handle);
  heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_bindings_ListOf_sdk_search_ScheduleDetails_release_handle_nullable(handle);

final _heresdk_search_bindings_ListOf_sdk_search_Suggestion_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Suggestion_create_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_Suggestion_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Suggestion_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_Suggestion_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Suggestion_insert'));
final _heresdk_search_bindings_ListOf_sdk_search_Suggestion_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Suggestion_iterator'));
final _heresdk_search_bindings_ListOf_sdk_search_Suggestion_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Suggestion_iterator_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_Suggestion_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Suggestion_iterator_is_valid'));
final _heresdk_search_bindings_ListOf_sdk_search_Suggestion_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Suggestion_iterator_increment'));
final _heresdk_search_bindings_ListOf_sdk_search_Suggestion_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Suggestion_iterator_get'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_Suggestion_toFfi(List<Suggestion> value) {
  final _result = _heresdk_search_bindings_ListOf_sdk_search_Suggestion_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_Suggestion_toFfi(element);
    _heresdk_search_bindings_ListOf_sdk_search_Suggestion_insert(_result, _element_handle);
    sdk_search_Suggestion_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<Suggestion> heresdk_search_bindings_ListOf_sdk_search_Suggestion_fromFfi(Pointer<Void> handle) {
  final result = List<Suggestion>();
  final _iterator_handle = _heresdk_search_bindings_ListOf_sdk_search_Suggestion_iterator(handle);
  while (_heresdk_search_bindings_ListOf_sdk_search_Suggestion_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_bindings_ListOf_sdk_search_Suggestion_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_Suggestion_fromFfi(_element_handle));
    } finally {
      sdk_search_Suggestion_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_bindings_ListOf_sdk_search_Suggestion_iterator_increment(_iterator_handle);
  }
  _heresdk_search_bindings_ListOf_sdk_search_Suggestion_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_Suggestion_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_bindings_ListOf_sdk_search_Suggestion_release_handle(handle);

final _heresdk_search_bindings_ListOf_sdk_search_Suggestion_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Suggestion_create_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_Suggestion_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Suggestion_release_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_Suggestion_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_Suggestion_get_value_nullable'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_Suggestion_toFfi_nullable(List<Suggestion> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_bindings_ListOf_sdk_search_Suggestion_toFfi(value);
  final result = _heresdk_search_bindings_ListOf_sdk_search_Suggestion_create_handle_nullable(_handle);
  heresdk_search_bindings_ListOf_sdk_search_Suggestion_releaseFfiHandle(_handle);
  return result;
}

List<Suggestion> heresdk_search_bindings_ListOf_sdk_search_Suggestion_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_bindings_ListOf_sdk_search_Suggestion_get_value_nullable(handle);
  final result = heresdk_search_bindings_ListOf_sdk_search_Suggestion_fromFfi(_handle);
  heresdk_search_bindings_ListOf_sdk_search_Suggestion_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_Suggestion_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_bindings_ListOf_sdk_search_Suggestion_release_handle_nullable(handle);

final _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebEditorial_create_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebEditorial_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebEditorial_insert'));
final _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebEditorial_iterator'));
final _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebEditorial_iterator_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebEditorial_iterator_is_valid'));
final _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebEditorial_iterator_increment'));
final _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebEditorial_iterator_get'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_WebEditorial_toFfi(List<WebEditorial> value) {
  final _result = _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_WebEditorial_toFfi(element);
    _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_insert(_result, _element_handle);
    sdk_search_WebEditorial_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<WebEditorial> heresdk_search_bindings_ListOf_sdk_search_WebEditorial_fromFfi(Pointer<Void> handle) {
  final result = List<WebEditorial>();
  final _iterator_handle = _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_iterator(handle);
  while (_heresdk_search_bindings_ListOf_sdk_search_WebEditorial_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_WebEditorial_fromFfi(_element_handle));
    } finally {
      sdk_search_WebEditorial_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_iterator_increment(_iterator_handle);
  }
  _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_WebEditorial_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_release_handle(handle);

final _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebEditorial_create_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebEditorial_release_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebEditorial_get_value_nullable'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_WebEditorial_toFfi_nullable(List<WebEditorial> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_bindings_ListOf_sdk_search_WebEditorial_toFfi(value);
  final result = _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_create_handle_nullable(_handle);
  heresdk_search_bindings_ListOf_sdk_search_WebEditorial_releaseFfiHandle(_handle);
  return result;
}

List<WebEditorial> heresdk_search_bindings_ListOf_sdk_search_WebEditorial_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_get_value_nullable(handle);
  final result = heresdk_search_bindings_ListOf_sdk_search_WebEditorial_fromFfi(_handle);
  heresdk_search_bindings_ListOf_sdk_search_WebEditorial_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_WebEditorial_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_bindings_ListOf_sdk_search_WebEditorial_release_handle_nullable(handle);

final _heresdk_search_bindings_ListOf_sdk_search_WebImage_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebImage_create_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_WebImage_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebImage_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_WebImage_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebImage_insert'));
final _heresdk_search_bindings_ListOf_sdk_search_WebImage_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebImage_iterator'));
final _heresdk_search_bindings_ListOf_sdk_search_WebImage_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebImage_iterator_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_WebImage_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebImage_iterator_is_valid'));
final _heresdk_search_bindings_ListOf_sdk_search_WebImage_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebImage_iterator_increment'));
final _heresdk_search_bindings_ListOf_sdk_search_WebImage_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebImage_iterator_get'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_WebImage_toFfi(List<WebImage> value) {
  final _result = _heresdk_search_bindings_ListOf_sdk_search_WebImage_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_WebImage_toFfi(element);
    _heresdk_search_bindings_ListOf_sdk_search_WebImage_insert(_result, _element_handle);
    sdk_search_WebImage_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<WebImage> heresdk_search_bindings_ListOf_sdk_search_WebImage_fromFfi(Pointer<Void> handle) {
  final result = List<WebImage>();
  final _iterator_handle = _heresdk_search_bindings_ListOf_sdk_search_WebImage_iterator(handle);
  while (_heresdk_search_bindings_ListOf_sdk_search_WebImage_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_bindings_ListOf_sdk_search_WebImage_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_WebImage_fromFfi(_element_handle));
    } finally {
      sdk_search_WebImage_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_bindings_ListOf_sdk_search_WebImage_iterator_increment(_iterator_handle);
  }
  _heresdk_search_bindings_ListOf_sdk_search_WebImage_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_WebImage_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_bindings_ListOf_sdk_search_WebImage_release_handle(handle);

final _heresdk_search_bindings_ListOf_sdk_search_WebImage_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebImage_create_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_WebImage_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebImage_release_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_WebImage_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebImage_get_value_nullable'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_WebImage_toFfi_nullable(List<WebImage> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_bindings_ListOf_sdk_search_WebImage_toFfi(value);
  final result = _heresdk_search_bindings_ListOf_sdk_search_WebImage_create_handle_nullable(_handle);
  heresdk_search_bindings_ListOf_sdk_search_WebImage_releaseFfiHandle(_handle);
  return result;
}

List<WebImage> heresdk_search_bindings_ListOf_sdk_search_WebImage_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_bindings_ListOf_sdk_search_WebImage_get_value_nullable(handle);
  final result = heresdk_search_bindings_ListOf_sdk_search_WebImage_fromFfi(_handle);
  heresdk_search_bindings_ListOf_sdk_search_WebImage_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_WebImage_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_bindings_ListOf_sdk_search_WebImage_release_handle_nullable(handle);

final _heresdk_search_bindings_ListOf_sdk_search_WebRating_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebRating_create_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_WebRating_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebRating_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_WebRating_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebRating_insert'));
final _heresdk_search_bindings_ListOf_sdk_search_WebRating_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebRating_iterator'));
final _heresdk_search_bindings_ListOf_sdk_search_WebRating_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebRating_iterator_release_handle'));
final _heresdk_search_bindings_ListOf_sdk_search_WebRating_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebRating_iterator_is_valid'));
final _heresdk_search_bindings_ListOf_sdk_search_WebRating_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebRating_iterator_increment'));
final _heresdk_search_bindings_ListOf_sdk_search_WebRating_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebRating_iterator_get'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_WebRating_toFfi(List<WebRating> value) {
  final _result = _heresdk_search_bindings_ListOf_sdk_search_WebRating_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_WebRating_toFfi(element);
    _heresdk_search_bindings_ListOf_sdk_search_WebRating_insert(_result, _element_handle);
    sdk_search_WebRating_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<WebRating> heresdk_search_bindings_ListOf_sdk_search_WebRating_fromFfi(Pointer<Void> handle) {
  final result = List<WebRating>();
  final _iterator_handle = _heresdk_search_bindings_ListOf_sdk_search_WebRating_iterator(handle);
  while (_heresdk_search_bindings_ListOf_sdk_search_WebRating_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_bindings_ListOf_sdk_search_WebRating_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_WebRating_fromFfi(_element_handle));
    } finally {
      sdk_search_WebRating_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_bindings_ListOf_sdk_search_WebRating_iterator_increment(_iterator_handle);
  }
  _heresdk_search_bindings_ListOf_sdk_search_WebRating_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_WebRating_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_bindings_ListOf_sdk_search_WebRating_release_handle(handle);

final _heresdk_search_bindings_ListOf_sdk_search_WebRating_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebRating_create_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_WebRating_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebRating_release_handle_nullable'));
final _heresdk_search_bindings_ListOf_sdk_search_WebRating_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_ListOf_sdk_search_WebRating_get_value_nullable'));

Pointer<Void> heresdk_search_bindings_ListOf_sdk_search_WebRating_toFfi_nullable(List<WebRating> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_bindings_ListOf_sdk_search_WebRating_toFfi(value);
  final result = _heresdk_search_bindings_ListOf_sdk_search_WebRating_create_handle_nullable(_handle);
  heresdk_search_bindings_ListOf_sdk_search_WebRating_releaseFfiHandle(_handle);
  return result;
}

List<WebRating> heresdk_search_bindings_ListOf_sdk_search_WebRating_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_bindings_ListOf_sdk_search_WebRating_get_value_nullable(handle);
  final result = heresdk_search_bindings_ListOf_sdk_search_WebRating_fromFfi(_handle);
  heresdk_search_bindings_ListOf_sdk_search_WebRating_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_bindings_ListOf_sdk_search_WebRating_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_bindings_ListOf_sdk_search_WebRating_release_handle_nullable(handle);

final _heresdk_search_bindings_MapOf_String_to_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_bindings_MapOf_String_to_String_create_handle'));
final _heresdk_search_bindings_MapOf_String_to_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_MapOf_String_to_String_release_handle'));
final _heresdk_search_bindings_MapOf_String_to_String_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_MapOf_String_to_String_put'));
final _heresdk_search_bindings_MapOf_String_to_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_MapOf_String_to_String_iterator'));
final _heresdk_search_bindings_MapOf_String_to_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_MapOf_String_to_String_iterator_release_handle'));
final _heresdk_search_bindings_MapOf_String_to_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_bindings_MapOf_String_to_String_iterator_is_valid'));
final _heresdk_search_bindings_MapOf_String_to_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_MapOf_String_to_String_iterator_increment'));
final _heresdk_search_bindings_MapOf_String_to_String_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_MapOf_String_to_String_iterator_get_key'));
final _heresdk_search_bindings_MapOf_String_to_String_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_MapOf_String_to_String_iterator_get_value'));

Pointer<Void> heresdk_search_bindings_MapOf_String_to_String_toFfi(Map<String, String> value) {
  final _result = _heresdk_search_bindings_MapOf_String_to_String_create_handle();
  for (final entry in value.entries) {
    final _key_handle = String_toFfi(entry.key);
    final _value_handle = String_toFfi(entry.value);
    _heresdk_search_bindings_MapOf_String_to_String_put(_result, _key_handle, _value_handle);
    String_releaseFfiHandle(_key_handle);
    String_releaseFfiHandle(_value_handle);
  }
  return _result;
}

Map<String, String> heresdk_search_bindings_MapOf_String_to_String_fromFfi(Pointer<Void> handle) {
  final result = Map<String, String>();
  final _iterator_handle = _heresdk_search_bindings_MapOf_String_to_String_iterator(handle);
  while (_heresdk_search_bindings_MapOf_String_to_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _heresdk_search_bindings_MapOf_String_to_String_iterator_get_key(_iterator_handle);
    final _value_handle = _heresdk_search_bindings_MapOf_String_to_String_iterator_get_value(_iterator_handle);
    try {
      result[String_fromFfi(_key_handle)] =
        String_fromFfi(_value_handle);
    } finally {
      String_releaseFfiHandle(_key_handle);
      String_releaseFfiHandle(_value_handle);
    }
    _heresdk_search_bindings_MapOf_String_to_String_iterator_increment(_iterator_handle);
  }
  _heresdk_search_bindings_MapOf_String_to_String_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_bindings_MapOf_String_to_String_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_bindings_MapOf_String_to_String_release_handle(handle);

final _heresdk_search_bindings_MapOf_String_to_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_MapOf_String_to_String_create_handle_nullable'));
final _heresdk_search_bindings_MapOf_String_to_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_MapOf_String_to_String_release_handle_nullable'));
final _heresdk_search_bindings_MapOf_String_to_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_MapOf_String_to_String_get_value_nullable'));

Pointer<Void> heresdk_search_bindings_MapOf_String_to_String_toFfi_nullable(Map<String, String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_bindings_MapOf_String_to_String_toFfi(value);
  final result = _heresdk_search_bindings_MapOf_String_to_String_create_handle_nullable(_handle);
  heresdk_search_bindings_MapOf_String_to_String_releaseFfiHandle(_handle);
  return result;
}

Map<String, String> heresdk_search_bindings_MapOf_String_to_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_bindings_MapOf_String_to_String_get_value_nullable(handle);
  final result = heresdk_search_bindings_MapOf_String_to_String_fromFfi(_handle);
  heresdk_search_bindings_MapOf_String_to_String_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_bindings_MapOf_String_to_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_bindings_MapOf_String_to_String_release_handle_nullable(handle);

final _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_create_handle'));
final _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_release_handle'));
final _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_put'));
final _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator'));
final _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_release_handle'));
final _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_is_valid'));
final _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_increment'));
final _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_get_key'));
final _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_get_value'));

Pointer<Void> heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_toFfi(Map<HighlightType, List<IndexRange>> value) {
  final _result = _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_create_handle();
  for (final entry in value.entries) {
    final _key_handle = sdk_search_HighlightType_toFfi(entry.key);
    final _value_handle = heresdk_search_bindings_ListOf_sdk_search_IndexRange_toFfi(entry.value);
    _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_put(_result, _key_handle, _value_handle);
    sdk_search_HighlightType_releaseFfiHandle(_key_handle);
    heresdk_search_bindings_ListOf_sdk_search_IndexRange_releaseFfiHandle(_value_handle);
  }
  return _result;
}

Map<HighlightType, List<IndexRange>> heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_fromFfi(Pointer<Void> handle) {
  final result = Map<HighlightType, List<IndexRange>>();
  final _iterator_handle = _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator(handle);
  while (_heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_get_key(_iterator_handle);
    final _value_handle = _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_get_value(_iterator_handle);
    try {
      result[sdk_search_HighlightType_fromFfi(_key_handle)] =
        heresdk_search_bindings_ListOf_sdk_search_IndexRange_fromFfi(_value_handle);
    } finally {
      sdk_search_HighlightType_releaseFfiHandle(_key_handle);
      heresdk_search_bindings_ListOf_sdk_search_IndexRange_releaseFfiHandle(_value_handle);
    }
    _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_increment(_iterator_handle);
  }
  _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_release_handle(handle);

final _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_create_handle_nullable'));
final _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_release_handle_nullable'));
final _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_get_value_nullable'));

Pointer<Void> heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_toFfi_nullable(Map<HighlightType, List<IndexRange>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_toFfi(value);
  final result = _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_create_handle_nullable(_handle);
  heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_releaseFfiHandle(_handle);
  return result;
}

Map<HighlightType, List<IndexRange>> heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_get_value_nullable(handle);
  final result = heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_fromFfi(_handle);
  heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_release_handle_nullable(handle);


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



















final _heresdk_search_common_bindings_ListOf_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_common_bindings_ListOf_String_create_handle'));
final _heresdk_search_common_bindings_ListOf_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_String_release_handle'));
final _heresdk_search_common_bindings_ListOf_String_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_String_insert'));
final _heresdk_search_common_bindings_ListOf_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_String_iterator'));
final _heresdk_search_common_bindings_ListOf_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_String_iterator_release_handle'));
final _heresdk_search_common_bindings_ListOf_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_String_iterator_is_valid'));
final _heresdk_search_common_bindings_ListOf_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_String_iterator_increment'));
final _heresdk_search_common_bindings_ListOf_String_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_String_iterator_get'));

Pointer<Void> heresdk_search_common_bindings_ListOf_String_toFfi(List<String> value) {
  final _result = _heresdk_search_common_bindings_ListOf_String_create_handle();
  for (final element in value) {
    final _element_handle = String_toFfi(element);
    _heresdk_search_common_bindings_ListOf_String_insert(_result, _element_handle);
    String_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<String> heresdk_search_common_bindings_ListOf_String_fromFfi(Pointer<Void> handle) {
  final result = List<String>();
  final _iterator_handle = _heresdk_search_common_bindings_ListOf_String_iterator(handle);
  while (_heresdk_search_common_bindings_ListOf_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_common_bindings_ListOf_String_iterator_get(_iterator_handle);
    try {
      result.add(String_fromFfi(_element_handle));
    } finally {
      String_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_common_bindings_ListOf_String_iterator_increment(_iterator_handle);
  }
  _heresdk_search_common_bindings_ListOf_String_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_String_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_common_bindings_ListOf_String_release_handle(handle);

final _heresdk_search_common_bindings_ListOf_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_String_create_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_String_release_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_String_get_value_nullable'));

Pointer<Void> heresdk_search_common_bindings_ListOf_String_toFfi_nullable(List<String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_common_bindings_ListOf_String_toFfi(value);
  final result = _heresdk_search_common_bindings_ListOf_String_create_handle_nullable(_handle);
  heresdk_search_common_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

List<String> heresdk_search_common_bindings_ListOf_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_common_bindings_ListOf_String_get_value_nullable(handle);
  final result = heresdk_search_common_bindings_ListOf_String_fromFfi(_handle);
  heresdk_search_common_bindings_ListOf_String_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_common_bindings_ListOf_String_release_handle_nullable(handle);

final _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_create_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_insert'));
final _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_iterator'));
final _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_iterator_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_iterator_is_valid'));
final _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_iterator_increment'));
final _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_iterator_get'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_toFfi(List<CountryCode> value) {
  final _result = _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_create_handle();
  for (final element in value) {
    final _element_handle = sdk_core_CountryCode_toFfi(element);
    _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_insert(_result, _element_handle);
    sdk_core_CountryCode_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<CountryCode> heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_fromFfi(Pointer<Void> handle) {
  final result = List<CountryCode>();
  final _iterator_handle = _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_iterator(handle);
  while (_heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_iterator_get(_iterator_handle);
    try {
      result.add(sdk_core_CountryCode_fromFfi(_element_handle));
    } finally {
      sdk_core_CountryCode_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_iterator_increment(_iterator_handle);
  }
  _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_release_handle(handle);

final _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_create_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_release_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_get_value_nullable'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_toFfi_nullable(List<CountryCode> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_toFfi(value);
  final result = _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_create_handle_nullable(_handle);
  heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(_handle);
  return result;
}

List<CountryCode> heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_get_value_nullable(handle);
  final result = heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_fromFfi(_handle);
  heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_release_handle_nullable(handle);

final _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_insert'));
final _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator'));
final _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid'));
final _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment'));
final _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(List<GeoCoordinates> value) {
  final _result = _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle();
  for (final element in value) {
    final _element_handle = sdk_core_GeoCoordinates_toFfi(element);
    _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_insert(_result, _element_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<GeoCoordinates> heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(Pointer<Void> handle) {
  final result = List<GeoCoordinates>();
  final _iterator_handle = _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator(handle);
  while (_heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_get(_iterator_handle);
    try {
      result.add(sdk_core_GeoCoordinates_fromFfi(_element_handle));
    } finally {
      sdk_core_GeoCoordinates_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_increment(_iterator_handle);
  }
  _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle(handle);

final _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_toFfi_nullable(List<GeoCoordinates> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(value);
  final result = _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_create_handle_nullable(_handle);
  heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

List<GeoCoordinates> heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_get_value_nullable(handle);
  final result = heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(_handle);
  heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_common_bindings_ListOf_sdk_core_GeoCoordinates_release_handle_nullable(handle);

final _heresdk_search_common_bindings_ListOf_sdk_search_Contact_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Contact_create_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Contact_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Contact_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Contact_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Contact_insert'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Contact_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Contact_iterator'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Contact_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Contact_iterator_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Contact_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Contact_iterator_is_valid'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Contact_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Contact_iterator_increment'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Contact_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Contact_iterator_get'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_search_Contact_toFfi(List<Contact> value) {
  final _result = _heresdk_search_common_bindings_ListOf_sdk_search_Contact_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_Contact_toFfi(element);
    _heresdk_search_common_bindings_ListOf_sdk_search_Contact_insert(_result, _element_handle);
    sdk_search_Contact_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<Contact> heresdk_search_common_bindings_ListOf_sdk_search_Contact_fromFfi(Pointer<Void> handle) {
  final result = List<Contact>();
  final _iterator_handle = _heresdk_search_common_bindings_ListOf_sdk_search_Contact_iterator(handle);
  while (_heresdk_search_common_bindings_ListOf_sdk_search_Contact_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_common_bindings_ListOf_sdk_search_Contact_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_Contact_fromFfi(_element_handle));
    } finally {
      sdk_search_Contact_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_common_bindings_ListOf_sdk_search_Contact_iterator_increment(_iterator_handle);
  }
  _heresdk_search_common_bindings_ListOf_sdk_search_Contact_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_search_Contact_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_common_bindings_ListOf_sdk_search_Contact_release_handle(handle);

final _heresdk_search_common_bindings_ListOf_sdk_search_Contact_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Contact_create_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Contact_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Contact_release_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Contact_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Contact_get_value_nullable'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_search_Contact_toFfi_nullable(List<Contact> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_common_bindings_ListOf_sdk_search_Contact_toFfi(value);
  final result = _heresdk_search_common_bindings_ListOf_sdk_search_Contact_create_handle_nullable(_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_Contact_releaseFfiHandle(_handle);
  return result;
}

List<Contact> heresdk_search_common_bindings_ListOf_sdk_search_Contact_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_common_bindings_ListOf_sdk_search_Contact_get_value_nullable(handle);
  final result = heresdk_search_common_bindings_ListOf_sdk_search_Contact_fromFfi(_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_Contact_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_search_Contact_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_common_bindings_ListOf_sdk_search_Contact_release_handle_nullable(handle);

final _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_create_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_insert'));
final _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_iterator'));
final _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_iterator_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_iterator_is_valid'));
final _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_iterator_increment'));
final _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_iterator_get'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_toFfi(List<OpeningHours> value) {
  final _result = _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_OpeningHours_toFfi(element);
    _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_insert(_result, _element_handle);
    sdk_search_OpeningHours_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<OpeningHours> heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_fromFfi(Pointer<Void> handle) {
  final result = List<OpeningHours>();
  final _iterator_handle = _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_iterator(handle);
  while (_heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_OpeningHours_fromFfi(_element_handle));
    } finally {
      sdk_search_OpeningHours_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_iterator_increment(_iterator_handle);
  }
  _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_release_handle(handle);

final _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_create_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_release_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_get_value_nullable'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_toFfi_nullable(List<OpeningHours> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_toFfi(value);
  final result = _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_create_handle_nullable(_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_releaseFfiHandle(_handle);
  return result;
}

List<OpeningHours> heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_get_value_nullable(handle);
  final result = heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_fromFfi(_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_release_handle_nullable(handle);

final _heresdk_search_common_bindings_ListOf_sdk_search_Place_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Place_create_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Place_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Place_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Place_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Place_insert'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Place_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Place_iterator'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Place_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Place_iterator_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Place_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Place_iterator_is_valid'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Place_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Place_iterator_increment'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Place_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Place_iterator_get'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_search_Place_toFfi(List<Place> value) {
  final _result = _heresdk_search_common_bindings_ListOf_sdk_search_Place_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_Place_toFfi(element);
    _heresdk_search_common_bindings_ListOf_sdk_search_Place_insert(_result, _element_handle);
    sdk_search_Place_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<Place> heresdk_search_common_bindings_ListOf_sdk_search_Place_fromFfi(Pointer<Void> handle) {
  final result = List<Place>();
  final _iterator_handle = _heresdk_search_common_bindings_ListOf_sdk_search_Place_iterator(handle);
  while (_heresdk_search_common_bindings_ListOf_sdk_search_Place_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_common_bindings_ListOf_sdk_search_Place_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_Place_fromFfi(_element_handle));
    } finally {
      sdk_search_Place_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_common_bindings_ListOf_sdk_search_Place_iterator_increment(_iterator_handle);
  }
  _heresdk_search_common_bindings_ListOf_sdk_search_Place_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_search_Place_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_common_bindings_ListOf_sdk_search_Place_release_handle(handle);

final _heresdk_search_common_bindings_ListOf_sdk_search_Place_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Place_create_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Place_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Place_release_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_search_Place_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_Place_get_value_nullable'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_search_Place_toFfi_nullable(List<Place> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_common_bindings_ListOf_sdk_search_Place_toFfi(value);
  final result = _heresdk_search_common_bindings_ListOf_sdk_search_Place_create_handle_nullable(_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_Place_releaseFfiHandle(_handle);
  return result;
}

List<Place> heresdk_search_common_bindings_ListOf_sdk_search_Place_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_common_bindings_ListOf_sdk_search_Place_get_value_nullable(handle);
  final result = heresdk_search_common_bindings_ListOf_sdk_search_Place_fromFfi(_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_Place_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_search_Place_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_common_bindings_ListOf_sdk_search_Place_release_handle_nullable(handle);

final _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_create_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_insert'));
final _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_iterator'));
final _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_iterator_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_iterator_is_valid'));
final _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_iterator_increment'));
final _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_iterator_get'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_toFfi(List<PlaceCategory> value) {
  final _result = _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_PlaceCategory_toFfi(element);
    _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_insert(_result, _element_handle);
    sdk_search_PlaceCategory_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<PlaceCategory> heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_fromFfi(Pointer<Void> handle) {
  final result = List<PlaceCategory>();
  final _iterator_handle = _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_iterator(handle);
  while (_heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_PlaceCategory_fromFfi(_element_handle));
    } finally {
      sdk_search_PlaceCategory_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_iterator_increment(_iterator_handle);
  }
  _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_release_handle(handle);

final _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_create_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_release_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_get_value_nullable'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_toFfi_nullable(List<PlaceCategory> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_toFfi(value);
  final result = _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_create_handle_nullable(_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(_handle);
  return result;
}

List<PlaceCategory> heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_get_value_nullable(handle);
  final result = heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_fromFfi(_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_release_handle_nullable(handle);

final _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_create_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_insert'));
final _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_iterator'));
final _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_iterator_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_iterator_is_valid'));
final _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_iterator_increment'));
final _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_iterator_get'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_toFfi(List<ScheduleDetails> value) {
  final _result = _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_ScheduleDetails_toFfi(element);
    _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_insert(_result, _element_handle);
    sdk_search_ScheduleDetails_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<ScheduleDetails> heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_fromFfi(Pointer<Void> handle) {
  final result = List<ScheduleDetails>();
  final _iterator_handle = _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_iterator(handle);
  while (_heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_ScheduleDetails_fromFfi(_element_handle));
    } finally {
      sdk_search_ScheduleDetails_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_iterator_increment(_iterator_handle);
  }
  _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_release_handle(handle);

final _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_create_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_release_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_get_value_nullable'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_toFfi_nullable(List<ScheduleDetails> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_toFfi(value);
  final result = _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_create_handle_nullable(_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_releaseFfiHandle(_handle);
  return result;
}

List<ScheduleDetails> heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_get_value_nullable(handle);
  final result = heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_fromFfi(_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_release_handle_nullable(handle);

final _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_create_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_insert'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_iterator'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_iterator_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_iterator_is_valid'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_iterator_increment'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_iterator_get'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_toFfi(List<WebEditorial> value) {
  final _result = _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_WebEditorial_toFfi(element);
    _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_insert(_result, _element_handle);
    sdk_search_WebEditorial_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<WebEditorial> heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_fromFfi(Pointer<Void> handle) {
  final result = List<WebEditorial>();
  final _iterator_handle = _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_iterator(handle);
  while (_heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_WebEditorial_fromFfi(_element_handle));
    } finally {
      sdk_search_WebEditorial_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_iterator_increment(_iterator_handle);
  }
  _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_release_handle(handle);

final _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_create_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_release_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_get_value_nullable'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_toFfi_nullable(List<WebEditorial> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_toFfi(value);
  final result = _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_create_handle_nullable(_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_releaseFfiHandle(_handle);
  return result;
}

List<WebEditorial> heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_get_value_nullable(handle);
  final result = heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_fromFfi(_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_release_handle_nullable(handle);

final _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebImage_create_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebImage_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebImage_insert'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebImage_iterator'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebImage_iterator_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebImage_iterator_is_valid'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebImage_iterator_increment'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebImage_iterator_get'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_search_WebImage_toFfi(List<WebImage> value) {
  final _result = _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_WebImage_toFfi(element);
    _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_insert(_result, _element_handle);
    sdk_search_WebImage_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<WebImage> heresdk_search_common_bindings_ListOf_sdk_search_WebImage_fromFfi(Pointer<Void> handle) {
  final result = List<WebImage>();
  final _iterator_handle = _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_iterator(handle);
  while (_heresdk_search_common_bindings_ListOf_sdk_search_WebImage_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_WebImage_fromFfi(_element_handle));
    } finally {
      sdk_search_WebImage_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_iterator_increment(_iterator_handle);
  }
  _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_search_WebImage_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_release_handle(handle);

final _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebImage_create_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebImage_release_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebImage_get_value_nullable'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_search_WebImage_toFfi_nullable(List<WebImage> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_common_bindings_ListOf_sdk_search_WebImage_toFfi(value);
  final result = _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_create_handle_nullable(_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_WebImage_releaseFfiHandle(_handle);
  return result;
}

List<WebImage> heresdk_search_common_bindings_ListOf_sdk_search_WebImage_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_get_value_nullable(handle);
  final result = heresdk_search_common_bindings_ListOf_sdk_search_WebImage_fromFfi(_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_WebImage_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_search_WebImage_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_common_bindings_ListOf_sdk_search_WebImage_release_handle_nullable(handle);

final _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebRating_create_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebRating_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebRating_insert'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebRating_iterator'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebRating_iterator_release_handle'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebRating_iterator_is_valid'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebRating_iterator_increment'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebRating_iterator_get'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_search_WebRating_toFfi(List<WebRating> value) {
  final _result = _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_create_handle();
  for (final element in value) {
    final _element_handle = sdk_search_WebRating_toFfi(element);
    _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_insert(_result, _element_handle);
    sdk_search_WebRating_releaseFfiHandle(_element_handle);
  }
  return _result;
}

List<WebRating> heresdk_search_common_bindings_ListOf_sdk_search_WebRating_fromFfi(Pointer<Void> handle) {
  final result = List<WebRating>();
  final _iterator_handle = _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_iterator(handle);
  while (_heresdk_search_common_bindings_ListOf_sdk_search_WebRating_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_iterator_get(_iterator_handle);
    try {
      result.add(sdk_search_WebRating_fromFfi(_element_handle));
    } finally {
      sdk_search_WebRating_releaseFfiHandle(_element_handle);
    }
    _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_iterator_increment(_iterator_handle);
  }
  _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_search_WebRating_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_release_handle(handle);

final _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebRating_create_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebRating_release_handle_nullable'));
final _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_ListOf_sdk_search_WebRating_get_value_nullable'));

Pointer<Void> heresdk_search_common_bindings_ListOf_sdk_search_WebRating_toFfi_nullable(List<WebRating> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_common_bindings_ListOf_sdk_search_WebRating_toFfi(value);
  final result = _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_create_handle_nullable(_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_WebRating_releaseFfiHandle(_handle);
  return result;
}

List<WebRating> heresdk_search_common_bindings_ListOf_sdk_search_WebRating_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_get_value_nullable(handle);
  final result = heresdk_search_common_bindings_ListOf_sdk_search_WebRating_fromFfi(_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_WebRating_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_common_bindings_ListOf_sdk_search_WebRating_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_common_bindings_ListOf_sdk_search_WebRating_release_handle_nullable(handle);

final _heresdk_search_common_bindings_MapOf_String_to_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_heresdk_search_common_bindings_MapOf_String_to_String_create_handle'));
final _heresdk_search_common_bindings_MapOf_String_to_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_MapOf_String_to_String_release_handle'));
final _heresdk_search_common_bindings_MapOf_String_to_String_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_MapOf_String_to_String_put'));
final _heresdk_search_common_bindings_MapOf_String_to_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_MapOf_String_to_String_iterator'));
final _heresdk_search_common_bindings_MapOf_String_to_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_MapOf_String_to_String_iterator_release_handle'));
final _heresdk_search_common_bindings_MapOf_String_to_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_MapOf_String_to_String_iterator_is_valid'));
final _heresdk_search_common_bindings_MapOf_String_to_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_MapOf_String_to_String_iterator_increment'));
final _heresdk_search_common_bindings_MapOf_String_to_String_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_MapOf_String_to_String_iterator_get_key'));
final _heresdk_search_common_bindings_MapOf_String_to_String_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('here_sdk_heresdk_search_common_bindings_MapOf_String_to_String_iterator_get_value'));

Pointer<Void> heresdk_search_common_bindings_MapOf_String_to_String_toFfi(Map<String, String> value) {
  final _result = _heresdk_search_common_bindings_MapOf_String_to_String_create_handle();
  for (final entry in value.entries) {
    final _key_handle = String_toFfi(entry.key);
    final _value_handle = String_toFfi(entry.value);
    _heresdk_search_common_bindings_MapOf_String_to_String_put(_result, _key_handle, _value_handle);
    String_releaseFfiHandle(_key_handle);
    String_releaseFfiHandle(_value_handle);
  }
  return _result;
}

Map<String, String> heresdk_search_common_bindings_MapOf_String_to_String_fromFfi(Pointer<Void> handle) {
  final result = Map<String, String>();
  final _iterator_handle = _heresdk_search_common_bindings_MapOf_String_to_String_iterator(handle);
  while (_heresdk_search_common_bindings_MapOf_String_to_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _heresdk_search_common_bindings_MapOf_String_to_String_iterator_get_key(_iterator_handle);
    final _value_handle = _heresdk_search_common_bindings_MapOf_String_to_String_iterator_get_value(_iterator_handle);
    try {
      result[String_fromFfi(_key_handle)] =
        String_fromFfi(_value_handle);
    } finally {
      String_releaseFfiHandle(_key_handle);
      String_releaseFfiHandle(_value_handle);
    }
    _heresdk_search_common_bindings_MapOf_String_to_String_iterator_increment(_iterator_handle);
  }
  _heresdk_search_common_bindings_MapOf_String_to_String_iterator_release_handle(_iterator_handle);
  return result;
}

void heresdk_search_common_bindings_MapOf_String_to_String_releaseFfiHandle(Pointer<Void> handle) => _heresdk_search_common_bindings_MapOf_String_to_String_release_handle(handle);

final _heresdk_search_common_bindings_MapOf_String_to_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_MapOf_String_to_String_create_handle_nullable'));
final _heresdk_search_common_bindings_MapOf_String_to_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_MapOf_String_to_String_release_handle_nullable'));
final _heresdk_search_common_bindings_MapOf_String_to_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_heresdk_search_common_bindings_MapOf_String_to_String_get_value_nullable'));

Pointer<Void> heresdk_search_common_bindings_MapOf_String_to_String_toFfi_nullable(Map<String, String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = heresdk_search_common_bindings_MapOf_String_to_String_toFfi(value);
  final result = _heresdk_search_common_bindings_MapOf_String_to_String_create_handle_nullable(_handle);
  heresdk_search_common_bindings_MapOf_String_to_String_releaseFfiHandle(_handle);
  return result;
}

Map<String, String> heresdk_search_common_bindings_MapOf_String_to_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _heresdk_search_common_bindings_MapOf_String_to_String_get_value_nullable(handle);
  final result = heresdk_search_common_bindings_MapOf_String_to_String_fromFfi(_handle);
  heresdk_search_common_bindings_MapOf_String_to_String_releaseFfiHandle(_handle);
  return result;
}

void heresdk_search_common_bindings_MapOf_String_to_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _heresdk_search_common_bindings_MapOf_String_to_String_release_handle_nullable(handle);


