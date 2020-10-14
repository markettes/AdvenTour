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

/// Encapsulates schedule details complying with the iCalendar specification: https://tools.ietf.org/html/rfc5545.
@immutable
class ScheduleDetails {
  /// Specifies when the iCalendar component begins, for example "T000000" (starts at midnight).
  final String start;

  /// Specifies a positive duration of time for the iCalendar component, for example "PT24H00M" (lasts 24h).
  final String duration;

  /// The recurrence information for a iCalendar component, for example "FREQ:DAILY;BYDAY:MO,TU,WE,TH,FR,SA".
  final String recurrence;


  const ScheduleDetails(this.start, this.duration, this.recurrence);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! ScheduleDetails) return false;
    ScheduleDetails _other = other;
    return start == _other.start &&
        duration == _other.duration &&
        recurrence == _other.recurrence;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + start.hashCode;
    result = 31 * result + duration.hashCode;
    result = 31 * result + recurrence.hashCode;
    return result;
  }
}


// ScheduleDetails "private" section, not exported.

final _sdk_search_ScheduleDetails_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_ScheduleDetails_create_handle'));
final _sdk_search_ScheduleDetails_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_ScheduleDetails_release_handle'));
final _sdk_search_ScheduleDetails_get_field_start = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ScheduleDetails_get_field_start'));
final _sdk_search_ScheduleDetails_get_field_duration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ScheduleDetails_get_field_duration'));
final _sdk_search_ScheduleDetails_get_field_recurrence = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ScheduleDetails_get_field_recurrence'));

Pointer<Void> sdk_search_ScheduleDetails_toFfi(ScheduleDetails value) {
  final _start_handle = String_toFfi(value.start);
  final _duration_handle = String_toFfi(value.duration);
  final _recurrence_handle = String_toFfi(value.recurrence);
  final _result = _sdk_search_ScheduleDetails_create_handle(_start_handle, _duration_handle, _recurrence_handle);
  String_releaseFfiHandle(_start_handle);
  String_releaseFfiHandle(_duration_handle);
  String_releaseFfiHandle(_recurrence_handle);
  return _result;
}

ScheduleDetails sdk_search_ScheduleDetails_fromFfi(Pointer<Void> handle) {
  final _start_handle = _sdk_search_ScheduleDetails_get_field_start(handle);
  final _duration_handle = _sdk_search_ScheduleDetails_get_field_duration(handle);
  final _recurrence_handle = _sdk_search_ScheduleDetails_get_field_recurrence(handle);
  try {
    return ScheduleDetails(
      String_fromFfi(_start_handle), 
    
      String_fromFfi(_duration_handle), 
    
      String_fromFfi(_recurrence_handle)
    );
  } finally {
    String_releaseFfiHandle(_start_handle);
    String_releaseFfiHandle(_duration_handle);
    String_releaseFfiHandle(_recurrence_handle);
  }
}

void sdk_search_ScheduleDetails_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_ScheduleDetails_release_handle(handle);

// Nullable ScheduleDetails

final _sdk_search_ScheduleDetails_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ScheduleDetails_create_handle_nullable'));
final _sdk_search_ScheduleDetails_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_ScheduleDetails_release_handle_nullable'));
final _sdk_search_ScheduleDetails_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ScheduleDetails_get_value_nullable'));

Pointer<Void> sdk_search_ScheduleDetails_toFfi_nullable(ScheduleDetails value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_ScheduleDetails_toFfi(value);
  final result = _sdk_search_ScheduleDetails_create_handle_nullable(_handle);
  sdk_search_ScheduleDetails_releaseFfiHandle(_handle);
  return result;
}

ScheduleDetails sdk_search_ScheduleDetails_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_ScheduleDetails_get_value_nullable(handle);
  final result = sdk_search_ScheduleDetails_fromFfi(_handle);
  sdk_search_ScheduleDetails_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_ScheduleDetails_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_ScheduleDetails_release_handle_nullable(handle);

// End of ScheduleDetails "private" section.

