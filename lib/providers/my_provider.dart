import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  setLightTheme() {
    themeMode = ThemeMode.light;
    notifyListeners();
  }

  setDarkTheme() {
    themeMode = ThemeMode.dark;
    notifyListeners();
  }
}
