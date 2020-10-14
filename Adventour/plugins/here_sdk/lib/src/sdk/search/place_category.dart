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

import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents a category of place with different levels of granularity.
///
/// This class also defines a set of most commonly used categories.
abstract class PlaceCategory {
  /// Creates a new instance of this class.
  /// [id] Place category id. It can be provided with one of predefined values such as EAT_AND_DRINK_RESTAURANT or
  /// as custom category string that follows "xxx"(1st level) or "xxx-xxxx"(2nd level), for example "300-3100".
  factory PlaceCategory.withId(String id) => PlaceCategory$Impl.withId(id);
  /// Creates a new instance of this class.
  /// [id] Place category id. It can be provided with one of predefined values such as EAT_AND_DRINK_RESTAURANT or
  /// as custom category string that follows "xxx"(1st level) or "xxx-xxxx"(2nd level), for example "300-3100".
  /// [primary] Flag indicates whether the category is primary or not.
  /// @nodoc
  factory PlaceCategory.withIdAndPrimaryFlag(String id, bool primary) => PlaceCategory$Impl.internalwithIdAndPrimaryFlag(id, primary);

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

  /// Top level category for places where food or beverages are prepared or served.
  static final String eatAndDrink = "100";

  /// An establishment that prepares and serves refreshments and prepared meals.
  static final String eatAndDrinkRestaurant = "100-1000";

  /// An establishment that sells drinks, such as coffee and tea, as well as refreshments.
  static final String eatAndDrinkCoffeeTea = "100-1100";

  /// Top level category for places commonly associated with entertainment,
  /// such as bars, cinemas, theatres, casinos and night clubs.
  static final String goingOutEntertainment = "200";

  /// An establishment that provides evening entertainment and usually serves alcoholic beverages.
  static final String goingOutNightlife = "200-2000";

  /// An establishment that shows movies through screen projection.
  static final String goingOutCinema = "200-2100";

  /// An establishment where various types of performing arts are presented.
  static final String goingOutTheatreMusicCulture = "200-2200";

  /// An establishment that provides gambling entertainment.
  static final String goingOutGamblingLotteryBetting = "200-2300";

  /// Top level category for places of special interest,
  /// such as common tourist attractions, museums and places of worship.
  static final String sightsAndMuseums = "300";

  /// A designated area of special interest to tourists.
  static final String sightsLandmarkAttaction = "300-3000";

  /// An establishment dedicated to the preservation and exhibition of artistic, historical, or scientific artifacts.
  static final String sightsMuseum = "300-3100";

  /// An establishment special religious significance or where religious services are held.
  static final String sightsReligiousPlace = "300-3200";

  /// Top level category for natural or man-made areas of regional importance,
  /// such as bodies of water, mountains, forested areas and other geographic areas.
  static final String naturalAndGeographical = "350";

  /// A natural and geographical feature of the earth's surface that is covered with water, such as a lake, river, stream or ocean.
  static final String naturalAndGeographicalBodyOfWater = "350-3500";

  /// A natural and geographical feature that is higher than the surrounding land.
  static final String naturalAndGeographicalMountainOrHill = "350-3510";

  /// A natural or artificial feature that is below sea level.
  static final String naturalAndGeographicalUnderseaFeature = "350-3520";

  /// A dense growth of trees, open uncultivated land or other large masses of vegetation.
  static final String naturalAndGeographicalForestHealthOtherVegetation = "350-3522";

  /// A feature not classified as a Body of Water, Mountain or Hill, Undersea Feature, or Forest, Heath or Other Vegetation.
  static final String naturalAndGeographicalOther = "350-3550";

  /// Top level category for places commonly associated with pedestrian and cargo transport facilities,
  /// including airports, rail yards and seaports.
  static final String transport = "400";

  /// A designated area that serves various aspects of aviation related sports, including gliders, recreational aircraft and model airplanes.
  static final String transportAirport = "400-4000";

  /// A facility for travelers who are travelling between stops on public transport.
  static final String transportPublic = "400-4100";

  /// A facility that handles some aspect of the transportation of cargo freight.
  static final String transportCargo = "400-4200";

  /// An establishment along a motorway (controlled access road) that provides restrooms and parking.
  static final String transportRestArea = "400-4300";

  /// Top level category for places offering lodging accommodations, dwellings or similar living quarters to travellers,
  /// such as hotels, motels, resorts, cruise ships and campgrounds.
  static final String accomodation = "500";

  /// A business that provides lodging or temporary living quarters.
  static final String accomodationHotelMotel = "500-5000";

  /// A business that provides lodging to the public generally without room service.
  static final String accomodationLodging = "500-5100";

