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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/routing/directed_link.dart';
import 'package:here_sdk/src/sdk/routing/dynamic_speed_info.dart';
import 'package:here_sdk/src/sdk/routing/street_attributes.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// @nodoc

class Link {
  /// @nodoc
  DirectedLink internaldirectedLink;

  /// @nodoc
  List<GeoCoordinates> internalpolyline;

  /// @nodoc
  int internallengthInMeters;

  /// @nodoc
  DynamicSpeedInfo internaldynamicSpeedInfo;

  /// @nodoc
  List<StreetAttributes> internalstreetAttributes;

  /// @nodoc
  int internaldurationInSeconds;

  /// @nodoc
  int internalbaseDurationInSeconds;

  /// @nodoc
  String internalstreetName;

  /// @nodoc
  String internalrouteNumber;

  /// @nodoc
  double internalspeedLimitInMetersPerSecond;

  /// @nodoc
  double internalconsumptionInKilowattHours;


  Link(this.internaldirectedLink, this.internalpolyline, this.internallengthInMeters, this.internaldynamicSpeedInfo, this.internalstreetAttributes, this.internaldurationInSeconds, this.internalbaseDurationInSeconds, this.internalstreetName, this.internalrouteNumber, this.internalspeedLimitInMetersPerSecond, this.internalconsumptionInKilowattHours);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! Link) return false;
    Link _other = other;
    return internaldirectedLink == _other.internaldirectedLink &&
        DeepCollectionEquality().equals(internalpolyline, _other.internalpolyline) &&
        internallengthInMeters == _other.internallengthInMeters &&
        internaldynamicSpeedInfo == _other.internaldynamicSpeedInfo &&
        DeepCollectionEquality().equals(internalstreetAttributes, _other.internalstreetAttributes) &&
        internaldurationInSeconds == _other.internaldurationInSeconds &&
        internalbaseDurationInSeconds == _other.internalbaseDurationInSeconds &&
        internalstreetName == _other.internalstreetName &&
        internalrouteNumber == _other.internalrouteNumber &&
        internalspeedLimitInMetersPerSecond == _other.internalspeedLimitInMetersPerSecond &&
        internalconsumptionInKilowattHours == _other.internalconsumptionInKilowattHours;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internaldirectedLink.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(internalpolyline);
    result = 31 * result + internallengthInMeters.hashCode;
    result = 31 * result + internaldynamicSpeedInfo.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(internalstreetAttributes);
    result = 31 * result + internaldurationInSeconds.hashCode;
    result = 31 * result + internalbaseDurationInSeconds.hashCode;
    result = 31 * result + internalstreetName.hashCode;
    result = 31 * result + internalrouteNumber.hashCode;
    result = 31 * result + internalspeedLimitInMetersPerSecond.hashCode;
    result = 31 * result + internalconsumptionInKilowattHours.hashCode;
    return result;
  }
}


// Link "private" section, not exported.

final _sdk_routing_Link_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Int32, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, int, Pointer<Void>, Pointer<Void>, int, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_Link_create_handle'));
final _sdk_routing_Link_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Link_release_handle'));
final _sdk_routing_Link_get_field_directedLink = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Link_get_field_directedLink'));
final _sdk_routing_Link_get_field_polyline = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Link_get_field_polyline'));
final _sdk_routing_Link_get_field_lengthInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Link_get_field_lengthInMeters'));
final _sdk_routing_Link_get_field_dynamicSpeedInfo = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Link_get_field_dynamicSpeedInfo'));
final _sdk_routing_Link_get_field_streetAttributes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Link_get_field_streetAttributes'));
final _sdk_routing_Link_get_field_durationInSeconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Link_get_field_durationInSeconds'));
final _sdk_routing_Link_get_field_baseDurationInSeconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Link_get_field_baseDurationInSeconds'));
final _sdk_routing_Link_get_field_streetName = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Link_get_field_streetName'));
final _sdk_routing_Link_get_field_routeNumber = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Link_get_field_routeNumber'));
final _sdk_routing_Link_get_field_speedLimitInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Link_get_field_speedLimitInMetersPerSecond'));
final _sdk_routing_Link_get_field_consumptionInKilowattHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Link_get_field_consumptionInKilowattHours'));

