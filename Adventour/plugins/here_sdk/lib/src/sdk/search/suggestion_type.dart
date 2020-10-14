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

/// Specifies the type of suggestion returned for query.
enum SuggestionType {
    /// Suggestion of category, for example restaurant, museum, hotel, etc.
    category,
    /// Suggestion of a business or non-business chain, for example specific supermarket or restaurant chain.
    chain,
    /// Suggestion of a concrete place in the world, for example a specific restaurant, address, country, etc.
    place
}

// SuggestionType "private" section, not exported.

int sdk_search_SuggestionType_toFfi(SuggestionType value) {
  switch (value) {
  case SuggestionType.category:
    return 0;
  break;
  case SuggestionType.chain:
    return 1;
  break;
  case SuggestionType.place:
    return 2;
  break;
  default:
    throw StateError("Invalid enum value $value for SuggestionType enum.");
  }
}

SuggestionType sdk_search_SuggestionType_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return SuggestionType.category;
  break;
  case 1:
    return SuggestionType.chain;
  break;
  case 2:
    return SuggestionType.place;
  break;
  default:
    throw StateError("Invalid numeric value $handle for SuggestionType enum.");
  }
}

void sdk_search_SuggestionType_releaseFfiHandle(int handle) {}

final _sdk_search_SuggestionType_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_search_SuggestionType_create_handle_nullable'));
final _sdk_search_SuggestionType_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestionType_release_handle_nullable'));
final _sdk_search_SuggestionType_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestionType_get_value_nullable'));

Pointer<Void> sdk_search_SuggestionType_toFfi_nullable(SuggestionType value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_SuggestionType_toFfi(value);
  final result = _sdk_search_SuggestionType_create_handle_nullable(_handle);
  sdk_search_SuggestionType_releaseFfiHandle(_handle);
  return result;
}

SuggestionType sdk_search_SuggestionType_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_SuggestionType_get_value_nullable(handle);
  final result = sdk_search_SuggestionType_fromFfi(_handle);
  sdk_search_SuggestionType_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_SuggestionType_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_SuggestionType_release_handle_nullable(handle);

// End of SuggestionType "private" section.

