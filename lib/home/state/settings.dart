import 'package:f_voz/home/utils/dark_theme.dart';
import 'package:flutter/widgets.dart';

class SettingState extends ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  set isDarkMode(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    darkThemePreference.setDarkMode(isDarkMode);
    notifyListeners();
  }

  toggleDarkMode() {
    isDarkMode = !isDarkMode;
  }
}
