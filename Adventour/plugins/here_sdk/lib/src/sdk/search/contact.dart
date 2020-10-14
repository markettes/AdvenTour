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

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents contact information.
@immutable
class Contact {
  /// The list of landline phone numbers.
  final List<String> landlinePhoneNumbers;

  /// The list of mobile phones numbers.
  final List<String> mobilePhoneNumbers;

  /// The list of email addresses.
  final List<String> emailAddresses;

  /// The list of website addresses.
  final List<String> websiteAddresses;


  const Contact(this.landlinePhoneNumbers, this.mobilePhoneNumbers, this.emailAddresses, this.websiteAddresses);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! Contact) return false;
    Contact _other = other;
    return DeepCollectionEquality().equals(landlinePhoneNumbers, _other.landlinePhoneNumbers) &&
        DeepCollectionEquality().equals(mobilePhoneNumbers, _other.mobilePhoneNumbers) &&
        DeepCollectionEquality().equals(emailAddresses, _other.emailAddresses) &&
        DeepCollectionEquality().equals(websiteAddresses, _other.websiteAddresses);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(landlinePhoneNumbers);
    result = 31 * result + DeepCollectionEquality().hash(mobilePhoneNumbers);
    result = 31 * result + DeepCollectionEquality().hash(emailAddresses);
    result = 31 * result + DeepCollectionEquality().hash(websiteAddresses);
    return result;
  }
}


// Contact "private" section, not exported.

final _sdk_search_Contact_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_Contact_create_handle'));
final _sdk_search_Contact_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Contact_release_handle'));
final _sdk_search_Contact_get_field_landlinePhoneNumbers = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Contact_get_field_landlinePhoneNumbers'));
final _sdk_search_Contact_get_field_mobilePhoneNumbers = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Contact_get_field_mobilePhoneNumbers'));
final _sdk_search_Contact_get_field_emailAddresses = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Contact_get_field_emailAddresses'));
final _sdk_search_Contact_get_field_websiteAddresses = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Contact_get_field_websiteAddresses'));

Pointer<Void> sdk_search_Contact_toFfi(Contact value) {
  final _landlinePhoneNumbers_handle = heresdk_search_common_bindings_ListOf_String_toFfi(value.landlinePhoneNumbers);
  final _mobilePhoneNumbers_handle = heresdk_search_common_bindings_ListOf_String_toFfi(value.mobilePhoneNumbers);
  final _emailAddresses_handle = heresdk_search_common_bindings_ListOf_String_toFfi(value.emailAddresses);
  final _websiteAddresses_handle = heresdk_search_common_bindings_ListOf_String_toFfi(value.websiteAddresses);
  final _result = _sdk_search_Contact_create_handle(_landlinePhoneNumbers_handle, _mobilePhoneNumbers_handle, _emailAddresses_handle, _websiteAddresses_handle);
  heresdk_search_common_bindings_ListOf_String_releaseFfiHandle(_landlinePhoneNumbers_handle);
  heresdk_search_common_bindings_ListOf_String_releaseFfiHandle(_mobilePhoneNumbers_handle);
  heresdk_search_common_bindings_ListOf_String_releaseFfiHandle(_emailAddresses_handle);
  heresdk_search_common_bindings_ListOf_String_releaseFfiHandle(_websiteAddresses_handle);
  return _result;
}

Contact sdk_search_Contact_fromFfi(Pointer<Void> handle) {
  final _landlinePhoneNumbers_handle = _sdk_search_Contact_get_field_landlinePhoneNumbers(handle);
  final _mobilePhoneNumbers_handle = _sdk_search_Contact_get_field_mobilePhoneNumbers(handle);
  final _emailAddresses_handle = _sdk_search_Contact_get_field_emailAddresses(handle);
  final _websiteAddresses_handle = _sdk_search_Contact_get_field_websiteAddresses(handle);
  try {
    return Contact(
      heresdk_search_common_bindings_ListOf_String_fromFfi(_landlinePhoneNumbers_handle), 
    
      heresdk_search_common_bindings_ListOf_String_fromFfi(_mobilePhoneNumbers_handle), 
    
      heresdk_search_common_bindings_ListOf_String_fromFfi(_emailAddresses_handle), 
    
      heresdk_search_common_bindings_ListOf_String_fromFfi(_websiteAddresses_handle)
    );
  } finally {
    heresdk_search_common_bindings_ListOf_String_releaseFfiHandle(_landlinePhoneNumbers_handle);
    heresdk_search_common_bindings_ListOf_String_releaseFfiHandle(_mobilePhoneNumbers_handle);
    heresdk_search_common_bindings_ListOf_String_releaseFfiHandle(_emailAddresses_handle);
    heresdk_search_common_bindings_ListOf_String_releaseFfiHandle(_websiteAddresses_handle);
  }
}

void sdk_search_Contact_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_Contact_release_handle(handle);

// Nullable Contact

final _sdk_search_Contact_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Contact_create_handle_nullable'));
final _sdk_search_Contact_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Contact_release_handle_nullable'));
final _sdk_search_Contact_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Contact_get_value_nullable'));

Pointer<Void> sdk_search_Contact_toFfi_nullable(Contact value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_Contact_toFfi(value);
  final result = _sdk_search_Contact_create_handle_nullable(_handle);
  sdk_search_Contact_releaseFfiHandle(_handle);
  return result;
}

Contact sdk_search_Contact_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_Contact_get_value_nullable(handle);
  final result = sdk_search_Contact_fromFfi(_handle);
  sdk_search_Contact_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_Contact_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_Contact_release_handle_nullable(handle);

// End of Contact "private" section.

