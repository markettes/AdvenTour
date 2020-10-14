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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/search/contact.dart';
import 'package:here_sdk/src/sdk/search/opening_hours.dart';
import 'package:here_sdk/src/sdk/search/place_category.dart';
import 'package:here_sdk/src/sdk/search/web_editorial.dart';
import 'package:here_sdk/src/sdk/search/web_image.dart';
import 'package:here_sdk/src/sdk/search/web_rating.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;


/// Contains details of a specific place, such as contact information,
/// opening hours and assigned categories.
@immutable
class Details {
  /// The list of contact information of the place.
  final List<Contact> contacts;

  /// The list of opening hours information of the place (not available in result of suggest request).
  final List<OpeningHours> openingHours;

  /// The list of categories assigned to this place.
  final List<PlaceCategory> categories;

  /// The list of images associated with the place.
  final List<WebImage> images;

  /// The list of editorials associated with the place.
  final List<WebEditorial> editorials;

  /// The list of ratings associated with the place.
  final List<WebRating> ratings;


  const Details(this.contacts, this.openingHours, this.categories, this.images, this.editorials, this.ratings);

  /// Gets the list of primary categories assigned to this place.
  /// Returns [List<PlaceCategory>]. List of categories.
  List<PlaceCategory> getPrimaryCategories() {
    final _getPrimaryCategories_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Details_getPrimaryCategories'));
    final _handle = sdk_search_Details_toFfi(this);
    final __result_handle = _getPrimaryCategories_ffi(_handle, __lib.LibraryContext.isolateId);
    sdk_search_Details_releaseFfiHandle(_handle);
    try {
      return heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_fromFfi(__result_handle);
    } finally {
      heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! Details) return false;
    Details _other = other;
    return DeepCollectionEquality().equals(contacts, _other.contacts) &&
        DeepCollectionEquality().equals(openingHours, _other.openingHours) &&
        DeepCollectionEquality().equals(categories, _other.categories) &&
        DeepCollectionEquality().equals(images, _other.images) &&
        DeepCollectionEquality().equals(editorials, _other.editorials) &&
        DeepCollectionEquality().equals(ratings, _other.ratings);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(contacts);
    result = 31 * result + DeepCollectionEquality().hash(openingHours);
    result = 31 * result + DeepCollectionEquality().hash(categories);
    result = 31 * result + DeepCollectionEquality().hash(images);
    result = 31 * result + DeepCollectionEquality().hash(editorials);
    result = 31 * result + DeepCollectionEquality().hash(ratings);
    return result;
  }
}


// Details "private" section, not exported.

final _sdk_search_Details_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_Details_create_handle'));
final _sdk_search_Details_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_release_handle'));
final _sdk_search_Details_get_field_contacts = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_contacts'));
final _sdk_search_Details_get_field_openingHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_openingHours'));
final _sdk_search_Details_get_field_categories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_categories'));
final _sdk_search_Details_get_field_images = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_images'));
final _sdk_search_Details_get_field_editorials = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_editorials'));
final _sdk_search_Details_get_field_ratings = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_field_ratings'));

Pointer<Void> sdk_search_Details_toFfi(Details value) {
  final _contacts_handle = heresdk_search_common_bindings_ListOf_sdk_search_Contact_toFfi(value.contacts);
  final _openingHours_handle = heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_toFfi(value.openingHours);
  final _categories_handle = heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_toFfi(value.categories);
  final _images_handle = heresdk_search_common_bindings_ListOf_sdk_search_WebImage_toFfi(value.images);
  final _editorials_handle = heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_toFfi(value.editorials);
  final _ratings_handle = heresdk_search_common_bindings_ListOf_sdk_search_WebRating_toFfi(value.ratings);
  final _result = _sdk_search_Details_create_handle(_contacts_handle, _openingHours_handle, _categories_handle, _images_handle, _editorials_handle, _ratings_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_Contact_releaseFfiHandle(_contacts_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_releaseFfiHandle(_openingHours_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(_categories_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_WebImage_releaseFfiHandle(_images_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_releaseFfiHandle(_editorials_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_WebRating_releaseFfiHandle(_ratings_handle);
  return _result;
}

Details sdk_search_Details_fromFfi(Pointer<Void> handle) {
  final _contacts_handle = _sdk_search_Details_get_field_contacts(handle);
  final _openingHours_handle = _sdk_search_Details_get_field_openingHours(handle);
  final _categories_handle = _sdk_search_Details_get_field_categories(handle);
  final _images_handle = _sdk_search_Details_get_field_images(handle);
  final _editorials_handle = _sdk_search_Details_get_field_editorials(handle);
  final _ratings_handle = _sdk_search_Details_get_field_ratings(handle);
  try {
    return Details(
      heresdk_search_common_bindings_ListOf_sdk_search_Contact_fromFfi(_contacts_handle), 
    
      heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_fromFfi(_openingHours_handle), 
    
      heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_fromFfi(_categories_handle), 
    
      heresdk_search_common_bindings_ListOf_sdk_search_WebImage_fromFfi(_images_handle), 
    
      heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_fromFfi(_editorials_handle), 
    
      heresdk_search_common_bindings_ListOf_sdk_search_WebRating_fromFfi(_ratings_handle)
    );
  } finally {
    heresdk_search_common_bindings_ListOf_sdk_search_Contact_releaseFfiHandle(_contacts_handle);
    heresdk_search_common_bindings_ListOf_sdk_search_OpeningHours_releaseFfiHandle(_openingHours_handle);
    heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(_categories_handle);
    heresdk_search_common_bindings_ListOf_sdk_search_WebImage_releaseFfiHandle(_images_handle);
    heresdk_search_common_bindings_ListOf_sdk_search_WebEditorial_releaseFfiHandle(_editorials_handle);
    heresdk_search_common_bindings_ListOf_sdk_search_WebRating_releaseFfiHandle(_ratings_handle);
  }
}

void sdk_search_Details_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_Details_release_handle(handle);

// Nullable Details

final _sdk_search_Details_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_create_handle_nullable'));
final _sdk_search_Details_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_release_handle_nullable'));
final _sdk_search_Details_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Details_get_value_nullable'));

Pointer<Void> sdk_search_Details_toFfi_nullable(Details value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_Details_toFfi(value);
  final result = _sdk_search_Details_create_handle_nullable(_handle);
  sdk_search_Details_releaseFfiHandle(_handle);
  return result;
}

Details sdk_search_Details_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_Details_get_value_nullable(handle);
  final result = sdk_search_Details_fromFfi(_handle);
  sdk_search_Details_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_Details_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_Details_release_handle_nullable(handle);

// End of Details "private" section.

