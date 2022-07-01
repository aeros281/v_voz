import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const darkModeKey = 'IS_DARK_MODE';

  setDarkMode(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(darkModeKey, isDarkMode);
  }

  Future<bool> isDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(darkModeKey) ?? false;
  }
}
