import 'package:Adventour/pages/init_page.dart';
import 'package:Adventour/pages/log_in_page.dart';
import 'package:Adventour/pages/map_page.dart';
import 'package:Adventour/pages/place_page.dart';
import 'package:Adventour/pages/root_page.dart';
import 'package:Adventour/pages/creating_route_page.dart';
import 'package:Adventour/pages/route_page.dart';
import 'package:Adventour/pages/sign_up_page.dart';
import 'package:Adventour/engine_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Adventour/pages/custom_route_page.dart';

void main() {
  //SdkContext.init(IsolateOrigin.main);
  runApp(Adventour());
}

class Adventour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      title: 'AdvenTour',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/initPage': (_) => InitPage(),
        '/logInPage': (_) => LogInPage(),
        '/signUpPage': (_) => SignUpPage(),
        '/': (_) => RootPage(),
        '/mapPage': (_) => MapPage(),
        '/placePage': (_) => PlacePage(),
        '/creatingRoutePage': (_) => CreatingRoutePage(),
        '/customRoutePage': (_) => CustomRoutePage(),
        '/routePage':(_) => RoutePage(),
      },
    );
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
    disabledColor: Colors.deepPurple[200],
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
