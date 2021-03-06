import 'package:Adventour/controllers/my_shared_preferences.dart';
import 'package:Adventour/pages/achievements_page.dart';
import 'package:Adventour/pages/add_places_page.dart';
import 'package:Adventour/pages/highlight_page.dart';
import 'package:Adventour/pages/history_page.dart';
import 'package:Adventour/pages/init_page.dart';
import 'package:Adventour/pages/log_in_page.dart';
import 'package:Adventour/pages/navigation_page.dart';
import 'package:Adventour/pages/place_page.dart';
import 'package:Adventour/pages/root_page.dart';
import 'package:Adventour/pages/route_page.dart';
import 'package:Adventour/pages/routes_page.dart';
import 'package:Adventour/pages/settings_page.dart';
import 'package:Adventour/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Adventour/pages/profile_page.dart';
import 'package:Adventour/pages/custom_route_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';

void main() {
  runApp(Adventour());
}

class Adventour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      title: 'AdvenTour',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      darkTheme: themeData,
      initialRoute: '/',
      navigatorKey: _navigatorKey,
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        //Test if locale is supported
        var supportedLocale;
        for (supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first; //If is not supported, in english
      },
      routes: {
        '/initPage': (_) => InitPage(),
        '/profile': (_) => ProfilePage(),
        '/historyPage': (_) => HistoryPage(),
        '/logInPage': (_) => LogInPage(),
        '/signUpPage': (_) => SignUpPage(),
        '/': (_) => RootPage(navigatorKey: _navigatorKey),
        '/placePage': (_) => PlacePage(),
        '/achievementsPage': (_) => AchievementsPage(),
        '/customRoutePage': (_) => CustomRoutePage(),
        '/routePage': (_) => RoutePage(),
        '/addPlacesPage': (_) => AddPlacesPage(),
        '/highlightPage': (_) => HighlightPage(),
        '/routesPage': (_) => RoutesPage(),
        '/profilePage': (_) => ProfilePage(),
        '/navigationPage': (_) => NavigationPage(),
        '/settingsPage': (_) => SettingsPage()
      },
    );
  }
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
