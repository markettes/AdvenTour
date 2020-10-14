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

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Contains information about provider of the item
/// and a direct link to the item.

class WebSource {
  /// Direct link to the page containing source.
  String href;

  /// Original supplier of the item.
  String supplierId;


  WebSource(this.href, this.supplierId);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! WebSource) return false;
    WebSource _other = other;
    return href == _other.href &&
        supplierId == _other.supplierId;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + href.hashCode;
    result = 31 * result + supplierId.hashCode;
    return result;
  }
}


// WebSource "private" section, not exported.

final _sdk_search_WebSource_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_WebSource_create_handle'));
final _sdk_search_WebSource_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebSource_release_handle'));
final _sdk_search_WebSource_get_field_href = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebSource_get_field_href'));
final _sdk_search_WebSource_get_field_supplierId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebSource_get_field_supplierId'));

Pointer<Void> sdk_search_WebSource_toFfi(WebSource value) {
  final _href_handle = String_toFfi(value.href);
  final _supplierId_handle = String_toFfi(value.supplierId);
  final _result = _sdk_search_WebSource_create_handle(_href_handle, _supplierId_handle);
  String_releaseFfiHandle(_href_handle);
  String_releaseFfiHandle(_supplierId_handle);
  return _result;
}

WebSource sdk_search_WebSource_fromFfi(Pointer<Void> handle) {
  final _href_handle = _sdk_search_WebSource_get_field_href(handle);
  final _supplierId_handle = _sdk_search_WebSource_get_field_supplierId(handle);
  try {
    return WebSource(
      String_fromFfi(_href_handle), 
    
      String_fromFfi(_supplierId_handle)
    );
  } finally {
    String_releaseFfiHandle(_href_handle);
    String_releaseFfiHandle(_supplierId_handle);
  }
}

void sdk_search_WebSource_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_WebSource_release_handle(handle);

// Nullable WebSource

final _sdk_search_WebSource_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebSource_create_handle_nullable'));
final _sdk_search_WebSource_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebSource_release_handle_nullable'));
final _sdk_search_WebSource_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebSource_get_value_nullable'));

Pointer<Void> sdk_search_WebSource_toFfi_nullable(WebSource value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_WebSource_toFfi(value);
  final result = _sdk_search_WebSource_create_handle_nullable(_handle);
  sdk_search_WebSource_releaseFfiHandle(_handle);
  return result;
}

WebSource sdk_search_WebSource_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_WebSource_get_value_nullable(handle);
  final result = sdk_search_WebSource_fromFfi(_handle);
  sdk_search_WebSource_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_WebSource_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_WebSource_release_handle_nullable(handle);

// End of WebSource "private" section.

