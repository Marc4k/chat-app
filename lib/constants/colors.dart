import 'package:flutter/material.dart';

class CustomColors {
  static Color brandDarkColor = const Color(0xFF001A83);
  static Color brandDefault = const Color(0xFF002DE3);
  static Color brandDarkMode = const Color(0xFF375FFF);
  static Color brandLight = const Color(0xFF879FFF);
  static Color brandBg = const Color(0xFFD2D5F9);

  static Color textColorLightMode = const Color(0xFF0F1828);

  static Color textColor = const Color(0xFF0F1828);
  static Color textColorDarkMode = const Color(0xFFF7F7FC);
}

class ColorChance {
  Color getBackgroundColor() {
    final darkMode = WidgetsBinding.instance.window.platformBrightness;
    if (darkMode == Brightness.dark) {
      return Color(0xFF0F1828);
    } else {
      return Colors.white;
    }
  }

  Color getTextColor() {
    final darkMode = WidgetsBinding.instance.window.platformBrightness;
    if (darkMode == Brightness.dark) {
      return CustomColors.textColorDarkMode;
    } else {
      return CustomColors.textColorLightMode;
    }
  }
}
