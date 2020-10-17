
import 'package:here_sdk/core.dart';

class MapMarkerManager {
  
  GeoCoordinates geoCoordinates;
  String placeType;


  MapMarkerManager (GeoCoordinates geoCoordinates, String placeType) {
    this.geoCoordinates = geoCoordinates;
    this.placeType = placeType;
  }

  void addMarker(){



  }


  void markerPlace(GeoCoordinates coords, String sitePoi) {
    //utilizar "sitePoi.png" para buscar y así no hacer un 
    //switch y que sea mas facil añadir sitios nuevos
  }



}
