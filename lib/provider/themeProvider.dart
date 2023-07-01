import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum AppTheme { Light, Dark }

class ThemeProvider extends ChangeNotifier {
  AppTheme _currentTheme = AppTheme.Light;

  AppTheme get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme =
        _currentTheme == AppTheme.Light ? AppTheme.Dark : AppTheme.Light;
    notifyListeners();
  }
}
