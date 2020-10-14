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

import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/search/highlight_type.dart';
import 'package:here_sdk/src/sdk/search/index_range.dart';
import 'package:here_sdk/src/sdk/search/place.dart';
import 'package:here_sdk/src/sdk/search/suggestion_type.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Suggestion is meant to provide relevant suggestions to partial queries, like "restaur", "starbu", "eiffel".
///
/// Represents a relevant response to user queries.
/// Suggestions (please check [SuggestionType]) are either:
/// Place: [SuggestionType.place]
/// Query: [SuggestionType.chain] or [SuggestionType.category]
///
/// With "Place" you get data for a concrete place in the world.
/// With "Query" something to follow-up, a way to perform more focused search.
abstract class Suggestion {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// The text slices matching the input query.
  /// Returns [Map<HighlightType, List<IndexRange>>]. Associated container where [HighlightType] is a key and list of [IndexRange] value.
  Map<HighlightType, List<IndexRange>> getHighlights();


  /// Gets the localized title for the suggestion.
  String get title;





  /// Gets the type of suggestion.
  SuggestionType get type;





  /// Gets the suggested place item.
  Place get place;





  /// Gets the direct link for Discover query.
  String get href;



}


// Suggestion "private" section, not exported.

final _sdk_search_Suggestion_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Suggestion_copy_handle'));
final _sdk_search_Suggestion_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Suggestion_release_handle'));
final _sdk_search_Suggestion_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_search_Suggestion_get_raw_pointer'));


class Suggestion$Impl implements Suggestion {
  @protected
  Pointer<Void> handle;

  Suggestion$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_search_Suggestion_get_raw_pointer(handle));
    _sdk_search_Suggestion_release_handle(handle);
    handle = null;
  }

  @override
  Map<HighlightType, List<IndexRange>> getHighlights() {
    final _getHighlights_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Suggestion_getHighlights'));
    final _handle = this.handle;
    final __result_handle = _getHighlights_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_fromFfi(__result_handle);
    } finally {
      heresdk_search_bindings_MapOf_sdk_search_HighlightType_to_heresdk_search_bindings_ListOf_sdk_search_IndexRange_releaseFfiHandle(__result_handle);
    }
  }

  @override
  String get title {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Suggestion_title_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }


  @override
  SuggestionType get type {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_search_Suggestion_type_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_search_SuggestionType_fromFfi(__result_handle);
    } finally {
      sdk_search_SuggestionType_releaseFfiHandle(__result_handle);
    }
  }


  @override
  Place get place {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Suggestion_place_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_search_Place_fromFfi_nullable(__result_handle);
    } finally {
      sdk_search_Place_releaseFfiHandle_nullable(__result_handle);
    }
  }


  @override
  String get href {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Suggestion_href_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi_nullable(__result_handle);
    } finally {
      String_releaseFfiHandle_nullable(__result_handle);
    }
  }



}

Pointer<Void> sdk_search_Suggestion_toFfi(Suggestion value) =>
  _sdk_search_Suggestion_copy_handle((value as Suggestion$Impl).handle);

Suggestion sdk_search_Suggestion_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_search_Suggestion_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as Suggestion;
  if (instance != null) return instance;

  final _copied_handle = _sdk_search_Suggestion_copy_handle(handle);
  final result = Suggestion$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_search_Suggestion_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_search_Suggestion_release_handle(handle);

Pointer<Void> sdk_search_Suggestion_toFfi_nullable(Suggestion value) =>
  value != null ? sdk_search_Suggestion_toFfi(value) : Pointer<Void>.fromAddress(0);

Suggestion sdk_search_Suggestion_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_search_Suggestion_fromFfi(handle) : null;

void sdk_search_Suggestion_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_Suggestion_release_handle(handle);

// End of Suggestion "private" section.

