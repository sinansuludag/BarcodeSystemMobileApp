import 'package:flutter/material.dart';

class CustomColorScheme extends ColorScheme {
  final Color success; // Başarı ve onay mesajı rengi
  final Color borders; // Çizgi ve sınır rengi
  final Color secondaryText; // İkinci metin rengi
  final Color cardBackground; // Kart ve içerik kutuları arka plan rengi

  const CustomColorScheme({
    required Brightness themeMode, // Tema modu (ışık/koyu)
    required Color backgroundColor, // Arka plan rengi
    required Color
        cardBackgroundColor, // Kart ve içerik kutuları arka plan rengi
    required Color mainTextColor, // Ana metin rengi
    required Color secondaryTextColor, // İkinci metin rengi
    required Color primaryButtonBackground, // Ana buton arka plan rengi
    required Color primaryButtonTextColor, // Ana buton metin rengi
    required Color secondaryButtonBackground, // İkinci buton arka plan rengi
    required Color secondaryButtonTextColor, // İkinci buton metin rengi
    required Color errorColor, // Hata mesajı rengi
    required Color errorTextColor, // Hata metni rengi
    required this.success,
    required this.borders,
    required this.secondaryText,
    required this.cardBackground,
  }) : super(
          brightness: themeMode,
          primary: primaryButtonBackground, // Ana buton arka plan rengi
          onPrimary: primaryButtonTextColor, // Ana buton metin rengi
          secondary: secondaryButtonBackground, // İkinci buton arka plan rengi
          onSecondary: secondaryButtonTextColor, // İkinci buton metin rengi
          surface: backgroundColor, // Arka plan rengi
          onSurface: mainTextColor, // Ana metin rengi
          error: errorColor, // Hata mesajı rengi
          onError: errorTextColor, // Hata metni rengi
        );

  static const lightColorScheme = CustomColorScheme(
    themeMode: Brightness.light,
    backgroundColor: Color(0xFFF5F5F5), // Arka plan rengi
    cardBackgroundColor:
        Color(0xFFFFFFFF), // Kart ve içerik kutuları arka plan rengi
    mainTextColor: Color(0xFF2D3748), // Ana metin rengi
    secondaryTextColor: Color(0xFF718096), // İkinci metin rengi
    primaryButtonBackground: Color(0xFF3B82F6), // Ana buton arka plan rengi
    primaryButtonTextColor: Color(0xFFFFFFFF), // Ana buton metin rengi
    secondaryButtonBackground:
        Color(0xFFE2E8F0), // İkinci buton arka plan rengi
    secondaryButtonTextColor: Color(0xFF2D3748), // İkinci buton metin rengi
    errorColor: Color(0xFFE53E3E), // Hata mesajı rengi
    errorTextColor: Color(0xFFFFFFFF), // Hata metni rengi
    success: Color(0xFF81C784), // Başarı ve onay mesajı rengi
    borders: Color(0xFFCBD5E0), // Çizgi ve sınır rengi
    secondaryText: Color(0xFF718096), // İkinci metin rengi (tekrar tanımlandı)
    cardBackground:
        Color(0xFFFFFFFF), // Kart ve içerik kutuları (tekrar tanımlandı)
  );

  static const darkColorScheme = CustomColorScheme(
    themeMode: Brightness.dark,
    backgroundColor: Color(0xFF1A202C), // Koyu tema arka plan rengi
    cardBackgroundColor: Color(0xFF2D3748), // Koyu tema kart arka plan rengi
    mainTextColor: Color(0xFFFFFFFF), // Koyu tema ana metin rengi
    secondaryTextColor: Color(0xFFCBD5E0), // Koyu tema ikinci metin rengi
    primaryButtonBackground: Color(0xFF3B82F6), // Ana buton arka plan rengi
    primaryButtonTextColor: Color(0xFFFFFFFF), // Ana buton metin rengi
    secondaryButtonBackground:
        Color(0xFFE2E8F0), // İkinci buton arka plan rengi
    secondaryButtonTextColor: Color(0xFF2D3748), // İkinci buton metin rengi
    errorColor: Color(0xFFE53E3E), // Hata mesajı rengi
    errorTextColor: Color(0xFFFFFFFF), // Hata metni rengi
    success: Color(0xFF81C784), // Başarı ve onay mesajı rengi
    borders: Color(0xFF718096), // Koyu tema çizgi ve sınır rengi
    secondaryText:
        Color(0xFFCBD5E0), // Koyu tema ikinci metin rengi (tekrar tanımlandı)
    cardBackground:
        Color(0xFF2D3748), // Koyu tema kart arka plan (tekrar tanımlandı)
  );
}
