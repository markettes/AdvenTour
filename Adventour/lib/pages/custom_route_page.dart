import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/controllers/geocoding.dart';
import 'package:Adventour/controllers/route_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:Adventour/pages/search_page.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:Adventour/widgets/input_text.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/models/Route.dart' as r;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/src/core.dart';
import 'package:toast/toast.dart';

class CustomRoutePage extends StatefulWidget {
  @override
  _CustomRoutePageState createState() => _CustomRoutePageState();
}

class _CustomRoutePageState extends State<CustomRoutePage> {
  List<String> _placeTypes = [PARK, TOURIST_ATTRACTION, RESTAURANT, MUSEUM];
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBarController;
  String _location;
  String _locationId;
  TextEditingController _locationController =
      TextEditingController(text: 'Your location');

  @override
  void initState() {
    sortPlaceTypes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creating your route'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Image.asset(
                  'assets/logo_adventour.png',
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: InputText(
                      controller: _locationController,
                      labelText: 'Route zone',
                      icon: Icons.location_on,
                      onTap: () => PlacesAutocomplete.show(
                        context: context,
                        onTapPrediction: (prediction) {
                          Navigator.pop(context);

                          _location = prediction.description;
                          _locationId = prediction.placeId;
                          setState(() {
                            _locationController.text = _location;
                          });
                        },
                        onSubmitted: (value) {},
                      ),
                      readOnly: true,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text('Place types',
                                style: Theme.of(context).textTheme.headline2)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: ListView.separated(
                              itemCount: placeTypes.length,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 5),
                              itemBuilder: (context, index) {
                                bool activated =
                                    _placeTypes.contains(placeTypes[index]);
                                return CircleIconButton(
                                    activated: activated,
                                    type: placeTypes[index],
                                    onPressed: () {
                                      if (activated) {
                                        if (_placeTypes.length > 4) {
                                          _placeTypes.remove(placeTypes[index]);
                                          sortPlaceTypes();
                                          setState(() {});
                                        } else
                                          Toast.show(
                                              'The route needs at least 4 type places',
                                              context,
                                              duration: 3);
                                      } else {
                                        if (_placeTypes.length < 8) {
                                          _placeTypes.add(placeTypes[index]);
                                          sortPlaceTypes();
                                          setState(() {});
                                        } else
                                          Toast.show(
                                              'The route has at most 7 type places',
                                              context,
                                              duration: 3);
                                      }
                                    });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PrimaryButton(
                    text: 'CREATE',
                    onPressed: () async {
                      RouteEngineResponse routeEngineResponse = await _makeRoute();
                      Navigator.pushNamed(context, '/routePage',
                          arguments: {'routeEngineResponse': routeEngineResponse});
                    },
                    icon: Icons.edit,
                    style: ButtonType.Normal,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<RouteEngineResponse> _makeRoute() async {
    Location location;
    if (_locationId == null) {
      Position position = await Geolocator.getCurrentPosition();
      location = Location(position.latitude, position.longitude);
    } else {
      location = await geocoding.searchByPlaceId(_locationId);
    }

    return await routeEngine.makeRoute(location, _placeTypes);
  }

  void sortPlaceTypes() {
    List sorted = [];
    sorted.addAll(_placeTypes);
    for (var placeType in placeTypes) {
      if (!sorted.contains(placeType)) sorted.add(placeType);
    }
    placeTypes = sorted;
  }
}

// Expanded(
//                     child: Column(
//                       children: [
//                         Align(
//                             alignment: Alignment.topLeft,
//                             child: Text('Transports',
//                                 style: Theme.of(context).textTheme.headline2)),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20, right: 20),
//                             child: SizedBox(
//                               height: 70,
//                               child: ListView.separated(
//                                 itemCount: transports.length,
//                                 scrollDirection: Axis.horizontal,
//                                 separatorBuilder: (context, index) =>
//                                     SizedBox(width: 5),
//                                 itemBuilder: (context, index) {
//                                   bool activated =
//                                       _transports.contains(transports[index]);
//                                   return CircleIconButton(
//                                       activated: activated,
//                                       type: transports[index],
//                                       onPressed: () {
//                                         setState(() {
//                                           if (activated) {
//                                             if (_transports.length > 1) {
//                                               _transports
//                                                   .remove(transports[index]);
//                                               sortTransports();
//                                             }
//                                           } else {
//                                             _transports.add(transports[index]);
//                                             sortTransports();
//                                           }
//                                         });
//                                       });
//                                 },
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),

//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: 200,
//             decoration: BoxDecoration(
//                 color: Theme.of(context).accentColor,
//                 borderRadius: BorderRadius.circular(20)),
//             padding: EdgeInsets.all(8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.timer,
//                   size: 40,
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.keyboard_arrow_down,
//                     ),
//                     SizedBox(
//                       width: 60,
//                       child: Switch(
//                         value: _shortRoute,
//                         activeColor:
//                             Theme.of(context).primaryColor,
//                         inactiveThumbColor:
//                             Theme.of(context).primaryColor,
//                         inactiveTrackColor: Theme.of(context)
//                             .primaryColor
//                             .withOpacity(0.5),
//                         onChanged: (value) {
//                           setState(() {
//                             _shortRoute = value;
//                           });
//                         },
//                       ),
//                     ),
//                     Icon(
//                       Icons.keyboard_arrow_up,
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.info_outline),
//             onPressed: () => showDialog(
//               context: context,
//               builder: (context) => Dialog(
//                 child: Container(
//                     height: 150,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.keyboard_arrow_down),
//                             Expanded(
//                               child: Text(
//                                 'Short routes: about 3 hours max',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText2
//                                     .copyWith(fontSize: 16),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.keyboard_arrow_up),
//                             Expanded(
//                               child: Text(
//                                   'Long routes: about 5 hours max',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyText2
//                                       .copyWith(fontSize: 16)),
//                             ),
//                           ],
//                         ),
//                         FlatButton(
//                             onPressed: () =>
//                                 Navigator.pop(context),
//                             child: Text(
//                               'OK',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline2,
//                             ))
//                       ],
//                     )),
//               ),
//             ),
//           ),
//         ],
//       ),