  /// Top level category for places that are designated for sports, recreation, parking, beaches
  /// and other leisure and outdoor activities.
  static final String leisureAndOutdoor = "550";

  /// Public land preserved and maintained for recreational use.
  static final String leisureOutdoorRecreation = "550-5510";

  /// A park that contains rides and/or other entertainment which may be based on a central theme.
  static final String leisureOther = "550-5520";

  /// Top level category for places where consumer goods are commonly sold,
  /// such as clothing stores, grocery stores, hardware stores and other types of shopping centers.
  static final String shopping = "600";

  /// An establishment that sells groceries, candy, toiletries, soft drinks, tobacco products, newspapers and other products.
  static final String shoppingConvenienceStore = "600-6000";

  /// A complex of businesses that are co-located and share common services.
  static final String shoppingMallComplex = "600-6100";

  /// A business that sells a wide variety of merchandise that is organized by product or service departments.
  static final String shoppingDepartmentStore = "600-6200";

  /// A business that sells specialty products of a particular type of food or beverage.
  static final String shoppingFoodAndDrink = "600-6300";

  /// A business that sells medications, toiletry items and other retail cosmetics.
  static final String shoppingDrugstorePharmacy = "600-6400";

  /// A business that sells consumer electronics and electronic entertainment equipment.
  static final String shoppingElectronics = "600-6500";

  /// A business that sells crafts, gardening, remodeling, or decorating items for the home.
  static final String shoppingHardwareHouseGarden = "600-6600";

  /// A business that sells books, magazines and other reading material.
  static final String shoppingBookstore = "600-6700";

  /// A business that sells apparel items, garments or fashion accessories for men, women, and children.
  static final String shoppingClothingAndAccesories = "600-6800";

  /// A business that sells a variety of products targeted to consumers.
  static final String shoppingConsumerGoods = "600-6900";

  /// A business that provides hair styling and personal appearance services.
  /// Places in this category may also sell hair products and other related cosmetic items.
  static final String shoppingHairAndBeauty = "600-6950";

  /// Top level category for places that provide professional services to other businesses,
  /// such as printing, photocopying, graphic design, marketing, advertising and other general business services.
  static final String businessAndServices = "700";

  /// Businesses that specialize in the maintenance, lending, exchange, or issuance of money.
  static final String businessAndServicesBanking = "700-7000";

  /// A computer terminal that allows bank customers to deposit, withdraw, or transfer funds without the assistance of a bank teller.
  static final String businessAndServicesAtm = "700-7010";

  /// Businesses that provide money related services.
  static final String businessAndServicesMoneyCash = "700-7050";

  /// Businesses that provide communication services.
  static final String businessAndServicesCommunicationMedia = "700-7100";

  /// Businesses that provide a service or product for use by other businesses.
  static final String businessAndCommercialServices = "700-7200";

  /// Businesses that employ people in and around the city in which it is located.
  static final String businessAndServicesIndustry = "700-7250";

  /// Municipal emergency services.
  static final String businessAndServicesPoliceFireEmergency = "700-7300";

  /// An organization that provides consumer services for a variety of products for used by the public.
  static final String businessAndConsumerServices = "700-7400";

  /// An office or station that receives, sorts, dispatches and delivers mail to a specific area or region.
  static final String businessAndServicesPostOffice = "700-7450";

  /// Businesses that provide a variety of information for visiting tourists,
  /// such as event schedules, lodging/accommodations, restaurants, attractions and more.
  static final String businessAndServicesTouristInformation = "700-7460";

  /// Businesses that sell fuel for vehicles.
  static final String businessAndServicesFuelingStation = "700-7600";

  /// Businesses that sell new automobiles and motorcycles.
  static final String businessAndServicesCarDealerSales = "700-7800";

  /// Businesses that provide automotive repair services.
  static final String businessAndServicesCarRepairServices = "700-7850";

  /// Businesses that rent or lease automobiles.
  static final String businessAndServicesCarRental = "700-7851";

  /// Business that sell or service trucks and tractor trailers.
  static final String businessAndServicesTruckSemiDealer = "700-7900";

  /// Top level category for places associated with specialized facilities,
  /// such as sports venues, government buildings, health care centers and other types of facilities.
  static final String facilities = "800";

  /// Facilities that include dental offices, hospitals, nursing homes and other health care-related services.
  static final String facilitiesHospitalHealthcare = "800-8000";

  /// A Place where government services are provided.
  static final String facilitiesGovernmentCommunitty = "800-8100";

  /// Facilities that are used for educational purposes including primary schooling, secondary schooling, universities and more.
  static final String facilitiesEducation = "800-8200";

