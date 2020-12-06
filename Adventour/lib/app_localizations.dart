import 'package:Adventour/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'dart:async';
import 'dart:convert';

class AppLocalizations {
  final Locale locale;

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
    String langString, jsonString;

    LanguageDialog.getLanguage().then((value) => langString);
    switch (langString) {
      case "lang/en.json":
        jsonString = await rootBundle.loadString(langString);
        break;
      case "lang/es.json":
        jsonString = await rootBundle.loadString(langString);
        break;
      default:
        jsonString =
            await rootBundle.loadString('lang/${locale.languageCode}.json');
    }

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
