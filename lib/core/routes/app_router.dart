import 'package:barcode_system_app/core/routes/route_names.dart';
import 'package:barcode_system_app/features/addUpdateProduct/presentation/add_update_product_screen.dart';
import 'package:barcode_system_app/features/auth/presentation/forget_password_screen.dart';
import 'package:barcode_system_app/features/auth/presentation/login_screen.dart';
import 'package:barcode_system_app/features/auth/presentation/register_screen.dart';
import 'package:barcode_system_app/features/home/home_screen.dart';
import 'package:barcode_system_app/features/makeSale/presentation/make_sale_screen.dart';
import 'package:barcode_system_app/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:barcode_system_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case RouteNames.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case RouteNames.onBoarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouteNames.makeSale:
        return MaterialPageRoute(builder: (_) => MakeSaleScreen());
      case RouteNames.addUpdateProduct:
        return MaterialPageRoute(builder: (_) => AddUpdateProductScreen());

      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
