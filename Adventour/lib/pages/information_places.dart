import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';

class InformationPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nombre tienda'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.grey),
              onPressed: () => Navigator.of(context).pop(),
              ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height:200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/rosquilleta.jpg'),
                  fit: BoxFit.cover,
                )
              )
            )
            
          ]
        )
        )
    );
  }
}