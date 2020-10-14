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
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/geo_corridor.dart';
import 'package:here_sdk/src/sdk/search/place_category.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;









/// The options to specify a query by categories.
@immutable
class CategoryQuery {
  /// List of categories.
  final List<PlaceCategory> categories;

  /// Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  final String filter;

  /// Geographic coordinates of the center around which to provide the most relevant places.
  final GeoCoordinates areaCenter;

  /// Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and radius members define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller radius
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, radius can be increased or route can be split
  /// to reduce number of GeoCoordinates.
  /// For example: Route between New York and Chicago with radius 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require a bigger radius, as its shape is more complex.
  /// Usage of GeoCorridor in search query is not supported when using
  /// offline search in OfflineSearchEngine.
  final GeoCorridor corridorArea;


  const CategoryQuery._(this.categories, this.filter, this.areaCenter, this.corridorArea);
  CategoryQuery._copy(CategoryQuery _other) : this._(_other.categories, _other.filter, _other.areaCenter, _other.corridorArea);

  /// Constructs a new instance of this class from provided parameters.
  /// [categories] List of categories.
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  CategoryQuery.withFilter(List<PlaceCategory> categories, String filter, GeoCoordinates areaCenter) : this._copy(_withFilter(categories, filter, areaCenter));

  /// Constructs a new instance of this class from provided parameters.
  /// [category] Category for query.
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  CategoryQuery.withCategoryAndFilter(PlaceCategory category, String filter, GeoCoordinates areaCenter) : this._copy(_withCategoryAndFilter(category, filter, areaCenter));

  /// Constructs a new instance of this class from provided parameters.
  /// [categories] List of categories.
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  CategoryQuery(List<PlaceCategory> categories, GeoCoordinates areaCenter) : this._copy(_$init(categories, areaCenter));

  /// Constructs a new instance of this class from provided parameters.
  /// [category] Category for query.
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  CategoryQuery.withCategory(PlaceCategory category, GeoCoordinates areaCenter) : this._copy(_withCategory(category, areaCenter));

  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  /// [categories] List of categories.
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and radius members define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller radius
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, radius can be increased or route can be split
  /// to reduce number of GeoCoordinates.
  /// For example: Route between New York and Chicago with radius 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require a bigger radius, as its shape is more complex.
  CategoryQuery.withCorridorArea(List<PlaceCategory> categories, GeoCorridor corridorArea) : this._copy(_withCorridorArea(categories, corridorArea));

  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  /// [category] Category for query.
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and radius members define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller radius
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, radius can be increased or route can be split
  /// to reduce number of GeoCoordinates.
  /// For example: Route between New York and Chicago with radius 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require a bigger radius, as its shape is more complex.
  CategoryQuery.withCategoryAndCorridorArea(PlaceCategory category, GeoCorridor corridorArea) : this._copy(_withCategoryAndCorridorArea(category, corridorArea));

  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  /// [categories] List of categories.
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and radius members define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller radius
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, radius can be increased or route can be split
  /// to reduce number of GeoCoordinates.
  /// For example: Route between New York and Chicago with radius 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require a bigger radius, as its shape is more complex.
  CategoryQuery.withFilterAndCorridorArea(List<PlaceCategory> categories, String filter, GeoCorridor corridorArea) : this._copy(_withFilterAndCorridorArea(categories, filter, corridorArea));

  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  /// [category] Category for query.
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and radius members define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller radius
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, radius can be increased or route can be split
  /// to reduce number of GeoCoordinates.
  /// For example: Route between New York and Chicago with radius 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require a bigger radius, as its shape is more complex.
  CategoryQuery.withCategoryAndFilterAndCorridorArea(PlaceCategory category, String filter, GeoCorridor corridorArea) : this._copy(_withCategoryAndFilterAndCorridorArea(category, filter, corridorArea));

