import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  SharedPreferences _prefs;

  Future initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    return true;
  }

  set myLanguage(String language) => _prefs.setString('language', language);

  String get myLanguage =>
      _prefs.containsKey('language') ? _prefs.getString('language') : '';
}
