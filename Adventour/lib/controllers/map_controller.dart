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

  Map<PolylineId, Polyline> get polylines => _polylines;

  Map<MarkerId, Marker> get markers => _markers;

  void onMapCreated(GoogleMapController controller, [Function then]) {
    _mapController = controller;
    _changeMapStyle(_mapController);
    if (then != null) then();
  }

  Future _changeMapStyle(GoogleMapController controller) async {
    DateTime now;
    String formattedDate;
    String style;

    now = DateTime.now();
    formattedDate = DateFormat('kk').format(now);

    if (int.parse(formattedDate) < 20) {
      style = await rootBundle.loadString("assets/map_styles/light.json");
    } else {
      style = await rootBundle.loadString("assets/map_styles/dark.json");
    }

    controller.setMapStyle(style);
  }

  drawPolyline(Polyline polyline) {
    _polylines[polyline.polylineId] = polyline;
  }

  void addMarker(Place place, BuildContext context) {
    Marker marker = Marker(
      markerId: MarkerId(place.name),
      position: LatLng(place.latitude, place.longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      infoWindow: InfoWindow(
          title: place.name ?? "Unknown",
          onTap: () {
            if (place.id == 'start')
              return;
            else {
              Navigator.of(context).pushNamed(
                '/placePage',
                arguments: {
                  'place': place,
                  'tapMap': () {
                    goToCoordinates(place.latitude, place.longitude, 18);
                  }
                },
              );
            }
          }),
    );

    _markers[marker.markerId] = marker;
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
