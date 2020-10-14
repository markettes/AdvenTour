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
import 'package:here_sdk/src/sdk/search/web_source.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Contains information about rating and a url to review.

class WebRating {
  /// Total number of ratings.
  int count;

  /// Avarage value of all ratings.
  double average;

  /// Detailed information about rating.
  WebSource source;


  WebRating(this.count, this.average, this.source);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! WebRating) return false;
    WebRating _other = other;
    return count == _other.count &&
        average == _other.average &&
        source == _other.source;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + count.hashCode;
    result = 31 * result + average.hashCode;
    result = 31 * result + source.hashCode;
    return result;
  }
}


// WebRating "private" section, not exported.

final _sdk_search_WebRating_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Double, Pointer<Void>),
    Pointer<Void> Function(int, double, Pointer<Void>)
  >('here_sdk_sdk_search_WebRating_create_handle'));
final _sdk_search_WebRating_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebRating_release_handle'));
final _sdk_search_WebRating_get_field_count = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebRating_get_field_count'));
final _sdk_search_WebRating_get_field_average = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebRating_get_field_average'));
final _sdk_search_WebRating_get_field_source = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebRating_get_field_source'));

Pointer<Void> sdk_search_WebRating_toFfi(WebRating value) {
  final _count_handle = (value.count);
  final _average_handle = (value.average);
  final _source_handle = sdk_search_WebSource_toFfi(value.source);
  final _result = _sdk_search_WebRating_create_handle(_count_handle, _average_handle, _source_handle);
  (_count_handle);
  (_average_handle);
  sdk_search_WebSource_releaseFfiHandle(_source_handle);
  return _result;
}

WebRating sdk_search_WebRating_fromFfi(Pointer<Void> handle) {
  final _count_handle = _sdk_search_WebRating_get_field_count(handle);
  final _average_handle = _sdk_search_WebRating_get_field_average(handle);
  final _source_handle = _sdk_search_WebRating_get_field_source(handle);
  try {
    return WebRating(
      (_count_handle), 
    
      (_average_handle), 
    
      sdk_search_WebSource_fromFfi(_source_handle)
    );
  } finally {
    (_count_handle);
    (_average_handle);
    sdk_search_WebSource_releaseFfiHandle(_source_handle);
  }
}

void sdk_search_WebRating_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_WebRating_release_handle(handle);

// Nullable WebRating

final _sdk_search_WebRating_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebRating_create_handle_nullable'));
final _sdk_search_WebRating_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebRating_release_handle_nullable'));
final _sdk_search_WebRating_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebRating_get_value_nullable'));

Pointer<Void> sdk_search_WebRating_toFfi_nullable(WebRating value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_WebRating_toFfi(value);
  final result = _sdk_search_WebRating_create_handle_nullable(_handle);
  sdk_search_WebRating_releaseFfiHandle(_handle);
  return result;
}

WebRating sdk_search_WebRating_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_WebRating_get_value_nullable(handle);
  final result = sdk_search_WebRating_fromFfi(_handle);
  sdk_search_WebRating_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_WebRating_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_WebRating_release_handle_nullable(handle);

// End of WebRating "private" section.

