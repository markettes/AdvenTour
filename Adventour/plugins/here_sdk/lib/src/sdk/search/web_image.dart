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

/// Contains image information and direct link to it.

class WebImage {
  /// Photo publication date.
  DateTime date;

  /// Detailed information about image.
  WebSource source;


  WebImage(this.date, this.source);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! WebImage) return false;
    WebImage _other = other;
    return date == _other.date &&
        source == _other.source;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + date.hashCode;
    result = 31 * result + source.hashCode;
    return result;
  }
}


// WebImage "private" section, not exported.

final _sdk_search_WebImage_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('here_sdk_sdk_search_WebImage_create_handle'));
final _sdk_search_WebImage_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebImage_release_handle'));
final _sdk_search_WebImage_get_field_date = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebImage_get_field_date'));
final _sdk_search_WebImage_get_field_source = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebImage_get_field_source'));

Pointer<Void> sdk_search_WebImage_toFfi(WebImage value) {
  final _date_handle = Date_toFfi(value.date);
  final _source_handle = sdk_search_WebSource_toFfi(value.source);
  final _result = _sdk_search_WebImage_create_handle(_date_handle, _source_handle);
  Date_releaseFfiHandle(_date_handle);
  sdk_search_WebSource_releaseFfiHandle(_source_handle);
  return _result;
}

WebImage sdk_search_WebImage_fromFfi(Pointer<Void> handle) {
  final _date_handle = _sdk_search_WebImage_get_field_date(handle);
  final _source_handle = _sdk_search_WebImage_get_field_source(handle);
  try {
    return WebImage(
      Date_fromFfi(_date_handle), 
    
      sdk_search_WebSource_fromFfi(_source_handle)
    );
  } finally {
    Date_releaseFfiHandle(_date_handle);
    sdk_search_WebSource_releaseFfiHandle(_source_handle);
  }
}

void sdk_search_WebImage_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_WebImage_release_handle(handle);

// Nullable WebImage

final _sdk_search_WebImage_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebImage_create_handle_nullable'));
final _sdk_search_WebImage_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebImage_release_handle_nullable'));
final _sdk_search_WebImage_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebImage_get_value_nullable'));

Pointer<Void> sdk_search_WebImage_toFfi_nullable(WebImage value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_WebImage_toFfi(value);
  final result = _sdk_search_WebImage_create_handle_nullable(_handle);
  sdk_search_WebImage_releaseFfiHandle(_handle);
  return result;
}

WebImage sdk_search_WebImage_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_WebImage_get_value_nullable(handle);
  final result = sdk_search_WebImage_fromFfi(_handle);
  sdk_search_WebImage_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_WebImage_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_WebImage_release_handle_nullable(handle);

// End of WebImage "private" section.

