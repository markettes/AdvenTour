import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart' as directions;
import 'package:intl/intl.dart';

class MapController {
  GoogleMapController _mapController;
  Map<MarkerId, Marker> _markers = {};
  Map<PolylineId, Polyline> _polylines = {};
  String _style;

  BitmapDescriptor _startImage;
  BitmapDescriptor _parkImage;
  BitmapDescriptor _restaurantImage;
  BitmapDescriptor _touristAttractionImage;
  BitmapDescriptor _stadiumImage;
  BitmapDescriptor _museumImage;
  BitmapDescriptor _nightClubImage;
  BitmapDescriptor _shoppingMallImage;
  BitmapDescriptor _localityImage;

  Map<PolylineId, Polyline> get polylines => _polylines;

  Map<MarkerId, Marker> get markers => _markers;

  bool get mapCreated => _mapController != null;

  bool get isNight => _style == "assets/map_styles/dark.json";

  void onMapCreated(GoogleMapController controller, [Function then]) {
    _mapController = controller;
    _changeMapStyle(_mapController);
    if (then != null) then();
  }

  Future _changeMapStyle(GoogleMapController controller) async {
    DateTime now;
    String formattedDate;

    now = DateTime.now();
    formattedDate = DateFormat('kk').format(now);

    if (int.parse(formattedDate) < 20) {
      _style = "assets/map_styles/light.json";
    } else {
      _style = "assets/map_styles/dark.json";
    }

    controller.setMapStyle(await rootBundle.loadString(_style));
  }

  drawPolyline(Polyline polyline) {
    _polylines[polyline.polylineId] = polyline;
  }

  clearPolyline() {
    _polylines = {};
  }

  void _addMarker(Marker marker) => _markers[marker.markerId] = marker;

  void addPlaceMarker(Place place, BuildContext context) async {
    Marker marker = Marker(
      markerId: MarkerId(place.id),
      position: LatLng(place.latitude, place.longitude),
      icon: await _buildMarkerImage(place.type),
      infoWindow: InfoWindow(
          title: place.name ?? "Unknown",
          onTap: () {
            if (place.type != LOCALITY)
              Navigator.of(context).pushNamed(
                '/placePage',
                arguments: {
                  'place': place,
                  'tapMap': () {
                    goToCoordinates(place.latitude, place.longitude, 18);
                  }
                },
              );
            else
              Navigator.of(context).pushNamed(
                '/highlightPage',
                arguments: {
                  'place': place,
                },
              );
          }),
    );

    _addMarker(marker);
  }

  void addStartMarker(LatLng position, BuildContext context) async {
    Marker marker = Marker(
      markerId: MarkerId('start'),
      position: position,
      icon: await _buildStartImage(),
      infoWindow: InfoWindow(
        title: 'Start',
      ),
    );

    _addMarker(marker);
  }
  Future<BitmapDescriptor> _buildStartImage() async { 
    if (_startImage == null)
        _startImage = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(devicePixelRatio: 2.5),
          'assets/markers/start.png',
        );
      return _startImage;
  }

  Future<BitmapDescriptor> _buildMarkerImage(String type) async {
    if (type == PARK) {
      if (_parkImage == null)
        _parkImage = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(devicePixelRatio: 2.5),
          'assets/markers/park.png',
        );
      return _parkImage;
    }
    if (type == RESTAURANT) if (_restaurantImage == null) {
      _restaurantImage = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/markers/restaurant.png',
      );
      return _restaurantImage;
    }
    if (type == STADIUM) {
      if (_stadiumImage == null)
        _stadiumImage = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(devicePixelRatio: 2.5),
          'assets/markers/stadium.png',
        );
      return _stadiumImage;
    }

    if (type == NIGHT_CLUB) {
      if (_nightClubImage == null)
        _nightClubImage = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(devicePixelRatio: 2.5),
          'assets/markers/night_life.png',
        );
      return _nightClubImage;
    }

    if (type == SHOPPING_MALL) {
      if (_shoppingMallImage == null)
        _shoppingMallImage = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(devicePixelRatio: 2.5),
          'assets/markers/shopping_mall.png',
        );
      return _shoppingMallImage;
    }

    if (type == MUSEUM) {
      if (_museumImage == null)
        _museumImage = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(devicePixelRatio: 2.5),
          'assets/markers/museum.png',
        );
      return _museumImage;
    }

    if (type == LOCALITY) {
      if (_localityImage == null)
        _localityImage = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(devicePixelRatio: 2.5),
          'assets/markers/locality.png',
        );
      return _localityImage;
    } else {
      if (_touristAttractionImage == null)
        _touristAttractionImage = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(devicePixelRatio: 2.5),
          'assets/markers/tourist_attraction.png',
        );
      return _touristAttractionImage;
    }
  }

  void clearMarker(String id) {
    _markers.remove(MarkerId(id));
  }

  void clearMarkers() {
    _markers.clear();
  }

  void goToCoordinates(double latitude, double longitude, double zoom) {
    // Navigator.pop(context);
    _mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(latitude, longitude),
        zoom: zoom,
      ),
    ));
  }

  void zoomOut(double latitude, double longitude) {
    // Navigator.pop(context);
    _mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(latitude, longitude),
        zoom: 14.5,
      ),
    ));
  }
}
