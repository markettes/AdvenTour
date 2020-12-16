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

  TextEditingController _textControllerName = TextEditingController();

  TextEditingController _textControllerCoord = TextEditingController();

  TextEditingController _textControllerDesc = TextEditingController();

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
            Padding(
              padding: const EdgeInsets.all(25),
              child: Image.asset(
                'assets/logo_adventour+titulo.png',
                height: 175,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20,
                        )
                      ]),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search...',
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Icon(
                          Icons.search,
                        ),
                      ),
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
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Find your site to fill the fields.',
              style:
                  Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 17),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 50,
                      child: InputText(
                        controller: _textControllerName,
                        labelText: 'Name',
                        readOnly: true,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: InputText(
                        controller: _textControllerCoord,
                        labelText: 'Coordinates',
                        readOnly: true,
                        icon: Icons.location_on,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    PrimaryButton(
                      text: 'CONFIRM',
                      onPressed: () async {},
                      style: ButtonType.Normal,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _onTapPrediction(Prediction prediction) async {
    String id = prediction.placeId;
  }
}
