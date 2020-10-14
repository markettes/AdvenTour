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


/// @nodoc

class DirectedLink {
  /// @nodoc
  String internalsegmentid;


  DirectedLink._(this.internalsegmentid);
  DirectedLink._copy(DirectedLink _other) : this._(_other.internalsegmentid);


  /// @nodoc
  DirectedLink(String segmentid) : this._copy(_withSegmentid(segmentid));


  /// @nodoc
  static DirectedLink _withSegmentid(String segmentid) {
    final _withSegmentid_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_DirectedLink_make__String'));
    final _segmentid_handle = String_toFfi(segmentid);
    final __result_handle = _withSegmentid_ffi(__lib.LibraryContext.isolateId, _segmentid_handle);
    String_releaseFfiHandle(_segmentid_handle);
    try {
      return sdk_routing_DirectedLink_fromFfi(__result_handle);
    } finally {
      sdk_routing_DirectedLink_releaseFfiHandle(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! DirectedLink) return false;
    DirectedLink _other = other;
    return internalsegmentid == _other.internalsegmentid;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalsegmentid.hashCode;
    return result;
  }
}


// DirectedLink "private" section, not exported.

final _sdk_routing_DirectedLink_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DirectedLink_create_handle'));
final _sdk_routing_DirectedLink_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DirectedLink_release_handle'));
final _sdk_routing_DirectedLink_get_field_segmentid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DirectedLink_get_field_segmentid'));

Pointer<Void> sdk_routing_DirectedLink_toFfi(DirectedLink value) {
  final _segmentid_handle = String_toFfi_nullable(value.internalsegmentid);
  final _result = _sdk_routing_DirectedLink_create_handle(_segmentid_handle);
  String_releaseFfiHandle_nullable(_segmentid_handle);
  return _result;
}

DirectedLink sdk_routing_DirectedLink_fromFfi(Pointer<Void> handle) {
  final _segmentid_handle = _sdk_routing_DirectedLink_get_field_segmentid(handle);
  try {
    return DirectedLink._(
      String_fromFfi_nullable(_segmentid_handle)
    );
  } finally {
    String_releaseFfiHandle_nullable(_segmentid_handle);
  }
}

void sdk_routing_DirectedLink_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_DirectedLink_release_handle(handle);

// Nullable DirectedLink

final _sdk_routing_DirectedLink_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DirectedLink_create_handle_nullable'));
final _sdk_routing_DirectedLink_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DirectedLink_release_handle_nullable'));
final _sdk_routing_DirectedLink_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DirectedLink_get_value_nullable'));

Pointer<Void> sdk_routing_DirectedLink_toFfi_nullable(DirectedLink value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_DirectedLink_toFfi(value);
  final result = _sdk_routing_DirectedLink_create_handle_nullable(_handle);
  sdk_routing_DirectedLink_releaseFfiHandle(_handle);
  return result;
}

DirectedLink sdk_routing_DirectedLink_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_DirectedLink_get_value_nullable(handle);
  final result = sdk_routing_DirectedLink_fromFfi(_handle);
  sdk_routing_DirectedLink_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_DirectedLink_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_DirectedLink_release_handle_nullable(handle);

// End of DirectedLink "private" section.

