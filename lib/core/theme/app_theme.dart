import 'package:flutter/material.dart';
import 'color_scheme.dart';
import 'text_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: CustomColorScheme.lightColorScheme,
    textTheme: AppTextTheme.lightTextTheme,
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: CustomColorScheme.darkColorScheme,
    textTheme: AppTextTheme.darkTextTheme,
    useMaterial3: true,
  );
}
