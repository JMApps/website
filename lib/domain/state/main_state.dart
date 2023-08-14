import 'package:flutter/material.dart';

class MainState extends ChangeNotifier {
  bool _darkThemeState = false;

  bool get getDarkThemeState => _darkThemeState;

  set setDarkThemeState(bool state) {
    _darkThemeState = state;
    notifyListeners();
  }

  Color _mainColor = const Color(0xFF3F51B5);

  Color get getMainColor => _mainColor;

  set setMainColor(Color value) {
    _mainColor = value;
    notifyListeners();
  }
}
