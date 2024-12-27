import 'package:barcode_system_app/core/common_widgets/custom_text_form_field.dart';
import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/constants/strings/tr_strings.dart';
import 'package:barcode_system_app/core/extensions/build_context_extension.dart';
import 'package:barcode_system_app/core/routes/route_names.dart';
import 'package:barcode_system_app/core/utils/validator/email_validator.dart';
import 'package:barcode_system_app/core/utils/validator/name_validator.dart';
import 'package:barcode_system_app/core/utils/validator/password_validator.dart';
import 'package:barcode_system_app/core/utils/validator/phone_validator.dart';
import 'package:barcode_system_app/core/utils/validator/surname_validator.dart';
import 'package:barcode_system_app/features/auth/data/models/auth_models/user_register_request_model.dart';
import 'package:barcode_system_app/features/auth/domain/repository/auth_repository.dart';
import 'package:barcode_system_app/service_locator.dart';
import 'package:flutter/material.dart';

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
}
