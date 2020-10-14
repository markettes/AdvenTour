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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/country_code.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/routing/road_features.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// The options to specify restrictions for route calculations.

class AvoidanceOptions {
  /// Features which routes should avoid. Best effort only (not enforced).
  List<RoadFeatures> roadFeatures;

  /// Countries that the route must avoid. Strictly enforced.
  List<CountryCode> countries;

  /// Areas which routes must not cross. Strictly enforced.
  List<GeoBox> avoidAreas;


  AvoidanceOptions(this.roadFeatures, this.countries, this.avoidAreas);

  AvoidanceOptions.withDefaults()
    : roadFeatures = [], countries = [], avoidAreas = [];

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! AvoidanceOptions) return false;
    AvoidanceOptions _other = other;
    return DeepCollectionEquality().equals(roadFeatures, _other.roadFeatures) &&
        DeepCollectionEquality().equals(countries, _other.countries) &&
        DeepCollectionEquality().equals(avoidAreas, _other.avoidAreas);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(roadFeatures);
    result = 31 * result + DeepCollectionEquality().hash(countries);
    result = 31 * result + DeepCollectionEquality().hash(avoidAreas);
    return result;
  }
}


// AvoidanceOptions "private" section, not exported.

final _sdk_routing_AvoidanceOptions_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_create_handle'));
final _sdk_routing_AvoidanceOptions_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_release_handle'));
final _sdk_routing_AvoidanceOptions_get_field_roadFeatures = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_get_field_roadFeatures'));
final _sdk_routing_AvoidanceOptions_get_field_countries = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_get_field_countries'));
final _sdk_routing_AvoidanceOptions_get_field_avoidAreas = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_get_field_avoidAreas'));

Pointer<Void> sdk_routing_AvoidanceOptions_toFfi(AvoidanceOptions value) {
  final _roadFeatures_handle = heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_toFfi(value.roadFeatures);
  final _countries_handle = heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_toFfi(value.countries);
  final _avoidAreas_handle = heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_toFfi(value.avoidAreas);
  final _result = _sdk_routing_AvoidanceOptions_create_handle(_roadFeatures_handle, _countries_handle, _avoidAreas_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_releaseFfiHandle(_roadFeatures_handle);
  heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(_countries_handle);
  heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_releaseFfiHandle(_avoidAreas_handle);
  return _result;
}

AvoidanceOptions sdk_routing_AvoidanceOptions_fromFfi(Pointer<Void> handle) {
  final _roadFeatures_handle = _sdk_routing_AvoidanceOptions_get_field_roadFeatures(handle);
  final _countries_handle = _sdk_routing_AvoidanceOptions_get_field_countries(handle);
  final _avoidAreas_handle = _sdk_routing_AvoidanceOptions_get_field_avoidAreas(handle);
  try {
    return AvoidanceOptions(
      heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_fromFfi(_roadFeatures_handle), 
    
      heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_fromFfi(_countries_handle), 
    
      heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_fromFfi(_avoidAreas_handle)
    );
  } finally {
    heresdk_routing_common_bindings_ListOf_sdk_routing_RoadFeatures_releaseFfiHandle(_roadFeatures_handle);
    heresdk_routing_common_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(_countries_handle);
    heresdk_routing_common_bindings_ListOf_sdk_core_GeoBox_releaseFfiHandle(_avoidAreas_handle);
  }
}

void sdk_routing_AvoidanceOptions_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_AvoidanceOptions_release_handle(handle);

// Nullable AvoidanceOptions

final _sdk_routing_AvoidanceOptions_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_create_handle_nullable'));
final _sdk_routing_AvoidanceOptions_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_release_handle_nullable'));
final _sdk_routing_AvoidanceOptions_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AvoidanceOptions_get_value_nullable'));

Pointer<Void> sdk_routing_AvoidanceOptions_toFfi_nullable(AvoidanceOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_AvoidanceOptions_toFfi(value);
  final result = _sdk_routing_AvoidanceOptions_create_handle_nullable(_handle);
  sdk_routing_AvoidanceOptions_releaseFfiHandle(_handle);
  return result;
}

AvoidanceOptions sdk_routing_AvoidanceOptions_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_AvoidanceOptions_get_value_nullable(handle);
  final result = sdk_routing_AvoidanceOptions_fromFfi(_handle);
  sdk_routing_AvoidanceOptions_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_AvoidanceOptions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_AvoidanceOptions_release_handle_nullable(handle);

// End of AvoidanceOptions "private" section.

