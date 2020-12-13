
import 'package:Adventour/app_localizations.dart';
import 'package:adventour_company/pages/search_page.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:flutter/material.dart';

import 'dart:async';


// ignore: must_be_immutable
class AddPromotionPage extends StatelessWidget {
  AddPromotionPage({this.allowSignUp = true});
  bool allowSignUp;


   TextEditingController _locationController = TextEditingController();

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
                              hintText: '    Search', //xd
                            ),
                            controller: _locationController,
                            onTap: () async {
                              await PlacesAutocomplete.show(
                                context: context,
                                onTapPrediction: _onTapPrediction,
                                onSubmitted: _onSubmitted,
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
            
          ],
        ),
      ),
    );
  }

  Future _onTapPrediction(Prediction prediction) async {
    
  }

  Future _onSubmitted(String value) async {
  }

}

