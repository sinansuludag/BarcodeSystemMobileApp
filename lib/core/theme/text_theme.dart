import 'package:barcode_system_app/core/constants/sizes/font_size.dart';
import 'package:barcode_system_app/core/theme/color_scheme.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static final defaultTextLightColor =
      CustomColorScheme.lightColorScheme.onSurface;
  static final defaultTextDarkColor =
      CustomColorScheme.lightColorScheme.onPrimary;

  static final lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
        fontSize: FontSizes.headlineLargeFontSize,
        fontWeight: FontWeight.bold,
        color: defaultTextLightColor),
    headlineMedium: TextStyle(
        fontSize: FontSizes.headlinemediumFontSize,
        fontWeight: FontWeight.w600,
        color: defaultTextLightColor),
    headlineSmall: TextStyle(
        fontSize: FontSizes.headlineSmallFontSize,
        fontWeight: FontWeight.w500,
        color: defaultTextLightColor),
    bodyLarge: TextStyle(
        fontSize: FontSizes.bodyLargeFontSize,
        fontWeight: FontWeight.normal,
        color: defaultTextLightColor),
    bodyMedium: TextStyle(
        fontSize: FontSizes.bodyMediumFontSize,
        fontWeight: FontWeight.normal,
        color: defaultTextLightColor),
    bodySmall: TextStyle(
        fontSize: FontSizes.bodySmallFontSize,
        fontWeight: FontWeight.normal,
        color: defaultTextLightColor),
  );

  static final darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
        fontSize: FontSizes.headlineLargeFontSize,
        fontWeight: FontWeight.bold,
        color: defaultTextDarkColor),
    headlineMedium: TextStyle(
        fontSize: FontSizes.headlinemediumFontSize,
        fontWeight: FontWeight.w600,
        color: defaultTextDarkColor),
    headlineSmall: TextStyle(
        fontSize: FontSizes.headlineSmallFontSize,
        fontWeight: FontWeight.w500,
        color: defaultTextDarkColor),
    bodyLarge: TextStyle(
        fontSize: FontSizes.bodyLargeFontSize,
        fontWeight: FontWeight.normal,
        color: defaultTextDarkColor),
    bodyMedium: TextStyle(
        fontSize: FontSizes.bodyMediumFontSize,
        fontWeight: FontWeight.normal,
        color: defaultTextDarkColor),
    bodySmall: TextStyle(
        fontSize: FontSizes.bodySmallFontSize,
        fontWeight: FontWeight.normal,
        color: defaultTextDarkColor),
  );
}
