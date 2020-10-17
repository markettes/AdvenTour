import 'package:Adventour/pages/init_page.dart';
import 'package:Adventour/pages/login_page.dart';
import 'package:Adventour/pages/main_page.dart';
import 'package:Adventour/pages/root_page.dart';
import 'package:Adventour/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';

void main() {
  SdkContext.init(IsolateOrigin.main);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HERE SDK for Flutter - Hello Map!',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: '/',
      routes: {
        '/map': (_) => HereMap(
              onMapCreated: _onMapCreated,
            ),
        '/initPage': (_) => InitPage(),
        '/loginPage': (_) => LoginPage(),
        '/signupPage': (_) => SignupPage(),
        '/': (_) => RootPage(),
        'mainPage': (_) => MainPage()
      },
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay,
        (MapError error) {
      if (error != null) {
        print('Map scene not loaded. MapError: ${error.toString()}');
        return;
      }

      const double distanceToEarthInMeters = 8000;
      hereMapController.camera.lookAtPointWithDistance(
          GeoCoordinates(39.2434, -0.42), distanceToEarthInMeters);
    });
  }

  var themeData = ThemeData(
    primaryColor: Colors.deepPurple[600],
    accentColor: Colors.deepPurple[100],
    backgroundColor: Colors.deepPurple[50],
    scaffoldBackgroundColor: Colors.deepPurple[50],
    hoverColor: Colors.deepPurple[100],
    splashColor: Colors.deepPurple[100],
    cursorColor: Colors.deepPurple[600],
    buttonColor: Colors.white,
    dividerColor: Colors.black,
    textTheme: TextTheme(
        headline1: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 25,
          color: Colors.white,
        ),
        headline2: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 25,
          color: Colors.deepPurple[500],
        ),
        bodyText1: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 17,
          fontFamily: 'Roboto',
        ),
        bodyText2: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black54,
        )),
    iconTheme: IconThemeData(color: Colors.deepPurple[600]),
  );
}
