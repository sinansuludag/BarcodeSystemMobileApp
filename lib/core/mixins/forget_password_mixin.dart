import 'package:barcode_system_app/core/routes/route_names.dart';
import 'package:flutter/material.dart';

mixin ForgetPasswordMixin {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  void disposeControllers() {
    emailController.dispose();
  }

  signIn(
    BuildContext context,
  ) {
    FocusScope.of(context).unfocus();
    print('Email: ${emailController.text}');
    emailController.clear();
    Navigator.pushNamed(context, RouteNames.home);
  }
}