Pointer<Void> sdk_routing_Link_toFfi(Link value) {
  final _directedLink_handle = sdk_routing_DirectedLink_toFfi(value.internaldirectedLink);
  final _polyline_handle = heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_toFfi(value.internalpolyline);
  final _lengthInMeters_handle = (value.internallengthInMeters);
  final _dynamicSpeedInfo_handle = sdk_routing_DynamicSpeedInfo_toFfi_nullable(value.internaldynamicSpeedInfo);
  final _streetAttributes_handle = heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_toFfi(value.internalstreetAttributes);
  final _durationInSeconds_handle = (value.internaldurationInSeconds);
  final _baseDurationInSeconds_handle = (value.internalbaseDurationInSeconds);
  final _streetName_handle = String_toFfi_nullable(value.internalstreetName);
  final _routeNumber_handle = String_toFfi_nullable(value.internalrouteNumber);
  final _speedLimitInMetersPerSecond_handle = Double_toFfi_nullable(value.internalspeedLimitInMetersPerSecond);
  final _consumptionInKilowattHours_handle = Double_toFfi_nullable(value.internalconsumptionInKilowattHours);
  final _result = _sdk_routing_Link_create_handle(_directedLink_handle, _polyline_handle, _lengthInMeters_handle, _dynamicSpeedInfo_handle, _streetAttributes_handle, _durationInSeconds_handle, _baseDurationInSeconds_handle, _streetName_handle, _routeNumber_handle, _speedLimitInMetersPerSecond_handle, _consumptionInKilowattHours_handle);
  sdk_routing_DirectedLink_releaseFfiHandle(_directedLink_handle);
  heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_polyline_handle);
  (_lengthInMeters_handle);
  sdk_routing_DynamicSpeedInfo_releaseFfiHandle_nullable(_dynamicSpeedInfo_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_releaseFfiHandle(_streetAttributes_handle);
  (_durationInSeconds_handle);
  (_baseDurationInSeconds_handle);
  String_releaseFfiHandle_nullable(_streetName_handle);
  String_releaseFfiHandle_nullable(_routeNumber_handle);
  Double_releaseFfiHandle_nullable(_speedLimitInMetersPerSecond_handle);
  Double_releaseFfiHandle_nullable(_consumptionInKilowattHours_handle);
  return _result;
}

Link sdk_routing_Link_fromFfi(Pointer<Void> handle) {
  final _directedLink_handle = _sdk_routing_Link_get_field_directedLink(handle);
  final _polyline_handle = _sdk_routing_Link_get_field_polyline(handle);
  final _lengthInMeters_handle = _sdk_routing_Link_get_field_lengthInMeters(handle);
  final _dynamicSpeedInfo_handle = _sdk_routing_Link_get_field_dynamicSpeedInfo(handle);
  final _streetAttributes_handle = _sdk_routing_Link_get_field_streetAttributes(handle);
  final _durationInSeconds_handle = _sdk_routing_Link_get_field_durationInSeconds(handle);
  final _baseDurationInSeconds_handle = _sdk_routing_Link_get_field_baseDurationInSeconds(handle);
  final _streetName_handle = _sdk_routing_Link_get_field_streetName(handle);
  final _routeNumber_handle = _sdk_routing_Link_get_field_routeNumber(handle);
  final _speedLimitInMetersPerSecond_handle = _sdk_routing_Link_get_field_speedLimitInMetersPerSecond(handle);
  final _consumptionInKilowattHours_handle = _sdk_routing_Link_get_field_consumptionInKilowattHours(handle);
  try {
    return Link(
      sdk_routing_DirectedLink_fromFfi(_directedLink_handle), 
    
      heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_fromFfi(_polyline_handle), 
    
      (_lengthInMeters_handle), 
    
      sdk_routing_DynamicSpeedInfo_fromFfi_nullable(_dynamicSpeedInfo_handle), 
    
      heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_fromFfi(_streetAttributes_handle), 
    
      (_durationInSeconds_handle), 
    
      (_baseDurationInSeconds_handle), 
    
      String_fromFfi_nullable(_streetName_handle), 
    
      String_fromFfi_nullable(_routeNumber_handle), 
    
      Double_fromFfi_nullable(_speedLimitInMetersPerSecond_handle), 
    
      Double_fromFfi_nullable(_consumptionInKilowattHours_handle)
    );
  } finally {
    sdk_routing_DirectedLink_releaseFfiHandle(_directedLink_handle);
    heresdk_routing_common_bindings_ListOf_sdk_core_GeoCoordinates_releaseFfiHandle(_polyline_handle);
    (_lengthInMeters_handle);
    sdk_routing_DynamicSpeedInfo_releaseFfiHandle_nullable(_dynamicSpeedInfo_handle);
    heresdk_routing_common_bindings_ListOf_sdk_routing_StreetAttributes_releaseFfiHandle(_streetAttributes_handle);
    (_durationInSeconds_handle);
    (_baseDurationInSeconds_handle);
    String_releaseFfiHandle_nullable(_streetName_handle);
    String_releaseFfiHandle_nullable(_routeNumber_handle);
    Double_releaseFfiHandle_nullable(_speedLimitInMetersPerSecond_handle);
    Double_releaseFfiHandle_nullable(_consumptionInKilowattHours_handle);
  }
}

void sdk_routing_Link_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_Link_release_handle(handle);

// Nullable Link

final _sdk_routing_Link_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Link_create_handle_nullable'));
final _sdk_routing_Link_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Link_release_handle_nullable'));
final _sdk_routing_Link_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Link_get_value_nullable'));

Pointer<Void> sdk_routing_Link_toFfi_nullable(Link value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_Link_toFfi(value);
  final result = _sdk_routing_Link_create_handle_nullable(_handle);
  sdk_routing_Link_releaseFfiHandle(_handle);
  return result;
}

Link sdk_routing_Link_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_Link_get_value_nullable(handle);
  final result = sdk_routing_Link_fromFfi(_handle);
  sdk_routing_Link_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_Link_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_Link_release_handle_nullable(handle);

// End of Link "private" section.

