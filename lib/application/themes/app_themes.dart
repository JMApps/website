import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFC5CAE9),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,
      backgroundColor: Color(0xFF3F51B5),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(const Color(0xFFC5CAE9)),
      trackColor: MaterialStateProperty.all(const Color(0xFF7084E3)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF191A36),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,
      backgroundColor: Color(0xFF0F0F2A),
    ),
  );
}

extension ColorSchemeS on ColorScheme {
  Color get mainAccentColor => brightness == Brightness.light
      ? const Color(0xFF3F51B5)
      : const Color(0xFF00C853);
}
