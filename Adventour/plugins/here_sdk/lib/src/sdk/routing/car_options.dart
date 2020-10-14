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
import 'package:here_sdk/src/sdk/routing/avoidance_options.dart';
import 'package:here_sdk/src/sdk/routing/route_options.dart';
import 'package:here_sdk/src/sdk/routing/route_text_options.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// All the options to specify how a car route should be calculated.

class CarOptions {
  /// Specifies the common route calculation options.
  RouteOptions routeOptions;

  /// Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  RouteTextOptions textOptions;

  /// Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.
  AvoidanceOptions avoidanceOptions;


  CarOptions(this.routeOptions, this.textOptions, this.avoidanceOptions);

  CarOptions.withDefaults()
    : routeOptions = RouteOptions.withDefaults(), textOptions = RouteTextOptions.withDefaults(), avoidanceOptions = AvoidanceOptions.withDefaults();

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! CarOptions) return false;
    CarOptions _other = other;
    return routeOptions == _other.routeOptions &&
        textOptions == _other.textOptions &&
        avoidanceOptions == _other.avoidanceOptions;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + routeOptions.hashCode;
    result = 31 * result + textOptions.hashCode;
    result = 31 * result + avoidanceOptions.hashCode;
    return result;
  }
}


// CarOptions "private" section, not exported.

final _sdk_routing_CarOptions_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_create_handle'));
final _sdk_routing_CarOptions_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_release_handle'));
final _sdk_routing_CarOptions_get_field_routeOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_get_field_routeOptions'));
final _sdk_routing_CarOptions_get_field_textOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_get_field_textOptions'));
final _sdk_routing_CarOptions_get_field_avoidanceOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_get_field_avoidanceOptions'));

Pointer<Void> sdk_routing_CarOptions_toFfi(CarOptions value) {
  final _routeOptions_handle = sdk_routing_RouteOptions_toFfi(value.routeOptions);
  final _textOptions_handle = sdk_routing_RouteTextOptions_toFfi(value.textOptions);
  final _avoidanceOptions_handle = sdk_routing_AvoidanceOptions_toFfi(value.avoidanceOptions);
  final _result = _sdk_routing_CarOptions_create_handle(_routeOptions_handle, _textOptions_handle, _avoidanceOptions_handle);
  sdk_routing_RouteOptions_releaseFfiHandle(_routeOptions_handle);
  sdk_routing_RouteTextOptions_releaseFfiHandle(_textOptions_handle);
  sdk_routing_AvoidanceOptions_releaseFfiHandle(_avoidanceOptions_handle);
  return _result;
}

CarOptions sdk_routing_CarOptions_fromFfi(Pointer<Void> handle) {
  final _routeOptions_handle = _sdk_routing_CarOptions_get_field_routeOptions(handle);
  final _textOptions_handle = _sdk_routing_CarOptions_get_field_textOptions(handle);
  final _avoidanceOptions_handle = _sdk_routing_CarOptions_get_field_avoidanceOptions(handle);
  try {
    return CarOptions(
      sdk_routing_RouteOptions_fromFfi(_routeOptions_handle), 
    
      sdk_routing_RouteTextOptions_fromFfi(_textOptions_handle), 
    
      sdk_routing_AvoidanceOptions_fromFfi(_avoidanceOptions_handle)
    );
  } finally {
    sdk_routing_RouteOptions_releaseFfiHandle(_routeOptions_handle);
    sdk_routing_RouteTextOptions_releaseFfiHandle(_textOptions_handle);
    sdk_routing_AvoidanceOptions_releaseFfiHandle(_avoidanceOptions_handle);
  }
}

void sdk_routing_CarOptions_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_CarOptions_release_handle(handle);

// Nullable CarOptions

final _sdk_routing_CarOptions_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_create_handle_nullable'));
final _sdk_routing_CarOptions_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_release_handle_nullable'));
final _sdk_routing_CarOptions_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_get_value_nullable'));

Pointer<Void> sdk_routing_CarOptions_toFfi_nullable(CarOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_CarOptions_toFfi(value);
  final result = _sdk_routing_CarOptions_create_handle_nullable(_handle);
  sdk_routing_CarOptions_releaseFfiHandle(_handle);
  return result;
}

CarOptions sdk_routing_CarOptions_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_CarOptions_get_value_nullable(handle);
  final result = sdk_routing_CarOptions_fromFfi(_handle);
  sdk_routing_CarOptions_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_CarOptions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_CarOptions_release_handle_nullable(handle);

// End of CarOptions "private" section.

