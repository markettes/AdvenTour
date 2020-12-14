
import 'package:Adventour/app_localizations.dart';
import 'package:Adventour/widgets/input_text.dart';
import 'package:adventour_company/pages/search_page.dart';
import 'package:adventour_company/widgets/primary_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:flutter/material.dart';

import 'dart:async';


// ignore: must_be_immutable
class AddPromotionPage extends StatelessWidget {
  AddPromotionPage({this.allowSignUp = true});
  bool allowSignUp;
  
  String name;
  String coords;
  String description;

  TextEditingController _textControllerName =
      TextEditingController(text: "Name");

  TextEditingController _textControllerCoord =
  TextEditingController(text: "(Lat, Long)");

  TextEditingController _textControllerDesc =
  TextEditingController(text: "Description");


   TextEditingController _locationControllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add promotion'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Image.asset(
                  'assets/logo_adventour+titulo.png',
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 20,
                          )
                        ]),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '    Search your site',
                            ),
                            controller: _locationControllerSearch,
                            onTap: () async {
                              await PlacesAutocomplete.show(
                                context: context,
                                onTapPrediction: _onTapPrediction,
                                onSubmitted: (value) {},
                              );
                            },
                            readOnly: true,
                            ),
                        ),
                        ]
                      )
                    )
                  )

                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  
                ]
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: InputText(
                      controller: _textControllerName,
                      labelText: 'Name',
                      )
                  )
                ]
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: InputText(
                      controller: _textControllerCoord,
                      labelText: 'Coordinates',
                      )
                  )
                ]
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: InputText(
                      controller: _textControllerDesc,
                      labelText: 'Description',
                      )
                  )
                ]
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PrimaryButton(
                    text: 'Confirm',
                    onPressed: () async {
                      
                    },
                    icon: Icons.add_location_rounded,
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

  Future _onTapPrediction(Prediction prediction) async {
    String id = prediction.placeId;
  }

  
}

