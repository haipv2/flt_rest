import 'dart:async';
import 'package:flt_rest/commons/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _storageKey = 'Appli_';
const String _defaultLanguage = 'en';
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
Preferences preferences = Preferences();

class Preferences {
  // generic routine to fetch a preference
  Future<String> _getAppSavedInfo(String name) async {
    final SharedPreferences prefs = await _prefs;
    var result = prefs.getString(_storageKey + name) ?? '';
    return result;
  }

  //generic routine to save
  Future<bool> _setApplicationSavedInfo(String name, String value) async {
    final SharedPreferences prefs = await _prefs;
    var result = prefs.setString(_storageKey + name, value);
    return result;
  }

  // save/restore the preferred language
  getPreferredLanguage() async {
    var result = _getAppSavedInfo('language');
    return result;
  }

  setPreferredLanguage(String lang) async {
    var result = _setApplicationSavedInfo('language', lang);
    return result;
  }

  //get seen
  Future<bool> getBool(String seen) async{
    final SharedPreferences prefs = await _prefs;
    bool result =  prefs.getBool(SEEN);
    return result;

  }

  Future<bool> setPreferredBool(String key, bool value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setBool('key', value);
  }

  String get defaultLanguage => _defaultLanguage;

  //SINGLETON
  static final Preferences _preferences = Preferences._internal();

  factory Preferences() {
    return _preferences;
  }

  Preferences._internal();

}
