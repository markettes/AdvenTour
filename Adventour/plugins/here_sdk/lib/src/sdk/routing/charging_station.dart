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
import 'package:here_sdk/src/sdk/routing/charging_connector_attributes.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Data for an electric vehicle charging station.

class ChargingStation {
  /// Identifier of this  charging station.
  String id;

  /// Human readable name of this charging station.
  String name;

  /// Details of the connector suggested to be used.
  ChargingConnectorAttributes connectorAttributes;


  ChargingStation(this.id, this.name, this.connectorAttributes);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! ChargingStation) return false;
    ChargingStation _other = other;
    return id == _other.id &&
        name == _other.name &&
        connectorAttributes == _other.connectorAttributes;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + id.hashCode;
    result = 31 * result + name.hashCode;
    result = 31 * result + connectorAttributes.hashCode;
    return result;
  }
}


// ChargingStation "private" section, not exported.

final _sdk_routing_ChargingStation_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingStation_create_handle'));
final _sdk_routing_ChargingStation_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingStation_release_handle'));
final _sdk_routing_ChargingStation_get_field_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingStation_get_field_id'));
final _sdk_routing_ChargingStation_get_field_name = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingStation_get_field_name'));
final _sdk_routing_ChargingStation_get_field_connectorAttributes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingStation_get_field_connectorAttributes'));

Pointer<Void> sdk_routing_ChargingStation_toFfi(ChargingStation value) {
  final _id_handle = String_toFfi_nullable(value.id);
  final _name_handle = String_toFfi_nullable(value.name);
  final _connectorAttributes_handle = sdk_routing_ChargingConnectorAttributes_toFfi_nullable(value.connectorAttributes);
  final _result = _sdk_routing_ChargingStation_create_handle(_id_handle, _name_handle, _connectorAttributes_handle);
  String_releaseFfiHandle_nullable(_id_handle);
  String_releaseFfiHandle_nullable(_name_handle);
  sdk_routing_ChargingConnectorAttributes_releaseFfiHandle_nullable(_connectorAttributes_handle);
  return _result;
}

ChargingStation sdk_routing_ChargingStation_fromFfi(Pointer<Void> handle) {
  final _id_handle = _sdk_routing_ChargingStation_get_field_id(handle);
  final _name_handle = _sdk_routing_ChargingStation_get_field_name(handle);
  final _connectorAttributes_handle = _sdk_routing_ChargingStation_get_field_connectorAttributes(handle);
  try {
    return ChargingStation(
      String_fromFfi_nullable(_id_handle), 
    
      String_fromFfi_nullable(_name_handle), 
    
      sdk_routing_ChargingConnectorAttributes_fromFfi_nullable(_connectorAttributes_handle)
    );
  } finally {
    String_releaseFfiHandle_nullable(_id_handle);
    String_releaseFfiHandle_nullable(_name_handle);
    sdk_routing_ChargingConnectorAttributes_releaseFfiHandle_nullable(_connectorAttributes_handle);
  }
}

void sdk_routing_ChargingStation_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_ChargingStation_release_handle(handle);

// Nullable ChargingStation

final _sdk_routing_ChargingStation_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingStation_create_handle_nullable'));
final _sdk_routing_ChargingStation_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingStation_release_handle_nullable'));
final _sdk_routing_ChargingStation_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingStation_get_value_nullable'));

Pointer<Void> sdk_routing_ChargingStation_toFfi_nullable(ChargingStation value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_ChargingStation_toFfi(value);
  final result = _sdk_routing_ChargingStation_create_handle_nullable(_handle);
  sdk_routing_ChargingStation_releaseFfiHandle(_handle);
  return result;
}

ChargingStation sdk_routing_ChargingStation_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_ChargingStation_get_value_nullable(handle);
  final result = sdk_routing_ChargingStation_fromFfi(_handle);
  sdk_routing_ChargingStation_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_ChargingStation_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_ChargingStation_release_handle_nullable(handle);

// End of ChargingStation "private" section.

