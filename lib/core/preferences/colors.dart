import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();
  // ------------------------------------------------- //
  // Color's pallete from https://materialui.co/colors/
  // ------------------------------------------------- //

  static const primary = MaterialColor(0xFF6C5ECF, {
    100: Color(0xFFD1C4E9),
    300: Color(0xFF9575CD),
    500: Color(0xFF6C5ECF),
    700: Color(0xFF512DA8),
    900: Color(0xFF311B92),
  });

  static const secondary = MaterialColor(0xFF38ABBE, {
    100: Color(0xFFB2EBF2),
    300: Color(0xFF4DD0E1),
    500: Color(0xFF38ABBE),
    700: Color(0xFF0097A7),
    900: Color(0xFF006064),
  });

  static const alert = MaterialColor(0xFFED6363, {
    100: Color(0xFFFFCDD2),
    300: Color(0xFFE57373),
    500: Color(0xFFED6363),
    700: Color(0xFFD32F2F),
    900: Color(0xFFB71C1C),
  });

  static const blue = MaterialColor(0xFF2C96F1, {
    100: Color(0xFFBBDEFB),
    300: Color(0xFF64B5F6),
    500: Color(0xFF2C96F1),
    700: Color(0xFF1976D2),
    900: Color(0xFF0D47A1),
  });

  static const dark = MaterialColor(0xFF1F1D2B, {
    100: Color(0xFF2B2937),
    300: Color(0xFF242231),
    500: Color(0xFF1F1D2B),
    700: Color(0xFF424242),
    900: Color(0xFF212121),
  });

  static const light = MaterialColor(0xFFE1E1E1, {
    100: Color(0xFFFAFAFA),
    300: Color(0xFFF5F5F5),
    500: Color(0xFFE1E1E1),
    700: Color(0xFFE0E0E0),
    900: Color(0xFF999999),
  });
}
