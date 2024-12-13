import 'package:barcode_system_app/core/routes/app_router.dart';
import 'package:barcode_system_app/core/theme/color_scheme.dart';
import 'package:barcode_system_app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Durum çubuğunu özelleştiriyoruz
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Durum çubuğunu şeffaf yapıyoruz
        statusBarIconBrightness:
            Brightness.dark, // Durum çubuğu simgelerini koyu yapıyoruz
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: CustomColorScheme.lightColorScheme,
        textTheme: AppTextTheme.lightTextTheme,
      ),
      darkTheme: ThemeData(
        colorScheme: CustomColorScheme.darkColorScheme,
        textTheme: AppTextTheme.darkTextTheme,
      ),
      themeMode: ThemeMode.light,
      onGenerateRoute: AppRouter.generateRoute, // Rota yöneticisini kullan
      initialRoute: '/', // Başlangıç rotası
    );
  }
}
