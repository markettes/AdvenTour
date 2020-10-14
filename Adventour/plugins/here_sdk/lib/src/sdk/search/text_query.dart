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
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/core/geo_circle.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/geo_corridor.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;






/// The options to specify a text query.
@immutable
class TextQuery {
  /// Desired query to search.
  final String query;

  /// Geographic coordinates of the center around which to provide the most relevant places.
  final GeoCoordinates areaCenter;

  /// A list of countries that the query is applied in.
  /// Usage of CountryCode list in search query is not supported when using
  /// offline search in OfflineSearchEngine.
  final List<CountryCode> countries;

  /// Geographic rectangle area in which to provide the most relevant places.
  final GeoBox boxArea;

  /// Geographic circle area in which to provide the most relevant places.
  final GeoCircle circleArea;

  /// Geographic corridor area in which to provide the most relevant places.
  /// Usage of GeoCorridor in search query is not supported when using
  /// offline search in OfflineSearchEngine.
  final GeoCorridor corridorArea;


  const TextQuery._(this.query, this.areaCenter, this.countries, this.boxArea, this.circleArea, this.corridorArea);
  TextQuery._copy(TextQuery _other) : this._(_other.query, _other.areaCenter, _other.countries, _other.boxArea, _other.circleArea, _other.corridorArea);

  /// Constructs a TextQuery from the provided text query and geographic coordinates.
  /// [query] Desired query to search.
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  TextQuery.withAreaCenter(String query, GeoCoordinates areaCenter) : this._copy(_withAreaCenter(query, areaCenter));

  /// Constructs a TextQuery from the provided text query, geographic coordinates and the list of
  /// countries the query is applied in.
  /// [query] Desired query to search.
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  /// [countries] A list of countries that the query is applied in.
  TextQuery.withAreaCenterInCountries(String query, GeoCoordinates areaCenter, List<CountryCode> countries) : this._copy(_withAreaCenterInCountries(query, areaCenter, countries));

  /// Constructs a TextQuery from the provided text query and geographic rectangle area.
  /// [query] Desired query to search.
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  TextQuery.withBoxArea(String query, GeoBox boxArea) : this._copy(_withBoxArea(query, boxArea));

  /// Constructs a TextQuery from the provided text query and geographic circle area.
  /// [query] Desired query to search.
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  TextQuery.withCircleArea(String query, GeoCircle circleArea) : this._copy(_withCircleArea(query, circleArea));

  /// Constructs a TextQuery from the provided text query, geographic corridor and geographic
  /// coordinates.
  ///
  /// The corridor represents the entire area to be searched, whereas the preferred area center
  /// represents the coordinates of the area center to prioritize.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  /// [query] Desired query to search.
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and radius members define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller radius
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, radius can be increased or route can be split
  /// to reduce number of GeoCoordinates.
  /// For example: Route between New York and Chicago with radius 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require a bigger radius, as its shape is more complex.
  /// [areaCenter] Geographic coordinates of the prioritized area center.
  TextQuery.withCorridorAreaAndAreaCenter(String query, GeoCorridor corridorArea, GeoCoordinates areaCenter) : this._copy(_withCorridorAreaAndAreaCenter(query, corridorArea, areaCenter));

