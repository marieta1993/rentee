import 'package:rentee/config/shared/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Preferences._();

  static SharedPreferences? _sharedPreferences;

  static Future<void> sharedPreferences() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  static Future<void> setFirstLaunch(bool newValue) async {
    _sharedPreferences?.setBool(PreferencesKeys.firstLaunch, newValue);
  }

  static bool? get getFirstLaunch =>
      _sharedPreferences?.getBool(PreferencesKeys.firstLaunch);
}
