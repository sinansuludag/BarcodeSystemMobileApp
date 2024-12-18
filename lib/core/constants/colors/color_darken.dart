import 'package:flutter/material.dart';

Color darkenColor(Color color, double amount) {
  // Color'ı HSLColor'a dönüştür
  final hsl = HSLColor.fromColor(color);

  // Lightness değerini azaltarak koyulaştırma
  final newLightness = (hsl.lightness - amount)
      .clamp(0.0, 1.0); // Lightness 0 ile 1 arasında olmalı
  final newColor = hsl.withLightness(newLightness);

  return newColor.toColor();
}