  /// Constructs a TextQuery from the provided text query and geographic coordinates.
  /// [query] Desired query to search.
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  static TextQuery _withAreaCenter(String query, GeoCoordinates areaCenter) {
    final _withAreaCenter_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_TextQuery_make__String_GeoCoordinates'));
    final _query_handle = String_toFfi(query);
    final _areaCenter_handle = sdk_core_GeoCoordinates_toFfi(areaCenter);
    final __result_handle = _withAreaCenter_ffi(__lib.LibraryContext.isolateId, _query_handle, _areaCenter_handle);
    String_releaseFfiHandle(_query_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_areaCenter_handle);
    try {
      return sdk_search_TextQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_TextQuery_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a TextQuery from the provided text query, geographic coordinates and the list of
  /// countries the query is applied in.
  /// [query] Desired query to search.
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  /// [countries] A list of countries that the query is applied in.
  static TextQuery _withAreaCenterInCountries(String query, GeoCoordinates areaCenter, List<CountryCode> countries) {
    final _withAreaCenterInCountries_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_TextQuery_make__String_GeoCoordinates_ListOf_1sdk_1core_1CountryCode'));
    final _query_handle = String_toFfi(query);
    final _areaCenter_handle = sdk_core_GeoCoordinates_toFfi(areaCenter);
    final _countries_handle = heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_toFfi(countries);
    final __result_handle = _withAreaCenterInCountries_ffi(__lib.LibraryContext.isolateId, _query_handle, _areaCenter_handle, _countries_handle);
    String_releaseFfiHandle(_query_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_areaCenter_handle);
    heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(_countries_handle);
    try {
      return sdk_search_TextQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_TextQuery_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a TextQuery from the provided text query and geographic rectangle area.
  /// [query] Desired query to search.
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  static TextQuery _withBoxArea(String query, GeoBox boxArea) {
    final _withBoxArea_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_TextQuery_make__String_GeoBox'));
    final _query_handle = String_toFfi(query);
    final _boxArea_handle = sdk_core_GeoBox_toFfi(boxArea);
    final __result_handle = _withBoxArea_ffi(__lib.LibraryContext.isolateId, _query_handle, _boxArea_handle);
    String_releaseFfiHandle(_query_handle);
    sdk_core_GeoBox_releaseFfiHandle(_boxArea_handle);
    try {
      return sdk_search_TextQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_TextQuery_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a TextQuery from the provided text query and geographic circle area.
  /// [query] Desired query to search.
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  static TextQuery _withCircleArea(String query, GeoCircle circleArea) {
    final _withCircleArea_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_TextQuery_make__String_GeoCircle'));
    final _query_handle = String_toFfi(query);
    final _circleArea_handle = sdk_core_GeoCircle_toFfi(circleArea);
    final __result_handle = _withCircleArea_ffi(__lib.LibraryContext.isolateId, _query_handle, _circleArea_handle);
    String_releaseFfiHandle(_query_handle);
    sdk_core_GeoCircle_releaseFfiHandle(_circleArea_handle);
    try {
      return sdk_search_TextQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_TextQuery_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a TextQuery from the provided text query, geographic corridor and geographic
  /// coordinates.
  ///
  /// The corridor represents the entire area to be searched, whereas the preferred area center
  /// represents the coordinates of the area center to prioritize.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  /// [query] Desired query to search.
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and radius members define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller radius
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, radius can be increased or route can be split
  /// to reduce number of GeoCoordinates.
  /// For example: Route between New York and Chicago with radius 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require a bigger radius, as its shape is more complex.
  /// [areaCenter] Geographic coordinates of the prioritized area center.
  static TextQuery _withCorridorAreaAndAreaCenter(String query, GeoCorridor corridorArea, GeoCoordinates areaCenter) {
    final _withCorridorAreaAndAreaCenter_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_TextQuery_make__String_GeoCorridor_GeoCoordinates'));
    final _query_handle = String_toFfi(query);
    final _corridorArea_handle = sdk_core_GeoCorridor_toFfi(corridorArea);
    final _areaCenter_handle = sdk_core_GeoCoordinates_toFfi(areaCenter);
    final __result_handle = _withCorridorAreaAndAreaCenter_ffi(__lib.LibraryContext.isolateId, _query_handle, _corridorArea_handle, _areaCenter_handle);
    String_releaseFfiHandle(_query_handle);
    sdk_core_GeoCorridor_releaseFfiHandle(_corridorArea_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_areaCenter_handle);
    try {
      return sdk_search_TextQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_TextQuery_releaseFfiHandle(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! TextQuery) return false;
    TextQuery _other = other;
    return query == _other.query &&
        areaCenter == _other.areaCenter &&
        DeepCollectionEquality().equals(countries, _other.countries) &&
        boxArea == _other.boxArea &&
        circleArea == _other.circleArea &&
        corridorArea == _other.corridorArea;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + query.hashCode;
    result = 31 * result + areaCenter.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(countries);
    result = 31 * result + boxArea.hashCode;
    result = 31 * result + circleArea.hashCode;
    result = 31 * result + corridorArea.hashCode;
    return result;
  }
}


// TextQuery "private" section, not exported.

final _sdk_search_TextQuery_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_create_handle'));
final _sdk_search_TextQuery_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_release_handle'));
final _sdk_search_TextQuery_get_field_query = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_get_field_query'));
final _sdk_search_TextQuery_get_field_areaCenter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_get_field_areaCenter'));
final _sdk_search_TextQuery_get_field_countries = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_get_field_countries'));
final _sdk_search_TextQuery_get_field_boxArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_get_field_boxArea'));
final _sdk_search_TextQuery_get_field_circleArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_get_field_circleArea'));
final _sdk_search_TextQuery_get_field_corridorArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_get_field_corridorArea'));

Pointer<Void> sdk_search_TextQuery_toFfi(TextQuery value) {
  final _query_handle = String_toFfi(value.query);
  final _areaCenter_handle = sdk_core_GeoCoordinates_toFfi_nullable(value.areaCenter);
  final _countries_handle = heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_toFfi(value.countries);
  final _boxArea_handle = sdk_core_GeoBox_toFfi_nullable(value.boxArea);
  final _circleArea_handle = sdk_core_GeoCircle_toFfi_nullable(value.circleArea);
  final _corridorArea_handle = sdk_core_GeoCorridor_toFfi_nullable(value.corridorArea);
  final _result = _sdk_search_TextQuery_create_handle(_query_handle, _areaCenter_handle, _countries_handle, _boxArea_handle, _circleArea_handle, _corridorArea_handle);
  String_releaseFfiHandle(_query_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle_nullable(_areaCenter_handle);
  heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(_countries_handle);
  sdk_core_GeoBox_releaseFfiHandle_nullable(_boxArea_handle);
  sdk_core_GeoCircle_releaseFfiHandle_nullable(_circleArea_handle);
  sdk_core_GeoCorridor_releaseFfiHandle_nullable(_corridorArea_handle);
  return _result;
}

TextQuery sdk_search_TextQuery_fromFfi(Pointer<Void> handle) {
  final _query_handle = _sdk_search_TextQuery_get_field_query(handle);
  final _areaCenter_handle = _sdk_search_TextQuery_get_field_areaCenter(handle);
  final _countries_handle = _sdk_search_TextQuery_get_field_countries(handle);
  final _boxArea_handle = _sdk_search_TextQuery_get_field_boxArea(handle);
  final _circleArea_handle = _sdk_search_TextQuery_get_field_circleArea(handle);
  final _corridorArea_handle = _sdk_search_TextQuery_get_field_corridorArea(handle);
  try {
    return TextQuery._(
      String_fromFfi(_query_handle), 
    
      sdk_core_GeoCoordinates_fromFfi_nullable(_areaCenter_handle), 
    
      heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_fromFfi(_countries_handle), 
    
      sdk_core_GeoBox_fromFfi_nullable(_boxArea_handle), 
    
      sdk_core_GeoCircle_fromFfi_nullable(_circleArea_handle), 
    
      sdk_core_GeoCorridor_fromFfi_nullable(_corridorArea_handle)
    );
  } finally {
    String_releaseFfiHandle(_query_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle_nullable(_areaCenter_handle);
    heresdk_search_common_bindings_ListOf_sdk_core_CountryCode_releaseFfiHandle(_countries_handle);
    sdk_core_GeoBox_releaseFfiHandle_nullable(_boxArea_handle);
    sdk_core_GeoCircle_releaseFfiHandle_nullable(_circleArea_handle);
    sdk_core_GeoCorridor_releaseFfiHandle_nullable(_corridorArea_handle);
  }
}

void sdk_search_TextQuery_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_TextQuery_release_handle(handle);

// Nullable TextQuery

final _sdk_search_TextQuery_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_create_handle_nullable'));
final _sdk_search_TextQuery_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_release_handle_nullable'));
final _sdk_search_TextQuery_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_get_value_nullable'));

Pointer<Void> sdk_search_TextQuery_toFfi_nullable(TextQuery value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_TextQuery_toFfi(value);
  final result = _sdk_search_TextQuery_create_handle_nullable(_handle);
  sdk_search_TextQuery_releaseFfiHandle(_handle);
  return result;
}

TextQuery sdk_search_TextQuery_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_TextQuery_get_value_nullable(handle);
  final result = sdk_search_TextQuery_fromFfi(_handle);
  sdk_search_TextQuery_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_TextQuery_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_TextQuery_release_handle_nullable(handle);

// End of TextQuery "private" section.

