import 'package:barcode_system_app/core/exceptions/error_handler.dart';
import 'package:barcode_system_app/core/extensions/snack_bar_extension.dart';
import 'package:barcode_system_app/core/routes/route_names.dart';
import 'package:barcode_system_app/features/auth/data/models/auth_models/user_login_request_model.dart';
import 'package:barcode_system_app/features/auth/presentation/state_management/provider/auth_state_manager.dart';
import 'package:barcode_system_app/features/auth/presentation/state_management/provider/auth_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin LoginScreenMixin {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  googleLogin() {
    print("Google login");
  }

  facebookLogin() {
    print("Facebook login");
  }

  signIn(BuildContext context, WidgetRef ref) async {
    FocusScope.of(context).unfocus();

    try {
      // Yükleniyor durumunu aktif et
      ref.read(isLoadingProvider.notifier).state = true;
      var userLoginModel = UserLoginModel(
          eposta: emailController.text, password: passwordController.text);
      // Auth işlemi
      final authNotifier = ref.read(authProvider.notifier);
      await authNotifier.signIn(userLoginModel);

      // Eğer giriş başarılıysa yönlendirme yap
      if (ref.watch(authProvider) == AuthState.authenticated) {
        emailController.clear();
        passwordController.clear();
        context.showSnackBar('Giriş başarılı');
        Navigator.pushReplacementNamed(context, RouteNames.home);
      } else {
        throw Exception();
      }
    } catch (e) {
      context.showSnackBar(ErrorHandler.handleException(e).toString());
    } finally {
      // Yükleniyor durumunu pasif et
      ref.read(isLoadingProvider.notifier).state = false;
    }
  }
}
