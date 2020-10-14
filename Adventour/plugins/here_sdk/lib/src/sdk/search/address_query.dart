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
import 'package:here_sdk/src/sdk/core/country_code.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;




/// The options to specify an address query.
@immutable
class AddressQuery {
  /// Desired address query to search.
  final String query;

  /// Geographical coordinates of the center around which to provide the most relevant places.
  final GeoCoordinates areaCenter;

  /// A list of countries that the query is applied in.
  /// Usage of CountryCode list in search query is not supported when using
  /// offline search in OfflineSearchEngine.
  final List<CountryCode> countries;


  const AddressQuery._(this.query, this.areaCenter, this.countries);
  AddressQuery._copy(AddressQuery _other) : this._(_other.query, _other.areaCenter, _other.countries);

  /// Constructs an AddressQuery from the provided text query and geographical coordinates.
  /// [query] Desired query to search.
  /// [areaCenter] Geographical coordinates of the center around which to provide the most relevant places.
  AddressQuery.withAreaCenter(String query, GeoCoordinates areaCenter) : this._copy(_withAreaCenter(query, areaCenter));

  /// Constructs an AddressQuery from the provided text query, geographical coordinates and the
  /// list of countries the query is applied in.
  /// [query] Desired query to search.
  /// [areaCenter] Geographical coordinates of the center around which to provide the most relevant places.
  /// [countries] A list of countries that the query is applied in.
  AddressQuery.withAreaCenterInCountries(String query, GeoCoordinates areaCenter, List<CountryCode> countries) : this._copy(_withAreaCenterInCountries(query, areaCenter, countries));

  /// Constructs an AddressQuery from the provided text query.
  /// [query] Desired query to search.
  AddressQuery(String query) : this._copy(_$init(query));

  /// Constructs an AddressQuery from the provided text query and geographical coordinates.
  /// [query] Desired query to search.
  /// [areaCenter] Geographical coordinates of the center around which to provide the most relevant places.
  static AddressQuery _withAreaCenter(String query, GeoCoordinates areaCenter) {
    final _withAreaCenter_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_AddressQuery_make__String_GeoCoordinates'));
    final _query_handle = String_toFfi(query);
    final _areaCenter_handle = sdk_core_GeoCoordinates_toFfi(areaCenter);
    final __result_handle = _withAreaCenter_ffi(__lib.LibraryContext.isolateId, _query_handle, _areaCenter_handle);
    String_releaseFfiHandle(_query_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_areaCenter_handle);
    try {
      return sdk_search_AddressQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_AddressQuery_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs an AddressQuery from the provided text query, geographical coordinates and the
  /// list of countries the query is applied in.
  /// [query] Desired query to search.
  /// [areaCenter] Geographical coordinates of the center around which to provide the most relevant places.
  /// [countries] A list of countries that the query is applied in.
  static AddressQuery _withAreaCenterInCountries(String query, GeoCoordinates areaCenter, List<CountryCode> countries) {
    final _withAreaCenterInCountries_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_AddressQuery_make__String_GeoCoordinates_ListOf_1sdk_1core_1CountryCode'));
    final _query_handle = String_toFfi(query);
    final _areaCenter_handle = sdk_core_GeoCoordinates_toFfi(areaCenter);
    final _countries_handle = heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_toFfi(countries);
    final __result_handle = _withAreaCenterInCountries_ffi(__lib.LibraryContext.isolateId, _query_handle, _areaCenter_handle, _countries_handle);
    String_releaseFfiHandle(_query_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_areaCenter_handle);
    heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(_countries_handle);
    try {
      return sdk_search_AddressQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_AddressQuery_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs an AddressQuery from the provided text query.
  /// [query] Desired query to search.
  static AddressQuery _$init(String query) {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_AddressQuery_make__String'));
    final _query_handle = String_toFfi(query);
    final __result_handle = _$init_ffi(__lib.LibraryContext.isolateId, _query_handle);
    String_releaseFfiHandle(_query_handle);
    try {
      return sdk_search_AddressQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_AddressQuery_releaseFfiHandle(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! AddressQuery) return false;
    AddressQuery _other = other;
    return query == _other.query &&
        areaCenter == _other.areaCenter &&
        DeepCollectionEquality().equals(countries, _other.countries);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + query.hashCode;
    result = 31 * result + areaCenter.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(countries);
    return result;
  }
}


// AddressQuery "private" section, not exported.

final _sdk_search_AddressQuery_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_AddressQuery_create_handle'));
final _sdk_search_AddressQuery_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_AddressQuery_release_handle'));
final _sdk_search_AddressQuery_get_field_query = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_AddressQuery_get_field_query'));
final _sdk_search_AddressQuery_get_field_areaCenter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_AddressQuery_get_field_areaCenter'));
final _sdk_search_AddressQuery_get_field_countries = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_AddressQuery_get_field_countries'));

Pointer<Void> sdk_search_AddressQuery_toFfi(AddressQuery value) {
  final _query_handle = String_toFfi(value.query);
  final _areaCenter_handle = sdk_core_GeoCoordinates_toFfi_nullable(value.areaCenter);
  final _countries_handle = heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_toFfi(value.countries);
  final _result = _sdk_search_AddressQuery_create_handle(_query_handle, _areaCenter_handle, _countries_handle);
  String_releaseFfiHandle(_query_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle_nullable(_areaCenter_handle);
  heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(_countries_handle);
  return _result;
}

AddressQuery sdk_search_AddressQuery_fromFfi(Pointer<Void> handle) {
  final _query_handle = _sdk_search_AddressQuery_get_field_query(handle);
  final _areaCenter_handle = _sdk_search_AddressQuery_get_field_areaCenter(handle);
  final _countries_handle = _sdk_search_AddressQuery_get_field_countries(handle);
  try {
    return AddressQuery._(
      String_fromFfi(_query_handle), 
    
      sdk_core_GeoCoordinates_fromFfi_nullable(_areaCenter_handle), 
    
      heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_fromFfi(_countries_handle)
    );
  } finally {
    String_releaseFfiHandle(_query_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle_nullable(_areaCenter_handle);
    heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(_countries_handle);
  }
}

void sdk_search_AddressQuery_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_AddressQuery_release_handle(handle);

// Nullable AddressQuery

final _sdk_search_AddressQuery_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_AddressQuery_create_handle_nullable'));
final _sdk_search_AddressQuery_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_AddressQuery_release_handle_nullable'));
final _sdk_search_AddressQuery_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_AddressQuery_get_value_nullable'));

Pointer<Void> sdk_search_AddressQuery_toFfi_nullable(AddressQuery value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_AddressQuery_toFfi(value);
  final result = _sdk_search_AddressQuery_create_handle_nullable(_handle);
  sdk_search_AddressQuery_releaseFfiHandle(_handle);
  return result;
}

AddressQuery sdk_search_AddressQuery_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_AddressQuery_get_value_nullable(handle);
  final result = sdk_search_AddressQuery_fromFfi(_handle);
  sdk_search_AddressQuery_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_AddressQuery_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_AddressQuery_release_handle_nullable(handle);

// End of AddressQuery "private" section.

