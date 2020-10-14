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


import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Available charging connector types.
enum ChargingConnectorType {
    /// Type 1 Combo connector, commonly called "SAE J1772".
    iec62196Type1Combo,
    /// Type 2 Combo connector, commonly called "Mennekes".
    iec62196Type2Combo,
    /// CHAdeMO connector.
    chademo,
    /// Tesla connector.
    tesla
}

// ChargingConnectorType "private" section, not exported.

int sdk_routing_ChargingConnectorType_toFfi(ChargingConnectorType value) {
  switch (value) {
  case ChargingConnectorType.iec62196Type1Combo:
    return 0;
  break;
  case ChargingConnectorType.iec62196Type2Combo:
    return 1;
  break;
  case ChargingConnectorType.chademo:
    return 2;
  break;
  case ChargingConnectorType.tesla:
    return 3;
  break;
  default:
    throw StateError("Invalid enum value $value for ChargingConnectorType enum.");
  }
}

ChargingConnectorType sdk_routing_ChargingConnectorType_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return ChargingConnectorType.iec62196Type1Combo;
  break;
  case 1:
    return ChargingConnectorType.iec62196Type2Combo;
  break;
  case 2:
    return ChargingConnectorType.chademo;
  break;
  case 3:
    return ChargingConnectorType.tesla;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ChargingConnectorType enum.");
  }
}

void sdk_routing_ChargingConnectorType_releaseFfiHandle(int handle) {}

final _sdk_routing_ChargingConnectorType_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_ChargingConnectorType_create_handle_nullable'));
final _sdk_routing_ChargingConnectorType_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorType_release_handle_nullable'));
final _sdk_routing_ChargingConnectorType_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorType_get_value_nullable'));

Pointer<Void> sdk_routing_ChargingConnectorType_toFfi_nullable(ChargingConnectorType value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_ChargingConnectorType_toFfi(value);
  final result = _sdk_routing_ChargingConnectorType_create_handle_nullable(_handle);
  sdk_routing_ChargingConnectorType_releaseFfiHandle(_handle);
  return result;
}

ChargingConnectorType sdk_routing_ChargingConnectorType_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_ChargingConnectorType_get_value_nullable(handle);
  final result = sdk_routing_ChargingConnectorType_fromFfi(_handle);
  sdk_routing_ChargingConnectorType_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_ChargingConnectorType_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_ChargingConnectorType_release_handle_nullable(handle);

// End of ChargingConnectorType "private" section.

