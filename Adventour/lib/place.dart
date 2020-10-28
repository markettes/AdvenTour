

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {

  String _telNumber;
  String _hour;
  int _puntuation;
  String _address;
  int _time;

  Place (String telNumber, String hour, int puntuation, String address, int time){
    this._telNumber = telNumber;
    this._hour = hour;
    this._puntuation = puntuation;
    this._address = address;
    this._time = time;
  }
}
