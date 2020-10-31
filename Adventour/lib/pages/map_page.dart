import 'dart:async';

import 'package:Adventour/widgets/square_icon_button.dart';
import 'dart:convert';

import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import "package:google_maps_webservice/places.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' as Geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/src/core.dart';
import 'package:location/location.dart' as Locationn;
  _MapPageState createState() => _MapPageState();
}
class _MapPageState extends State<MapPage> {
  GoogleMapController _mapController;
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Position _position;
  bool _fixedPosition = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
    //_add();
    return Scaffold(
      body: FutureBuilder(
          future: Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            if (!snapshot.hasData) return CircularProgressIndicator();
            Position position = snapshot.data;
            LatLng currentPosition =
                LatLng(position.latitude, position.longitude);
            return GoogleMap(
              onMapCreated: _onMapCreated,
              zoomControlsEnabled: false,
              markers: Set<Marker>.of(_markers.values),
              initialCameraPosition: CameraPosition(
                target: currentPosition,
                zoom: 11.0,
              ),
              onTap: _handleTap,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () async {
          if (_position != null) {
            _mapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                bearing: 0,
                target: LatLng(_position.latitude, _position.longitude),
                zoom: 18.0,
              ),
            ));
            setState(() {
              _fixedPosition = true;
            });
          }
        },
        child: Icon(
          Icons.gps_fixed,
          color:
              _fixedPosition ? Colors.blue[200] : Theme.of(context).buttonColor,
        ),
      ),
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          FutureBuilder(
              future: Geolocator.getLastKnownPosition(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (!snapshot.hasData) return CircularProgressIndicator();
                Position position = snapshot.data;
                return Listener(
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    zoomControlsEnabled: false,
                    markers: Set<Marker>.of(_markers.values),
                    initialCameraPosition: CameraPosition(
                      target: LatLng(position.latitude, position.longitude),
                      zoom: 11.0,
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                  ),
                  onPointerMove: (event) {
                    if (_fixedPosition)
                      setState(() {
                        _fixedPosition = false;
                      });
                  },
                );
              }),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // MaterialButton(
                //   child: Icon(
                //     Icons.menu,
                //     color: Theme.of(context).buttonColor,
                //   ),
                //   color: Theme.of(context).primaryColor,
                //   height: 53,
                //   elevation: 15,
                //   shape: CircleBorder(),
                //   onPressed: () {
                //     _scaffoldKey.currentState.openDrawer();
                //   },
                // ),

                MaterialButton(
                  child: Icon(
                    Icons.search,
                    color: Theme.of(context).buttonColor,
                  ),
                  color: Theme.of(context).primaryColor,
                  height: 53,
                  shape: CircleBorder(),
                  elevation: 15,
                  onPressed: () async {
                    setState(() {
                      _fixedPosition = false;
                    });
                    await PlacesAutocomplete.show(
                      context: context,
                      apiKey: "AIzaSyAzLMUtt6ZleHHXpB2LUaEkTjGuT8PeYho",
                      location:
                          Location(_position.latitude, _position.longitude),
                      mapController: _mapController,
                      addMarkers: _addMarkers,
                      cleanMarkers: _clearMarkers,
                    );
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                MaterialButton(
                  child: Icon(
                    Icons.delete,
                    color: Theme.of(context).buttonColor,
                  ),
                  color: Theme.of(context).primaryColor,
                  height: 53,
                  shape: CircleBorder(),
                  elevation: 15,
                  onPressed: _markers.isEmpty ? null : () => _clearMarkers(),
                ),
              ],
            ),
          ),
          StreamBuilder(
            stream: Geolocator.getPositionStream(
                desiredAccuracy: LocationAccuracy.medium),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if (!snapshot.hasData) return CircularProgressIndicator();
              _position = snapshot.data;
              if (_fixedPosition) {
                _mapController.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(_position.latitude, _position.longitude),
                    zoom: 18.0,
                  ),
                ));
              }
              return Container();
            },
          ),
        ],
    );
  }

  void _currentLocation() async {
    final GoogleMapController controller = _mapController;
    Locationn.LocationData currentLocation;
    var location = new Locationn.Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 18.0,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _changeMapStyle(_mapController);
  }

  Future _changeMapStyle(GoogleMapController controller) async {
    String style = await rootBundle.loadString("assets/map_style.json");
    controller.setMapStyle(style);
  }

  void _addMarkers(List<Marker> markers) {
    // var markerIdVal = MyWayToGenerateId();
    for (var marker in markers) {
      final MarkerId markerId = marker.markerId;

      setState(() {
        _markers[markerId] = marker;
      });
    }
  }

  void _clearMarkers() {
    setState(() {
      _markers.clear();
    });
  }

  void _handleTap(LatLng point) {
    setState(() {
      _nearPlaces(point);
    });
  }

  /*
                 * Cuando haces click en un lugar con sitios cercanos se centra en el lugar pero si no hay ningun lugar próximo se va exactamente
                 * a donde has pulsado, si ha encontrado un sitio cercano estará en la variable local "placeDef" del metodo
                 */
  Future<void> _nearPlaces(LatLng point) async {
    //List<Geo.Placemark> placemark = await Geo.placemarkFromCoordinates(point.latitude,point.longitude);
    //List<Geo.Location> locations = await Geo.locationFromAddress("Gronausestraat 710, Enschede");

    String apiKey = "AIzaSyAzLMUtt6ZleHHXpB2LUaEkTjGuT8PeYho";
    var url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=' +
            point.latitude.toString() +
            ',' +
            point.longitude.toString() +
            '&radius=50&key=' +
            apiKey;

    Response responsePlaces = await get(url);
    var decoded = json.decode(responsePlaces.body);
    List results = decoded["results"];
    List<Place> places =
        results.map((place) => Place.fromGoogleMaps(place)).toList();

    //GoogleMapsPlaces places = new GoogleMapsPlaces(apiKey: "AIzaSyAzLMUtt6ZleHHXpB2LUaEkTjGuT8PeYho");
    //PlacesSearchResponse response = await places.searchNearbyWithRadius(new Location(point.latitude,point.longitude), 500);
    //PlacesDetailsResponse responsee = await places.getDetailsByPlaceId("PLACE_ID");

    num menor = 10;
    Place placeDef;
    for (var place in places) {
      var _distanceInMeters = Geolocator.distanceBetween(
          point.latitude, point.longitude, place.latitude, place.longitude);
      if (_distanceInMeters < menor) {
        menor = _distanceInMeters;
        placeDef = place;
      }
    }

    GoogleMapsPlaces placesGM = new GoogleMapsPlaces(apiKey: apiKey);
    if (placeDef != null) {
      //debugging nombre place
      PlacesDetailsResponse response =
          await placesGM.getDetailsByPlaceId(placeDef.id);
      print("***********************");
      PlaceDetails r = response.result;
      print(r.name);
      print(r.rating);
      print(r.formattedAddress);
      print(r.formattedPhoneNumber);

      List<Review> revs = r.reviews;
      if (revs != null) {
        for (var review in revs) {
          print(review.authorName + ": " + review.text);
        }
      }
    }

    LatLng newPoint;
    if (placeDef == null) {
      newPoint = point;
    } else {
      newPoint = new LatLng(placeDef.latitude, placeDef.longitude);
    }

    setState(() {
      Marker newMarker = Marker(
        markerId: MarkerId(newPoint.toString()),
        position: newPoint,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      );
      _markers.clear();
      _markers[MarkerId(newPoint.toString())] = newMarker;
    });
  }
}
