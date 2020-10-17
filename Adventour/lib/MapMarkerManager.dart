
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';

class MapMarkerManager {
  
  GeoCoordinates geoCoordinates;
  String placeType;
  List<MapMarker> mapMarkerList = [];
  HereMapController hereMapController;
  MapImage poiMapImage;


  MapMarkerManager (GeoCoordinates geoCoordinates, String placeType) {
    this.geoCoordinates = geoCoordinates;
    this.placeType = placeType;
  }

  void addMarker() {
    addPOIMapMarker(this.geoCoordinates, 1);
  }

  void clearMarkers(){
    for (var mapMarker in mapMarkerList) {
      hereMapController.mapScene.removeMapMarker(mapMarker);
    }
    mapMarkerList.clear();
  }

  Future<void> addPOIMapMarker(
      GeoCoordinates geoCoordinates, int drawOrder) async {
    // Reuse existing MapImage for new map markers.
    if (poiMapImage == null) {
      Uint8List imagePixelData = await loadFileAsUint8List('poi.png');
      poiMapImage =
          MapImage.withPixelDataAndImageFormat(imagePixelData, ImageFormat.png);
    }

    Anchor2D anchor2D = Anchor2D.withHorizontalAndVertical(0.5, 1);

    MapMarker mapMarker =
        MapMarker.withAnchor(geoCoordinates, poiMapImage, anchor2D);
    mapMarker.drawOrder = drawOrder;

    Metadata metadata = new Metadata();
    metadata.setString("key_poi", "Metadata: This is a POI.");
    mapMarker.metadata = metadata;

    hereMapController.mapScene.addMapMarker(mapMarker);
    mapMarkerList.add(mapMarker);
  }

  Future<Uint8List> loadFileAsUint8List(String fileName) async {

    ByteData fileData = await rootBundle.load('assets/' + fileName);
    return Uint8List.view(fileData.buffer);
  }

}
