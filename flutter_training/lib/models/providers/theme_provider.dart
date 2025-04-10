import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(this._themeData);

  ThemeData get themeData => _themeData;

  void toggleTheme() async {
    _themeData = _themeData == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLightTheme", _themeData == ThemeData.light());
  }

  static Future<ThemeProvider> create() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLightTheme = prefs.getBool("isLightTheme") ?? false;
    print('light theme : $isLightTheme');
    return ThemeProvider(isLightTheme ? ThemeData.light() : ThemeData.dark());
  }
}
