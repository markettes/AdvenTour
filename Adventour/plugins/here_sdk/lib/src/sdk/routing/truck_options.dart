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
import 'package:here_sdk/src/sdk/routing/avoidance_options.dart';
import 'package:here_sdk/src/sdk/routing/hazardous_good.dart';
import 'package:here_sdk/src/sdk/routing/route_options.dart';
import 'package:here_sdk/src/sdk/routing/route_text_options.dart';
import 'package:here_sdk/src/sdk/routing/truck_specifications.dart';
import 'package:here_sdk/src/sdk/routing/tunnel_category.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// All the options to specify how a truck route should be calculated.

class TruckOptions {
  /// Specifies the common route calculation options.
  RouteOptions routeOptions;

  /// Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  RouteTextOptions textOptions;

  /// Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.
  AvoidanceOptions avoidanceOptions;

  /// Detailed truck specifications such as dimensions and weight.
  TruckSpecifications specifications;

  /// Specifies the tunnel categories to restrict certain route links.
  /// The route will pass only through tunnels of a less strict category.
  /// Refer to [TunnelCategory] for the available options.
  TunnelCategory tunnelCategory;

  /// Specifies a list of hazardous materials shipped in the vehicle.
  /// Refer to [HazardousGood] for the available options.
  List<HazardousGood> hazardousGoods;


  TruckOptions(this.routeOptions, this.textOptions, this.avoidanceOptions, this.specifications, this.tunnelCategory, this.hazardousGoods);

  TruckOptions.withDefaults()
    : routeOptions = RouteOptions.withDefaults(), textOptions = RouteTextOptions.withDefaults(), avoidanceOptions = AvoidanceOptions.withDefaults(), specifications = TruckSpecifications.withDefaults(), tunnelCategory = null, hazardousGoods = [];

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! TruckOptions) return false;
    TruckOptions _other = other;
    return routeOptions == _other.routeOptions &&
        textOptions == _other.textOptions &&
        avoidanceOptions == _other.avoidanceOptions &&
        specifications == _other.specifications &&
        tunnelCategory == _other.tunnelCategory &&
        DeepCollectionEquality().equals(hazardousGoods, _other.hazardousGoods);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + routeOptions.hashCode;
    result = 31 * result + textOptions.hashCode;
    result = 31 * result + avoidanceOptions.hashCode;
    result = 31 * result + specifications.hashCode;
    result = 31 * result + tunnelCategory.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(hazardousGoods);
    return result;
  }
}


// TruckOptions "private" section, not exported.

final _sdk_routing_TruckOptions_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_create_handle'));
final _sdk_routing_TruckOptions_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_release_handle'));
final _sdk_routing_TruckOptions_get_field_routeOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_get_field_routeOptions'));
final _sdk_routing_TruckOptions_get_field_textOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_get_field_textOptions'));
final _sdk_routing_TruckOptions_get_field_avoidanceOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_get_field_avoidanceOptions'));
final _sdk_routing_TruckOptions_get_field_specifications = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_get_field_specifications'));
final _sdk_routing_TruckOptions_get_field_tunnelCategory = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_get_field_tunnelCategory'));
final _sdk_routing_TruckOptions_get_field_hazardousGoods = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_get_field_hazardousGoods'));

Pointer<Void> sdk_routing_TruckOptions_toFfi(TruckOptions value) {
  final _routeOptions_handle = sdk_routing_RouteOptions_toFfi(value.routeOptions);
  final _textOptions_handle = sdk_routing_RouteTextOptions_toFfi(value.textOptions);
  final _avoidanceOptions_handle = sdk_routing_AvoidanceOptions_toFfi(value.avoidanceOptions);
  final _specifications_handle = sdk_routing_TruckSpecifications_toFfi(value.specifications);
  final _tunnelCategory_handle = sdk_routing_TunnelCategory_toFfi_nullable(value.tunnelCategory);
  final _hazardousGoods_handle = heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_toFfi(value.hazardousGoods);
  final _result = _sdk_routing_TruckOptions_create_handle(_routeOptions_handle, _textOptions_handle, _avoidanceOptions_handle, _specifications_handle, _tunnelCategory_handle, _hazardousGoods_handle);
  sdk_routing_RouteOptions_releaseFfiHandle(_routeOptions_handle);
  sdk_routing_RouteTextOptions_releaseFfiHandle(_textOptions_handle);
  sdk_routing_AvoidanceOptions_releaseFfiHandle(_avoidanceOptions_handle);
  sdk_routing_TruckSpecifications_releaseFfiHandle(_specifications_handle);
  sdk_routing_TunnelCategory_releaseFfiHandle_nullable(_tunnelCategory_handle);
  heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_releaseFfiHandle(_hazardousGoods_handle);
  return _result;
}

TruckOptions sdk_routing_TruckOptions_fromFfi(Pointer<Void> handle) {
  final _routeOptions_handle = _sdk_routing_TruckOptions_get_field_routeOptions(handle);
  final _textOptions_handle = _sdk_routing_TruckOptions_get_field_textOptions(handle);
  final _avoidanceOptions_handle = _sdk_routing_TruckOptions_get_field_avoidanceOptions(handle);
  final _specifications_handle = _sdk_routing_TruckOptions_get_field_specifications(handle);
  final _tunnelCategory_handle = _sdk_routing_TruckOptions_get_field_tunnelCategory(handle);
  final _hazardousGoods_handle = _sdk_routing_TruckOptions_get_field_hazardousGoods(handle);
  try {
    return TruckOptions(
      sdk_routing_RouteOptions_fromFfi(_routeOptions_handle), 
    
      sdk_routing_RouteTextOptions_fromFfi(_textOptions_handle), 
    
      sdk_routing_AvoidanceOptions_fromFfi(_avoidanceOptions_handle), 
    
      sdk_routing_TruckSpecifications_fromFfi(_specifications_handle), 
    
      sdk_routing_TunnelCategory_fromFfi_nullable(_tunnelCategory_handle), 
    
      heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_fromFfi(_hazardousGoods_handle)
    );
  } finally {
    sdk_routing_RouteOptions_releaseFfiHandle(_routeOptions_handle);
    sdk_routing_RouteTextOptions_releaseFfiHandle(_textOptions_handle);
    sdk_routing_AvoidanceOptions_releaseFfiHandle(_avoidanceOptions_handle);
    sdk_routing_TruckSpecifications_releaseFfiHandle(_specifications_handle);
    sdk_routing_TunnelCategory_releaseFfiHandle_nullable(_tunnelCategory_handle);
    heresdk_routing_common_bindings_ListOf_sdk_routing_HazardousGood_releaseFfiHandle(_hazardousGoods_handle);
  }
}

void sdk_routing_TruckOptions_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_TruckOptions_release_handle(handle);

// Nullable TruckOptions

final _sdk_routing_TruckOptions_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_create_handle_nullable'));
final _sdk_routing_TruckOptions_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_release_handle_nullable'));
final _sdk_routing_TruckOptions_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_get_value_nullable'));

Pointer<Void> sdk_routing_TruckOptions_toFfi_nullable(TruckOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_TruckOptions_toFfi(value);
  final result = _sdk_routing_TruckOptions_create_handle_nullable(_handle);
  sdk_routing_TruckOptions_releaseFfiHandle(_handle);
  return result;
}

TruckOptions sdk_routing_TruckOptions_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_TruckOptions_get_value_nullable(handle);
  final result = sdk_routing_TruckOptions_fromFfi(_handle);
  sdk_routing_TruckOptions_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_TruckOptions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_TruckOptions_release_handle_nullable(handle);

// End of TruckOptions "private" section.

