import 'dart:typed_data';

import 'package:flutter/services.dart';

/*class EngineMarker {
  List<MapMarker> _mapMarkerList = [];
  HereMapController _hereMapController;
  MapImage _poiMapImage;

  EngineMarker(HereMapController hereMapController) {
    this._hereMapController = hereMapController;
  }

  void clearMarkers() {
    for (var mapMarker in _mapMarkerList) {
      _hereMapController.mapScene.removeMapMarker(mapMarker);
    }
    _mapMarkerList.clear();
  }

  Future<void> addPOIMapMarker(
      GeoCoordinates geoCoordinates, int drawOrder, String type) async {
    if (_poiMapImage == null) {
      Uint8List imagePixelData = await loadFileAsUint8List(type + '.png');
      _poiMapImage =
          MapImage.withPixelDataAndImageFormat(imagePixelData, ImageFormat.png);
    }

    Anchor2D anchor2D = Anchor2D.withHorizontalAndVertical(0.5, 1);

    MapMarker mapMarker =
        MapMarker.withAnchor(geoCoordinates, _poiMapImage, anchor2D);
    mapMarker.drawOrder = drawOrder;

    Metadata metadata = new Metadata();
    metadata.setString("key_poi", "Metadata: This is a POI.");
    mapMarker.metadata = metadata;

    _hereMapController.mapScene.addMapMarker(mapMarker);
    _mapMarkerList.add(mapMarker);
  }

  Future<Uint8List> loadFileAsUint8List(String fileName) async {
    ByteData fileData = await rootBundle.load('assets/' + fileName);
    return Uint8List.view(fileData.buffer);
  }
}*/
