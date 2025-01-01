import 'package:barcode_system_app/core/exceptions/error_handler.dart';
import 'package:barcode_system_app/core/extensions/snack_bar_extension.dart';
import 'package:barcode_system_app/core/routes/route_names.dart';
import 'package:barcode_system_app/features/auth/data/models/auth_models/user_register_model.dart';
import 'package:barcode_system_app/features/auth/presentation/state_management/provider/auth_state_manager.dart';
import 'package:barcode_system_app/features/auth/presentation/state_management/provider/auth_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin RegisterScreenMixin {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  void disposeControllers() {
    emailController.dispose();
    nameController.dispose();
    surnameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
  }

  signUp(BuildContext context, WidgetRef ref) async {
    try {
      // Yükleniyor durumunu aktif et
      ref.read(isLoadingProvider.notifier).state = true;
      var userRegisterRequestModel = UserRegisterModel(
          name: nameController.text,
          surname: surnameController.text,
          phone: phoneController.text,
          eposta: emailController.text,
          password: passwordController.text);
      // Auth işlemi
      final authNotifier = ref.read(authProvider.notifier);
      await authNotifier.signUp(userRegisterRequestModel);

      // Eğer giriş başarılıysa yönlendirme yap
      if (ref.watch(authProvider) == AuthState.authenticated) {
        emailController.clear();
        passwordController.clear();
        context.showSnackBar('Kayıt başarılı');
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
