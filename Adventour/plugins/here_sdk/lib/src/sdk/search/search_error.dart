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

/// Specifies possible errors that may result from a search query.
enum SearchError {
    /// Search operation is not authenticated. Check your credentials.
    authenticationFailed,
    /// Should be in the range \[1, 100\].
    maxItemsOutOfRange,
    /// The route polyline is too long or radius of the corridor is too small.
    /// Try passing a shorter polyline or increasing the radius.
    polylineTooLong,
    /// Error while parsing response data.
    parsingError,
    /// No results found.
    noResultsFound,
    /// Network request error.
    httpError,
    /// Server unreachable.
    serverUnreachable,
    /// At least one of the parameters has an invalid value.
    invalidParameter,
    /// The credentials given do not provide access to the resource requested.
    forbidden,
    /// Credentials exceeded the allowed requests limit.
    exceededUsageLimit,
    /// Operation failed due to an internal error.
    operationFailed,
    /// Operation cancelled.
    operationCancelled,
    /// Option is not available.
    optionNotAvailable,
    /// The request timed out.
    timedOut,
    /// The device does not have an internet connection.
    offline,
    /// Query is too long, max. size is 300 characters.
    queryTooLong,
    /// Filter is too long, max. size is 300 characters.
    filterTooLong
}

// SearchError "private" section, not exported.

int sdk_search_SearchError_toFfi(SearchError value) {
  switch (value) {
  case SearchError.authenticationFailed:
    return 1;
  break;
  case SearchError.maxItemsOutOfRange:
    return 2;
  break;
  case SearchError.polylineTooLong:
    return 3;
  break;
  case SearchError.parsingError:
    return 4;
  break;
  case SearchError.noResultsFound:
    return 5;
  break;
  case SearchError.httpError:
    return 6;
  break;
  case SearchError.serverUnreachable:
    return 7;
  break;
  case SearchError.invalidParameter:
    return 8;
  break;
  case SearchError.forbidden:
    return 9;
  break;
  case SearchError.exceededUsageLimit:
    return 10;
  break;
  case SearchError.operationFailed:
    return 11;
  break;
  case SearchError.operationCancelled:
    return 12;
  break;
  case SearchError.optionNotAvailable:
    return 13;
  break;
  case SearchError.timedOut:
    return 14;
  break;
  case SearchError.offline:
    return 15;
  break;
  case SearchError.queryTooLong:
    return 16;
  break;
  case SearchError.filterTooLong:
    return 17;
  break;
  default:
    throw StateError("Invalid enum value $value for SearchError enum.");
  }
}

SearchError sdk_search_SearchError_fromFfi(int handle) {
  switch (handle) {
  case 1:
    return SearchError.authenticationFailed;
  break;
  case 2:
    return SearchError.maxItemsOutOfRange;
  break;
  case 3:
    return SearchError.polylineTooLong;
  break;
  case 4:
    return SearchError.parsingError;
  break;
  case 5:
    return SearchError.noResultsFound;
  break;
  case 6:
    return SearchError.httpError;
  break;
  case 7:
    return SearchError.serverUnreachable;
  break;
  case 8:
    return SearchError.invalidParameter;
  break;
  case 9:
    return SearchError.forbidden;
  break;
  case 10:
    return SearchError.exceededUsageLimit;
  break;
  case 11:
    return SearchError.operationFailed;
  break;
  case 12:
    return SearchError.operationCancelled;
  break;
  case 13:
    return SearchError.optionNotAvailable;
  break;
  case 14:
    return SearchError.timedOut;
  break;
  case 15:
    return SearchError.offline;
  break;
  case 16:
    return SearchError.queryTooLong;
  break;
  case 17:
    return SearchError.filterTooLong;
  break;
  default:
    throw StateError("Invalid numeric value $handle for SearchError enum.");
  }
}

void sdk_search_SearchError_releaseFfiHandle(int handle) {}

final _sdk_search_SearchError_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_search_SearchError_create_handle_nullable'));
final _sdk_search_SearchError_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchError_release_handle_nullable'));
final _sdk_search_SearchError_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchError_get_value_nullable'));

Pointer<Void> sdk_search_SearchError_toFfi_nullable(SearchError value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_SearchError_toFfi(value);
  final result = _sdk_search_SearchError_create_handle_nullable(_handle);
  sdk_search_SearchError_releaseFfiHandle(_handle);
  return result;
}

SearchError sdk_search_SearchError_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_SearchError_get_value_nullable(handle);
  final result = sdk_search_SearchError_fromFfi(_handle);
  sdk_search_SearchError_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_SearchError_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_SearchError_release_handle_nullable(handle);

// End of SearchError "private" section.

