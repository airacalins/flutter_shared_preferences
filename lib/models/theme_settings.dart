// ignore_for_file: unused_element, prefer_conditional_assignment

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  accentColor: Colors.lightBlueAccent,
  scaffoldBackgroundColor: Colors.grey.shade100,
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  accentColor: Colors.lightBlueAccent,
  scaffoldBackgroundColor: Colors.black87,
);

class ThemeSettings with ChangeNotifier {
  bool _isDarkTheme = false;
  SharedPreferences? _preferences;

  bool get isDarkTheme => _isDarkTheme;

  ThemeSettings() {
    _loadSettingsFromPreps();
  }

  _initializePreps() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  _loadSettingsFromPreps() async {
    await _initializePreps();
    _isDarkTheme = _preferences?.getBool('isDarkTheme') ?? false;
    notifyListeners();
  }

  _saveSettingsToPrefs() async {
    await _initializePreps();
    _preferences?.setBool('darkTheme', _isDarkTheme);
  }

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    _saveSettingsToPrefs();
    notifyListeners();
  }
}
