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


/// The options to specify a Place id query.
@immutable
class PlaceIdQuery {
  /// Desired Place id to search.
  final String id;


  const PlaceIdQuery._(this.id);
  PlaceIdQuery._copy(PlaceIdQuery _other) : this._(_other.id);

  /// Constructs a PlaceIdQuery from the provided Place id.
  /// [id] Desired Place id to search.
  PlaceIdQuery(String id) : this._copy(_make(id));

  /// Constructs a PlaceIdQuery from the provided Place id.
  /// [id] Desired Place id to search.
  static PlaceIdQuery _make(String id) {
    final _make_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_PlaceIdQuery_make__String'));
    final _id_handle = String_toFfi(id);
    final __result_handle = _make_ffi(__lib.LibraryContext.isolateId, _id_handle);
    String_releaseFfiHandle(_id_handle);
    try {
      return sdk_search_PlaceIdQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_PlaceIdQuery_releaseFfiHandle(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! PlaceIdQuery) return false;
    PlaceIdQuery _other = other;
    return id == _other.id;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + id.hashCode;
    return result;
  }
}


// PlaceIdQuery "private" section, not exported.

final _sdk_search_PlaceIdQuery_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdQuery_create_handle'));
final _sdk_search_PlaceIdQuery_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdQuery_release_handle'));
final _sdk_search_PlaceIdQuery_get_field_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdQuery_get_field_id'));

Pointer<Void> sdk_search_PlaceIdQuery_toFfi(PlaceIdQuery value) {
  final _id_handle = String_toFfi(value.id);
  final _result = _sdk_search_PlaceIdQuery_create_handle(_id_handle);
  String_releaseFfiHandle(_id_handle);
  return _result;
}

PlaceIdQuery sdk_search_PlaceIdQuery_fromFfi(Pointer<Void> handle) {
  final _id_handle = _sdk_search_PlaceIdQuery_get_field_id(handle);
  try {
    return PlaceIdQuery._(
      String_fromFfi(_id_handle)
    );
  } finally {
    String_releaseFfiHandle(_id_handle);
  }
}

void sdk_search_PlaceIdQuery_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_PlaceIdQuery_release_handle(handle);

// Nullable PlaceIdQuery

final _sdk_search_PlaceIdQuery_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdQuery_create_handle_nullable'));
final _sdk_search_PlaceIdQuery_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdQuery_release_handle_nullable'));
final _sdk_search_PlaceIdQuery_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdQuery_get_value_nullable'));

Pointer<Void> sdk_search_PlaceIdQuery_toFfi_nullable(PlaceIdQuery value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_PlaceIdQuery_toFfi(value);
  final result = _sdk_search_PlaceIdQuery_create_handle_nullable(_handle);
  sdk_search_PlaceIdQuery_releaseFfiHandle(_handle);
  return result;
}

PlaceIdQuery sdk_search_PlaceIdQuery_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_PlaceIdQuery_get_value_nullable(handle);
  final result = sdk_search_PlaceIdQuery_fromFfi(_handle);
  sdk_search_PlaceIdQuery_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_PlaceIdQuery_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_PlaceIdQuery_release_handle_nullable(handle);

// End of PlaceIdQuery "private" section.

