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
import 'package:here_sdk/src/sdk/core/language_code.dart';
import 'package:here_sdk/src/sdk/core/text_format.dart';
import 'package:here_sdk/src/sdk/core/unit_system.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Specify how textual output should be provided.

class RouteTextOptions {
  /// The language for all textual information. When the specified language is not supported,
  /// the default language is used, which is English (United States).
  LanguageCode language;

  /// Representation format for maneuver instructions. The default format is HTML.
  TextFormat instructionFormat;

  /// Defines the measurement system used in instruction text. When imperial is selected,
  /// units used are based on the language specified in the request. Defaults to metric.
  UnitSystem unitSystem;


  RouteTextOptions(this.language, this.instructionFormat, this.unitSystem);

  RouteTextOptions.withDefaults()
    : language = LanguageCode.enUs, instructionFormat = TextFormat.html, unitSystem = UnitSystem.metric;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! RouteTextOptions) return false;
    RouteTextOptions _other = other;
    return language == _other.language &&
        instructionFormat == _other.instructionFormat &&
        unitSystem == _other.unitSystem;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + language.hashCode;
    result = 31 * result + instructionFormat.hashCode;
    result = 31 * result + unitSystem.hashCode;
    return result;
  }
}


// RouteTextOptions "private" section, not exported.

final _sdk_routing_RouteTextOptions_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Uint32, Uint32),
    Pointer<Void> Function(int, int, int)
  >('here_sdk_sdk_routing_RouteTextOptions_create_handle'));
final _sdk_routing_RouteTextOptions_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteTextOptions_release_handle'));
final _sdk_routing_RouteTextOptions_get_field_language = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteTextOptions_get_field_language'));
final _sdk_routing_RouteTextOptions_get_field_instructionFormat = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteTextOptions_get_field_instructionFormat'));
final _sdk_routing_RouteTextOptions_get_field_unitSystem = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteTextOptions_get_field_unitSystem'));

Pointer<Void> sdk_routing_RouteTextOptions_toFfi(RouteTextOptions value) {
  final _language_handle = sdk_core_LanguageCode_toFfi(value.language);
  final _instructionFormat_handle = sdk_core_TextFormat_toFfi(value.instructionFormat);
  final _unitSystem_handle = sdk_core_UnitSystem_toFfi(value.unitSystem);
  final _result = _sdk_routing_RouteTextOptions_create_handle(_language_handle, _instructionFormat_handle, _unitSystem_handle);
  sdk_core_LanguageCode_releaseFfiHandle(_language_handle);
  sdk_core_TextFormat_releaseFfiHandle(_instructionFormat_handle);
  sdk_core_UnitSystem_releaseFfiHandle(_unitSystem_handle);
  return _result;
}

RouteTextOptions sdk_routing_RouteTextOptions_fromFfi(Pointer<Void> handle) {
  final _language_handle = _sdk_routing_RouteTextOptions_get_field_language(handle);
  final _instructionFormat_handle = _sdk_routing_RouteTextOptions_get_field_instructionFormat(handle);
  final _unitSystem_handle = _sdk_routing_RouteTextOptions_get_field_unitSystem(handle);
  try {
    return RouteTextOptions(
      sdk_core_LanguageCode_fromFfi(_language_handle), 
    
      sdk_core_TextFormat_fromFfi(_instructionFormat_handle), 
    
      sdk_core_UnitSystem_fromFfi(_unitSystem_handle)
    );
  } finally {
    sdk_core_LanguageCode_releaseFfiHandle(_language_handle);
    sdk_core_TextFormat_releaseFfiHandle(_instructionFormat_handle);
    sdk_core_UnitSystem_releaseFfiHandle(_unitSystem_handle);
  }
}

void sdk_routing_RouteTextOptions_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_RouteTextOptions_release_handle(handle);

// Nullable RouteTextOptions

final _sdk_routing_RouteTextOptions_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteTextOptions_create_handle_nullable'));
final _sdk_routing_RouteTextOptions_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteTextOptions_release_handle_nullable'));
final _sdk_routing_RouteTextOptions_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteTextOptions_get_value_nullable'));

Pointer<Void> sdk_routing_RouteTextOptions_toFfi_nullable(RouteTextOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_RouteTextOptions_toFfi(value);
  final result = _sdk_routing_RouteTextOptions_create_handle_nullable(_handle);
  sdk_routing_RouteTextOptions_releaseFfiHandle(_handle);
  return result;
}

RouteTextOptions sdk_routing_RouteTextOptions_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_RouteTextOptions_get_value_nullable(handle);
  final result = sdk_routing_RouteTextOptions_fromFfi(_handle);
  sdk_routing_RouteTextOptions_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_RouteTextOptions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_RouteTextOptions_release_handle_nullable(handle);

// End of RouteTextOptions "private" section.

