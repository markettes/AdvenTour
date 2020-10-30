import 'package:Adventour/controllers/search_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/widgets/category_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as Location;

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController _mapController;
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  SearchEngine _seachEngine = SearchEngine();

  @override
  Widget build(BuildContext context) {
    _add();
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          FutureBuilder(
              future: Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());
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
                  onTap: (position) {
                    print(position);
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                );
              }),
          Container(
            height: 40,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 50, left: 20, right: 20),
            //padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryCheckbox("Restaurant", Icons.restaurant),
                CategoryCheckbox("park", Icons.park),
                CategoryCheckbox("Restaurant", Icons.museum),
                CategoryCheckbox("Restaurant", Icons.beach_access),
                CategoryCheckbox("Restaurant", Icons.restaurant),
                CategoryCheckbox("Restaurant", Icons.restaurant),
              ],
              physics: BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: _currentLocation,
        isExtended: false,
        label: Icon(
          Icons.location_on,
          color: Theme.of(context).buttonColor,
        ),
      ),
    );
  }

  void _currentLocation() async {
    final GoogleMapController controller = _mapController;
    Location.LocationData currentLocation;
    var location = new Location.Location();
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
    ));
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _changeMapStyle(_mapController);
    _searchRestaurants(controller);
  }

  Future _changeMapStyle(GoogleMapController controller) async {
    String style = await rootBundle.loadString("assets/map_style.json");
    controller.setMapStyle(style);
  }

  Future _searchRestaurants(GoogleMapController controller) async {
    List<Place> places =
        await _seachEngine.searchByLocation(39.5305989, -0.3489142);
    for (var place in places) {
      print(place.toString());
    }
  }

  void _add() {
    // var markerIdVal = MyWayToGenerateId();
    final MarkerId markerId = MarkerId('1');

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(39.531600, -0.349953),
      infoWindow: InfoWindow(title: markerId.toString(), snippet: '*'),
      onTap: () {
        // _onMarkerTapped(markerId);
      },
    );

    setState(() {
      // adding a new marker to map
      _markers[markerId] = marker;
    });
  }
}
