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
import 'package:here_sdk/src/sdk/core/language_code.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Encapsulates options that control the behavior of search and suggest operations.

class SearchOptions {
  /// The preferred language of the result. When unset or unsupported language is chosen,
  /// results will be returned in their local language.
  LanguageCode languageCode;

  /// The maximum number of items in the response. When not set,
  /// results will be unlimited.
  int maxItems;


  /// Creates an Options object.
  ///
  /// If no parameters are passed, uses default values
  /// (see fields description).

  /// [languageCode] The preferred language of the result. When unset or unsupported language is chosen,
  /// results will be returned in their local language.

  /// [maxItems] The maximum number of items in the response. When not set,
  /// results will be unlimited.

  SearchOptions(this.languageCode, this.maxItems);

  SearchOptions.withDefaults()
    : languageCode = null, maxItems = null;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! SearchOptions) return false;
    SearchOptions _other = other;
    return languageCode == _other.languageCode &&
        maxItems == _other.maxItems;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + languageCode.hashCode;
    result = 31 * result + maxItems.hashCode;
    return result;
  }
}


// SearchOptions "private" section, not exported.

final _sdk_search_SearchOptions_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_SearchOptions_create_handle'));
final _sdk_search_SearchOptions_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchOptions_release_handle'));
final _sdk_search_SearchOptions_get_field_languageCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchOptions_get_field_languageCode'));
final _sdk_search_SearchOptions_get_field_maxItems = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchOptions_get_field_maxItems'));

Pointer<Void> sdk_search_SearchOptions_toFfi(SearchOptions value) {
  final _languageCode_handle = sdk_core_LanguageCode_toFfi_nullable(value.languageCode);
  final _maxItems_handle = Int_toFfi_nullable(value.maxItems);
  final _result = _sdk_search_SearchOptions_create_handle(_languageCode_handle, _maxItems_handle);
  sdk_core_LanguageCode_releaseFfiHandle_nullable(_languageCode_handle);
  Int_releaseFfiHandle_nullable(_maxItems_handle);
  return _result;
}

SearchOptions sdk_search_SearchOptions_fromFfi(Pointer<Void> handle) {
  final _languageCode_handle = _sdk_search_SearchOptions_get_field_languageCode(handle);
  final _maxItems_handle = _sdk_search_SearchOptions_get_field_maxItems(handle);
  try {
    return SearchOptions(
      sdk_core_LanguageCode_fromFfi_nullable(_languageCode_handle), 
    
      Int_fromFfi_nullable(_maxItems_handle)
    );
  } finally {
    sdk_core_LanguageCode_releaseFfiHandle_nullable(_languageCode_handle);
    Int_releaseFfiHandle_nullable(_maxItems_handle);
  }
}

void sdk_search_SearchOptions_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_SearchOptions_release_handle(handle);

// Nullable SearchOptions

final _sdk_search_SearchOptions_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchOptions_create_handle_nullable'));
final _sdk_search_SearchOptions_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchOptions_release_handle_nullable'));
final _sdk_search_SearchOptions_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchOptions_get_value_nullable'));

Pointer<Void> sdk_search_SearchOptions_toFfi_nullable(SearchOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_SearchOptions_toFfi(value);
  final result = _sdk_search_SearchOptions_create_handle_nullable(_handle);
  sdk_search_SearchOptions_releaseFfiHandle(_handle);
  return result;
}

SearchOptions sdk_search_SearchOptions_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_SearchOptions_get_value_nullable(handle);
  final result = sdk_search_SearchOptions_fromFfi(_handle);
  sdk_search_SearchOptions_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_SearchOptions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_SearchOptions_release_handle_nullable(handle);

// End of SearchOptions "private" section.

