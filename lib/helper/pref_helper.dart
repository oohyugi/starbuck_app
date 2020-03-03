import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static String PREF_USER = "PREF_USER";
  static String PREF_IS_USER_LOGGED_IN = "PREF_LOGIN";
  static String PREF_USER_NAME = "PREF_USERNAME";
  static String PREF_LOCATION = "PREF_LOCATION";

  static Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PREF_IS_USER_LOGGED_IN);
  }

  static Future<void> setUserLoggedIn(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(PREF_IS_USER_LOGGED_IN, isLoggedIn);
  }

  static Future<void> setUserPosition(Position position) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String pos = json.encode(position.toJson());
    return prefs.setString(PREF_LOCATION, pos);
  }

  static Future<Position> getUserPosition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Position.fromMap(json.decode(prefs.getString(PREF_LOCATION)));
  }
}
