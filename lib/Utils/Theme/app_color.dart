import 'package:flutter/material.dart';

class AppColor {
  static LinearGradient primaryGradient = LinearGradient(
    colors: [primary, const Color(0xFF0F50C6)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static Color primary = const Color(0xFF416FDF);
  static Color primarySoft = const Color(0xFF548DF3);
  static Color primaryExtraSoft = const Color(0xFFEFF3FC);
  static Color secondary = const Color(0xFF1B1F24);
  static Color secondarySoft = const Color(0xFF9D9D9D);
  static Color secondaryExtraSoft = const Color(0xFFE9E9E9);
  static Color primaryText = Colors.black;
  static Color kBlack = Colors.black;
  static Color kWhite = Colors.white;
  static Color secondaryText = Colors.black.withOpacity(0.7);
  static Color error = const Color(0xFFD00E0E);
  static Color success = const Color(0xFF16AE26);
  static Color warning = const Color(0xFFEB8600);
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF416FDF),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF6EAEE7),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  background: Color(0xFFFCFDF6),
  onBackground: Color(0xFF1A1C18),
  shadow: Color(0xFF000000),
  outlineVariant: Color(0xFFC2C8BC),
  surface: Color(0xFFF9FAF3),
  onSurface: Color(0xFF1A1C18),
);

ThemeData appTheme = ThemeData(
  colorScheme: lightColorScheme,
  primaryColor: AppColor.primary,
  scaffoldBackgroundColor: lightColorScheme.background,
  cardColor: AppColor.error,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: lightColorScheme.onBackground),
    bodyMedium: TextStyle(color: lightColorScheme.onBackground),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primary,
      foregroundColor: lightColorScheme.onPrimary,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.primary,
    foregroundColor: lightColorScheme.onPrimary,
    elevation: 0,
  ),
);
