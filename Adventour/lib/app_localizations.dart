import 'package:Adventour/controllers/my_shared_preferences.dart';
import 'package:Adventour/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppLocalizations {
  final Locale locale;
  MySharedPreferences _myPrefs = MySharedPreferences();
  String lanCode;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    //TODO: Guardar los ajustes de usuario como el idioma seleccionado,
    //inicialmente no habrá seleccionado ninguno y se ejecutará la siguiente línea)
    String jsonString;

    _myPrefs.initPreferences().then(
        (value) => {_myPrefs.myLanguage = 'es', lanCode = _myPrefs.myLanguage});

    lanCode = 'es';
    print("hola: " + lanCode);

    lanCode == ''
        ? jsonString =
            await rootBundle.loadString('lang/${locale.languageCode}.json')
        : jsonString = await rootBundle.loadString("lang/" + lanCode + ".json");

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key];
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