  /// Constructs a new instance of this class from provided parameters.
  /// [categories] List of categories.
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  static CategoryQuery _withFilter(List<PlaceCategory> categories, String filter, GeoCoordinates areaCenter) {
    final _withFilter_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_1sdk_1search_1PlaceCategory_String_GeoCoordinates'));
    final _categories_handle = heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_toFfi(categories);
    final _filter_handle = String_toFfi(filter);
    final _areaCenter_handle = sdk_core_GeoCoordinates_toFfi(areaCenter);
    final __result_handle = _withFilter_ffi(__lib.LibraryContext.isolateId, _categories_handle, _filter_handle, _areaCenter_handle);
    heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(_categories_handle);
    String_releaseFfiHandle(_filter_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_areaCenter_handle);
    try {
      return sdk_search_CategoryQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_CategoryQuery_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a new instance of this class from provided parameters.
  /// [category] Category for query.
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  static CategoryQuery _withCategoryAndFilter(PlaceCategory category, String filter, GeoCoordinates areaCenter) {
    final _withCategoryAndFilter_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_String_GeoCoordinates'));
    final _category_handle = sdk_search_PlaceCategory_toFfi(category);
    final _filter_handle = String_toFfi(filter);
    final _areaCenter_handle = sdk_core_GeoCoordinates_toFfi(areaCenter);
    final __result_handle = _withCategoryAndFilter_ffi(__lib.LibraryContext.isolateId, _category_handle, _filter_handle, _areaCenter_handle);
    sdk_search_PlaceCategory_releaseFfiHandle(_category_handle);
    String_releaseFfiHandle(_filter_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_areaCenter_handle);
    try {
      return sdk_search_CategoryQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_CategoryQuery_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a new instance of this class from provided parameters.
  /// [categories] List of categories.
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  static CategoryQuery _$init(List<PlaceCategory> categories, GeoCoordinates areaCenter) {
    final _$init_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_1sdk_1search_1PlaceCategory_GeoCoordinates'));
    final _categories_handle = heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_toFfi(categories);
    final _areaCenter_handle = sdk_core_GeoCoordinates_toFfi(areaCenter);
    final __result_handle = _$init_ffi(__lib.LibraryContext.isolateId, _categories_handle, _areaCenter_handle);
    heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(_categories_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_areaCenter_handle);
    try {
      return sdk_search_CategoryQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_CategoryQuery_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a new instance of this class from provided parameters.
  /// [category] Category for query.
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  static CategoryQuery _withCategory(PlaceCategory category, GeoCoordinates areaCenter) {
    final _withCategory_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_GeoCoordinates'));
    final _category_handle = sdk_search_PlaceCategory_toFfi(category);
    final _areaCenter_handle = sdk_core_GeoCoordinates_toFfi(areaCenter);
    final __result_handle = _withCategory_ffi(__lib.LibraryContext.isolateId, _category_handle, _areaCenter_handle);
    sdk_search_PlaceCategory_releaseFfiHandle(_category_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_areaCenter_handle);
    try {
      return sdk_search_CategoryQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_CategoryQuery_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  /// [categories] List of categories.
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and radius members define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller radius
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, radius can be increased or route can be split
  /// to reduce number of GeoCoordinates.
  /// For example: Route between New York and Chicago with radius 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require a bigger radius, as its shape is more complex.
  static CategoryQuery _withCorridorArea(List<PlaceCategory> categories, GeoCorridor corridorArea) {
    final _withCorridorArea_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_1sdk_1search_1PlaceCategory_GeoCorridor'));
    final _categories_handle = heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_toFfi(categories);
    final _corridorArea_handle = sdk_core_GeoCorridor_toFfi(corridorArea);
    final __result_handle = _withCorridorArea_ffi(__lib.LibraryContext.isolateId, _categories_handle, _corridorArea_handle);
    heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(_categories_handle);
    sdk_core_GeoCorridor_releaseFfiHandle(_corridorArea_handle);
    try {
      return sdk_search_CategoryQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_CategoryQuery_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  /// [category] Category for query.
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and radius members define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller radius
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, radius can be increased or route can be split
  /// to reduce number of GeoCoordinates.
  /// For example: Route between New York and Chicago with radius 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require a bigger radius, as its shape is more complex.
  static CategoryQuery _withCategoryAndCorridorArea(PlaceCategory category, GeoCorridor corridorArea) {
    final _withCategoryAndCorridorArea_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_GeoCorridor'));
    final _category_handle = sdk_search_PlaceCategory_toFfi(category);
    final _corridorArea_handle = sdk_core_GeoCorridor_toFfi(corridorArea);
    final __result_handle = _withCategoryAndCorridorArea_ffi(__lib.LibraryContext.isolateId, _category_handle, _corridorArea_handle);
    sdk_search_PlaceCategory_releaseFfiHandle(_category_handle);
    sdk_core_GeoCorridor_releaseFfiHandle(_corridorArea_handle);
    try {
      return sdk_search_CategoryQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_CategoryQuery_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  /// [categories] List of categories.
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and radius members define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller radius
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, radius can be increased or route can be split
  /// to reduce number of GeoCoordinates.
  /// For example: Route between New York and Chicago with radius 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require a bigger radius, as its shape is more complex.
  static CategoryQuery _withFilterAndCorridorArea(List<PlaceCategory> categories, String filter, GeoCorridor corridorArea) {
    final _withFilterAndCorridorArea_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_1sdk_1search_1PlaceCategory_String_GeoCorridor'));
    final _categories_handle = heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_toFfi(categories);
    final _filter_handle = String_toFfi(filter);
    final _corridorArea_handle = sdk_core_GeoCorridor_toFfi(corridorArea);
    final __result_handle = _withFilterAndCorridorArea_ffi(__lib.LibraryContext.isolateId, _categories_handle, _filter_handle, _corridorArea_handle);
    heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(_categories_handle);
    String_releaseFfiHandle(_filter_handle);
    sdk_core_GeoCorridor_releaseFfiHandle(_corridorArea_handle);
    try {
      return sdk_search_CategoryQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_CategoryQuery_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  /// [category] Category for query.
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and radius members define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller radius
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, radius can be increased or route can be split
  /// to reduce number of GeoCoordinates.
  /// For example: Route between New York and Chicago with radius 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require a bigger radius, as its shape is more complex.
  static CategoryQuery _withCategoryAndFilterAndCorridorArea(PlaceCategory category, String filter, GeoCorridor corridorArea) {
    final _withCategoryAndFilterAndCorridorArea_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_String_GeoCorridor'));
    final _category_handle = sdk_search_PlaceCategory_toFfi(category);
    final _filter_handle = String_toFfi(filter);
    final _corridorArea_handle = sdk_core_GeoCorridor_toFfi(corridorArea);
    final __result_handle = _withCategoryAndFilterAndCorridorArea_ffi(__lib.LibraryContext.isolateId, _category_handle, _filter_handle, _corridorArea_handle);
    sdk_search_PlaceCategory_releaseFfiHandle(_category_handle);
    String_releaseFfiHandle(_filter_handle);
    sdk_core_GeoCorridor_releaseFfiHandle(_corridorArea_handle);
    try {
      return sdk_search_CategoryQuery_fromFfi(__result_handle);
    } finally {
      sdk_search_CategoryQuery_releaseFfiHandle(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! CategoryQuery) return false;
    CategoryQuery _other = other;
    return DeepCollectionEquality().equals(categories, _other.categories) &&
        filter == _other.filter &&
        areaCenter == _other.areaCenter &&
        corridorArea == _other.corridorArea;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(categories);
    result = 31 * result + filter.hashCode;
    result = 31 * result + areaCenter.hashCode;
    result = 31 * result + corridorArea.hashCode;
    return result;
  }
}


// CategoryQuery "private" section, not exported.

final _sdk_search_CategoryQuery_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_create_handle'));
final _sdk_search_CategoryQuery_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_release_handle'));
final _sdk_search_CategoryQuery_get_field_categories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_categories'));
final _sdk_search_CategoryQuery_get_field_filter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_filter'));
final _sdk_search_CategoryQuery_get_field_areaCenter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_areaCenter'));
final _sdk_search_CategoryQuery_get_field_corridorArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_corridorArea'));

Pointer<Void> sdk_search_CategoryQuery_toFfi(CategoryQuery value) {
  final _categories_handle = heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_toFfi(value.categories);
  final _filter_handle = String_toFfi_nullable(value.filter);
  final _areaCenter_handle = sdk_core_GeoCoordinates_toFfi(value.areaCenter);
  final _corridorArea_handle = sdk_core_GeoCorridor_toFfi_nullable(value.corridorArea);
  final _result = _sdk_search_CategoryQuery_create_handle(_categories_handle, _filter_handle, _areaCenter_handle, _corridorArea_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(_categories_handle);
  String_releaseFfiHandle_nullable(_filter_handle);
  sdk_core_GeoCoordinates_releaseFfiHandle(_areaCenter_handle);
  sdk_core_GeoCorridor_releaseFfiHandle_nullable(_corridorArea_handle);
  return _result;
}

CategoryQuery sdk_search_CategoryQuery_fromFfi(Pointer<Void> handle) {
  final _categories_handle = _sdk_search_CategoryQuery_get_field_categories(handle);
  final _filter_handle = _sdk_search_CategoryQuery_get_field_filter(handle);
  final _areaCenter_handle = _sdk_search_CategoryQuery_get_field_areaCenter(handle);
  final _corridorArea_handle = _sdk_search_CategoryQuery_get_field_corridorArea(handle);
  try {
    return CategoryQuery._(
      heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_fromFfi(_categories_handle), 
    
      String_fromFfi_nullable(_filter_handle), 
    
      sdk_core_GeoCoordinates_fromFfi(_areaCenter_handle), 
    
      sdk_core_GeoCorridor_fromFfi_nullable(_corridorArea_handle)
    );
  } finally {
    heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(_categories_handle);
    String_releaseFfiHandle_nullable(_filter_handle);
    sdk_core_GeoCoordinates_releaseFfiHandle(_areaCenter_handle);
    sdk_core_GeoCorridor_releaseFfiHandle_nullable(_corridorArea_handle);
  }
}

void sdk_search_CategoryQuery_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_CategoryQuery_release_handle(handle);

// Nullable CategoryQuery

final _sdk_search_CategoryQuery_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_create_handle_nullable'));
final _sdk_search_CategoryQuery_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_release_handle_nullable'));
final _sdk_search_CategoryQuery_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_value_nullable'));

Pointer<Void> sdk_search_CategoryQuery_toFfi_nullable(CategoryQuery value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_CategoryQuery_toFfi(value);
  final result = _sdk_search_CategoryQuery_create_handle_nullable(_handle);
  sdk_search_CategoryQuery_releaseFfiHandle(_handle);
  return result;
}

CategoryQuery sdk_search_CategoryQuery_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_CategoryQuery_get_value_nullable(handle);
  final result = sdk_search_CategoryQuery_fromFfi(_handle);
  sdk_search_CategoryQuery_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_CategoryQuery_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_CategoryQuery_release_handle_nullable(handle);

// End of CategoryQuery "private" section.

