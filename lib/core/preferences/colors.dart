import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();
  // ------------------------------------------------- //
  // Color's pallete from https://materialui.co/colors/
  // ------------------------------------------------- //

  static const primary = MaterialColor(0xFF6C5ECF, {
    100: Color(0xFFF5F5F5),
    300: Color(0xFFE0E0E0),
    500: Color(0xFF6C5ECF),
    700: Color(0xFF616161),
    900: Color(0xFF212121),
  });

  static const secondary = MaterialColor(0xFF38ABBE, {
    100: Color(0xFFB2DFDB),
    300: Color(0xFF4DB6AC),
    500: Color(0xFF38ABBE),
    700: Color(0xFF00796B),
    900: Color(0xFF004D40),
  });

  static const alert = MaterialColor(0xFFED6363, {
    100: Color(0xFFFFECB3),
    300: Color(0xFFFFD54F),
    500: Color(0xFFED6363),
    700: Color(0xFFFFA000),
    900: Color(0xFFFF6F00),
  });

  static const blue = MaterialColor(0xFF2C96F1, {
    100: Color(0xFFFFCDD2),
    300: Color(0xFFE57373),
    500: Color(0xFF2C96F1),
    700: Color(0xFFD32F2F),
    900: Color(0xFFB71C1C),
  });

  static const dark = MaterialColor(0xFF1F1D2B, {
    100: Color(0xFF242231),
    300: Color(0xFF2B2937),
    500: Color(0xFF1F1D2B),
    700: Color(0xFF303F9F),
    900: Color(0xFF1A237E),
  });

  static const light = MaterialColor(0xFFE1E1E1, {
    100: Color(0xFF242231),
    300: Color(0xFF2B2937),
    500: Color(0xFFE1E1E1),
    700: Color(0xFF303F9F),
    900: Color(0xFF999999),
  });
}
