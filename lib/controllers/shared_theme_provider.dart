import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static SharedPreferences? sharedPreferences;

  static initialize() async {
    if (sharedPreferences != null) {
      return sharedPreferences;
    }
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<Future<bool>> setthememode(bool themeMode) async {
    return sharedPreferences!.setBool('theme_mode', themeMode);
  }

  static bool get isDarkThemeMode =>
      sharedPreferences!.getBool('theme_mode') ?? false;
}

class SharedThemeProvider with ChangeNotifier {
  bool kThemeModeData = false;
  bool get isDarkThemeMode => kThemeModeData;
  set setDarkThemeMode(bool value) {
    kThemeModeData = value;
    SharedPreference.setthememode(value);
    notifyListeners();
  }
}