  /// Facilities that offer books, periodicals, audio, video and other material for public use.
  static final String facilitiesLibrary = "800-8300";

  /// An area or facility used for the hosting of fairs and conventions.
  static final String facilitiesEventSpaces = "800-8400";

  /// Area or building used for parking cars.
  static final String facilitiesParking = "800-8500";

  /// A facility used for individual and team sports including recreational sports.
  static final String facilitiesVenueSports = "800-8600";

  /// Facilities with miscellaneous uses such as Clubhouses, Offices, and Registration Offices.
  static final String facilitiesOther = "800-8700";

  /// Top level category for places that are owned, operated or managed by municipalities,
  /// such as cities, towns, villages, boroughs and shires.
  static final String areasAndBuildings = "900";

  /// Outdoor areas or complexes with designations for specific businesses or interests.
  static final String areasAndBuildingsOutdoorComplex = "900-9200";

  /// Areas and buildings designated for residential or office use.
  static final String areasAndBuildingsResidentalOffice = "900-9300";



  /// Gets the category id.
  String get id;





  /// Gets the primary flag.
  /// @nodoc
  bool get internalisPrimary;



}


// PlaceCategory "private" section, not exported.

final _sdk_search_PlaceCategory_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceCategory_copy_handle'));
final _sdk_search_PlaceCategory_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceCategory_release_handle'));
final _sdk_search_PlaceCategory_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_search_PlaceCategory_get_raw_pointer'));
final __are_equal = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_PlaceCategory_are_equal'));


class PlaceCategory$Impl implements PlaceCategory {
  @protected
  Pointer<Void> handle;

  PlaceCategory$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_search_PlaceCategory_get_raw_pointer(handle));
    _sdk_search_PlaceCategory_release_handle(handle);
    handle = null;
  }


  PlaceCategory$Impl.withId(String id) : handle = _withId(id) {
    __lib.reverseCache[_sdk_search_PlaceCategory_get_raw_pointer(handle)] = this;
  }


  PlaceCategory$Impl.internalwithIdAndPrimaryFlag(String id, bool primary) : handle = _withIdAndPrimaryFlag(id, primary) {
    __lib.reverseCache[_sdk_search_PlaceCategory_get_raw_pointer(handle)] = this;
  }

  static Pointer<Void> _withId(String id) {
    final _withId_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_PlaceCategory_make__String'));
    final _id_handle = String_toFfi(id);
    final __result_handle = _withId_ffi(__lib.LibraryContext.isolateId, _id_handle);
    String_releaseFfiHandle(_id_handle);
    return __result_handle;
  }

  static Pointer<Void> _withIdAndPrimaryFlag(String id, bool primary) {
    final _withIdAndPrimaryFlag_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint8), Pointer<Void> Function(int, Pointer<Void>, int)>('here_sdk_sdk_search_PlaceCategory_make__String_Boolean'));
    final _id_handle = String_toFfi(id);
    final _primary_handle = Boolean_toFfi(primary);
    final __result_handle = _withIdAndPrimaryFlag_ffi(__lib.LibraryContext.isolateId, _id_handle, _primary_handle);
    String_releaseFfiHandle(_id_handle);
    Boolean_releaseFfiHandle(_primary_handle);
    return __result_handle;
  }

  @override
  String get id {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_PlaceCategory_id_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }


  @override
  bool get internalisPrimary {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_search_PlaceCategory_isPrimary_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }


  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! PlaceCategory$Impl) return false;
    return __are_equal((this as PlaceCategory$Impl).handle, other.handle) != 0;
  }

}

Pointer<Void> sdk_search_PlaceCategory_toFfi(PlaceCategory value) =>
  _sdk_search_PlaceCategory_copy_handle((value as PlaceCategory$Impl).handle);

PlaceCategory sdk_search_PlaceCategory_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_search_PlaceCategory_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as PlaceCategory;
  if (instance != null) return instance;

  final _copied_handle = _sdk_search_PlaceCategory_copy_handle(handle);
  final result = PlaceCategory$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_search_PlaceCategory_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_search_PlaceCategory_release_handle(handle);

Pointer<Void> sdk_search_PlaceCategory_toFfi_nullable(PlaceCategory value) =>
  value != null ? sdk_search_PlaceCategory_toFfi(value) : Pointer<Void>.fromAddress(0);

PlaceCategory sdk_search_PlaceCategory_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_search_PlaceCategory_fromFfi(handle) : null;

void sdk_search_PlaceCategory_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_PlaceCategory_release_handle(handle);

// End of PlaceCategory "private" section.

