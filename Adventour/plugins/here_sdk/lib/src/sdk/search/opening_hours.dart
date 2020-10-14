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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/search/schedule_details.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents opening hours information.
@immutable
class OpeningHours {
  /// The list of opening hours presented as localized text.
  final List<String> text;

  /// Boolean flag informing if the place is open or closed at the time when the search request was initiated.
  final bool isOpen;

  /// The list of schedule details.
  final List<ScheduleDetails> scheduleDetailsList;


  const OpeningHours(this.text, this.isOpen, this.scheduleDetailsList);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! OpeningHours) return false;
    OpeningHours _other = other;
    return DeepCollectionEquality().equals(text, _other.text) &&
        isOpen == _other.isOpen &&
        DeepCollectionEquality().equals(scheduleDetailsList, _other.scheduleDetailsList);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(text);
    result = 31 * result + isOpen.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(scheduleDetailsList);
    return result;
  }
}


// OpeningHours "private" section, not exported.

final _sdk_search_OpeningHours_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint8, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_create_handle'));
final _sdk_search_OpeningHours_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_release_handle'));
final _sdk_search_OpeningHours_get_field_text = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_get_field_text'));
final _sdk_search_OpeningHours_get_field_isOpen = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_get_field_isOpen'));
final _sdk_search_OpeningHours_get_field_scheduleDetailsList = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_get_field_scheduleDetailsList'));

Pointer<Void> sdk_search_OpeningHours_toFfi(OpeningHours value) {
  final _text_handle = heresdk_search_common_bindings_ListOf_String_toFfi(value.text);
  final _isOpen_handle = Boolean_toFfi(value.isOpen);
  final _scheduleDetailsList_handle = heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_toFfi(value.scheduleDetailsList);
  final _result = _sdk_search_OpeningHours_create_handle(_text_handle, _isOpen_handle, _scheduleDetailsList_handle);
  heresdk_search_common_bindings_ListOf_String_releaseFfiHandle(_text_handle);
  Boolean_releaseFfiHandle(_isOpen_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_releaseFfiHandle(_scheduleDetailsList_handle);
  return _result;
}

OpeningHours sdk_search_OpeningHours_fromFfi(Pointer<Void> handle) {
  final _text_handle = _sdk_search_OpeningHours_get_field_text(handle);
  final _isOpen_handle = _sdk_search_OpeningHours_get_field_isOpen(handle);
  final _scheduleDetailsList_handle = _sdk_search_OpeningHours_get_field_scheduleDetailsList(handle);
  try {
    return OpeningHours(
      heresdk_search_common_bindings_ListOf_String_fromFfi(_text_handle), 
    
      Boolean_fromFfi(_isOpen_handle), 
    
      heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_fromFfi(_scheduleDetailsList_handle)
    );
  } finally {
    heresdk_search_common_bindings_ListOf_String_releaseFfiHandle(_text_handle);
    Boolean_releaseFfiHandle(_isOpen_handle);
    heresdk_search_common_bindings_ListOf_sdk_search_ScheduleDetails_releaseFfiHandle(_scheduleDetailsList_handle);
  }
}

void sdk_search_OpeningHours_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_OpeningHours_release_handle(handle);

// Nullable OpeningHours

final _sdk_search_OpeningHours_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_create_handle_nullable'));
final _sdk_search_OpeningHours_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_release_handle_nullable'));
final _sdk_search_OpeningHours_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_get_value_nullable'));

Pointer<Void> sdk_search_OpeningHours_toFfi_nullable(OpeningHours value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_OpeningHours_toFfi(value);
  final result = _sdk_search_OpeningHours_create_handle_nullable(_handle);
  sdk_search_OpeningHours_releaseFfiHandle(_handle);
  return result;
}

OpeningHours sdk_search_OpeningHours_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_OpeningHours_get_value_nullable(handle);
  final result = sdk_search_OpeningHours_fromFfi(_handle);
  sdk_search_OpeningHours_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_OpeningHours_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_OpeningHours_release_handle_nullable(handle);

// End of OpeningHours "private" section.

