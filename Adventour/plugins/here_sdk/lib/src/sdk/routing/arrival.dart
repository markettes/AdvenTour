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
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/routing/charging_station.dart';
import 'package:here_sdk/src/sdk/routing/route_place_type.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// The arrival location information.

class Arrival {
  /// The type of the arrival place.
  RoutePlaceType type;

  /// If present, this index corresponds to the waypoint in the original
  /// user-defined waypoint list. Otherwise this waypoint was added during
  /// route calculation by the system.
  int waypointIndex;

  /// User-defined geographic coordinates. If not available, this waypoint was
  /// added during route calculation.
  GeoCoordinates originalCoordinates;

  /// Map-matched geographic coordinates.
  GeoCoordinates mapMatchedCoordinates;

  /// Estimated arrival battery charge in kWh for electric vehicles.
  double chargeInKilowattHours;

  /// Charging station data for electric vehicles.
  ChargingStation chargingStation;


  Arrival(this.type, this.waypointIndex, this.originalCoordinates, this.mapMatchedCoordinates, this.chargeInKilowattHours, this.chargingStation);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! Arrival) return false;
    Arrival _other = other;
    return type == _other.type &&
        waypointIndex == _other.waypointIndex &&
        originalCoordinates == _other.originalCoordinates &&
        mapMatchedCoordinates == _other.mapMatchedCoordinates &&
        chargeInKilowattHours == _other.chargeInKilowattHours &&
        chargingStation == _other.chargingStation;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + type.hashCode;
    result = 31 * result + waypointIndex.hashCode;
    result = 31 * result + originalCoordinates.hashCode;
    result = 31 * result + mapMatchedCoordinates.hashCode;
    result = 31 * result + chargeInKilowattHours.hashCode;
    result = 31 * result + chargingStation.hashCode;
    return result;
  }
}


// Arrival "private" section, not exported.

final _sdk_routing_Arrival_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_create_handle'));
final _sdk_routing_Arrival_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_release_handle'));
final _sdk_routing_Arrival_get_field_type = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_get_field_type'));
final _sdk_routing_Arrival_get_field_waypointIndex = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_get_field_waypointIndex'));
final _sdk_routing_Arrival_get_field_originalCoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_get_field_originalCoordinates'));
final _sdk_routing_Arrival_get_field_mapMatchedCoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_get_field_mapMatchedCoordinates'));
final _sdk_routing_Arrival_get_field_chargeInKilowattHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_get_field_chargeInKilowattHours'));
final _sdk_routing_Arrival_get_field_chargingStation = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_get_field_chargingStation'));

Pointer<Void> sdk_routing_Arrival_toFfi(Arrival value) {
  final _type_handle = sdk_routing_RoutePlaceType_toFfi(value.type);
  final _waypointIndex_handle = Int_toFfi_nullable(value.waypointIndex);
  final _originalCoordinates_handle = sdk_core_GeoCoordinates_toFfi_nullable(value.originalCoordinates);
  final _mapMatchedCoordinates_handle = sdk_core_GeoCoordinates_toFfi(value.mapMatchedCoordinates);
  final _chargeInKilowattHours_handle = Double_toFfi_nullable(value.chargeInKilowattHours);
  final _chargingStation_handle = sdk_routing_ChargingStation_toFfi_nullable(value.chargingStation);
  final _result = _sdk_routing_Arrival_create_handle(_type_handle, _waypointIndex_handle, _originalCoordinates_handle, _mapMatchedCoordinates_handle, _chargeInKilowattHours_handle, _chargingStation_handle);
  sdk_routing_RoutePlaceType_releaseFfiHandle(_type_handle);
  Int_releaseFfiHandle_nullable(_waypointIndex_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle_nullable(_originalCoordinates_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle(_mapMatchedCoordinates_handle);
  Double_releaseFfiHandle_nullable(_chargeInKilowattHours_handle);
  sdk_routing_ChargingStation_releaseFfiHandle_nullable(_chargingStation_handle);
  return _result;
}

Arrival sdk_routing_Arrival_fromFfi(Pointer<Void> handle) {
  final _type_handle = _sdk_routing_Arrival_get_field_type(handle);
  final _waypointIndex_handle = _sdk_routing_Arrival_get_field_waypointIndex(handle);
  final _originalCoordinates_handle = _sdk_routing_Arrival_get_field_originalCoordinates(handle);
  final _mapMatchedCoordinates_handle = _sdk_routing_Arrival_get_field_mapMatchedCoordinates(handle);
  final _chargeInKilowattHours_handle = _sdk_routing_Arrival_get_field_chargeInKilowattHours(handle);
  final _chargingStation_handle = _sdk_routing_Arrival_get_field_chargingStation(handle);
  try {
    return Arrival(
      sdk_routing_RoutePlaceType_fromFfi(_type_handle), 
    
      Int_fromFfi_nullable(_waypointIndex_handle), 
    
      sdk_core_GeoCoordinates_fromFfi_nullable(_originalCoordinates_handle), 
    
      sdk_core_GeoCoordinates_fromFfi(_mapMatchedCoordinates_handle), 
    
      Double_fromFfi_nullable(_chargeInKilowattHours_handle), 
    
      sdk_routing_ChargingStation_fromFfi_nullable(_chargingStation_handle)
    );
  } finally {
    sdk_routing_RoutePlaceType_releaseFfiHandle(_type_handle);
    Int_releaseFfiHandle_nullable(_waypointIndex_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle_nullable(_originalCoordinates_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_mapMatchedCoordinates_handle);
    Double_releaseFfiHandle_nullable(_chargeInKilowattHours_handle);
    sdk_routing_ChargingStation_releaseFfiHandle_nullable(_chargingStation_handle);
  }
}

void sdk_routing_Arrival_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_Arrival_release_handle(handle);

// Nullable Arrival

final _sdk_routing_Arrival_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_create_handle_nullable'));
final _sdk_routing_Arrival_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_release_handle_nullable'));
final _sdk_routing_Arrival_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Arrival_get_value_nullable'));

Pointer<Void> sdk_routing_Arrival_toFfi_nullable(Arrival value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_Arrival_toFfi(value);
  final result = _sdk_routing_Arrival_create_handle_nullable(_handle);
  sdk_routing_Arrival_releaseFfiHandle(_handle);
  return result;
}

Arrival sdk_routing_Arrival_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_Arrival_get_value_nullable(handle);
  final result = sdk_routing_Arrival_fromFfi(_handle);
  sdk_routing_Arrival_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_Arrival_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_Arrival_release_handle_nullable(handle);

// End of Arrival "private" section.

