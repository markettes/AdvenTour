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

/// Specifies possible errors that may result from the calculation of a route.
enum RoutingError {
    /// Generic internal error.
    internalError,
    /// An invalid input parameter.
    invalidParameter,
    /// Routing server is unreachable.
    serverUnreachable,
    /// A general network request error.
    httpError,
    /// Routing operation is not authenticated. Check your credentials.
    authenticationFailed,
    /// The provided credentials don't give access to the requested resource.
    forbidden,
    /// Credentials exceeded the allowed requests limit.
    exceededUsageLimit,
    /// Error while parsing route data.
    parsingError,
    /// No route can be calculated for the given input.
    noRouteFound,
    /// The request timed out.
    timedOut,
    /// The device has no internet connection.
    offline
}

// RoutingError "private" section, not exported.

int sdk_routing_RoutingError_toFfi(RoutingError value) {
  switch (value) {
  case RoutingError.internalError:
    return 1;
  break;
  case RoutingError.invalidParameter:
    return 2;
  break;
  case RoutingError.serverUnreachable:
    return 3;
  break;
  case RoutingError.httpError:
    return 4;
  break;
  case RoutingError.authenticationFailed:
    return 5;
  break;
  case RoutingError.forbidden:
    return 6;
  break;
  case RoutingError.exceededUsageLimit:
    return 7;
  break;
  case RoutingError.parsingError:
    return 8;
  break;
  case RoutingError.noRouteFound:
    return 9;
  break;
  case RoutingError.timedOut:
    return 10;
  break;
  case RoutingError.offline:
    return 11;
  break;
  default:
    throw StateError("Invalid enum value $value for RoutingError enum.");
  }
}

RoutingError sdk_routing_RoutingError_fromFfi(int handle) {
  switch (handle) {
  case 1:
    return RoutingError.internalError;
  break;
  case 2:
    return RoutingError.invalidParameter;
  break;
  case 3:
    return RoutingError.serverUnreachable;
  break;
  case 4:
    return RoutingError.httpError;
  break;
  case 5:
    return RoutingError.authenticationFailed;
  break;
  case 6:
    return RoutingError.forbidden;
  break;
  case 7:
    return RoutingError.exceededUsageLimit;
  break;
  case 8:
    return RoutingError.parsingError;
  break;
  case 9:
    return RoutingError.noRouteFound;
  break;
  case 10:
    return RoutingError.timedOut;
  break;
  case 11:
    return RoutingError.offline;
  break;
  default:
    throw StateError("Invalid numeric value $handle for RoutingError enum.");
  }
}

void sdk_routing_RoutingError_releaseFfiHandle(int handle) {}

final _sdk_routing_RoutingError_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_RoutingError_create_handle_nullable'));
final _sdk_routing_RoutingError_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingError_release_handle_nullable'));
final _sdk_routing_RoutingError_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingError_get_value_nullable'));

Pointer<Void> sdk_routing_RoutingError_toFfi_nullable(RoutingError value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_RoutingError_toFfi(value);
  final result = _sdk_routing_RoutingError_create_handle_nullable(_handle);
  sdk_routing_RoutingError_releaseFfiHandle(_handle);
  return result;
}

RoutingError sdk_routing_RoutingError_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_RoutingError_get_value_nullable(handle);
  final result = sdk_routing_RoutingError_fromFfi(_handle);
  sdk_routing_RoutingError_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_RoutingError_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_RoutingError_release_handle_nullable(handle);

// End of RoutingError "private" section.

