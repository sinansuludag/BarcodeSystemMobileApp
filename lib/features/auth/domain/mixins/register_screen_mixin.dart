import 'package:barcode_system_app/common_widgets/custom_text_form_field.dart';
import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/constants/strings/tr_strings.dart';
import 'package:barcode_system_app/core/extensions/build_context_extension.dart';
import 'package:barcode_system_app/core/routes/route_names.dart';
import 'package:barcode_system_app/features/auth/domain/validator/email_validator.dart';
import 'package:barcode_system_app/features/auth/domain/validator/name_validator.dart';
import 'package:barcode_system_app/features/auth/domain/validator/password_validator.dart';
import 'package:barcode_system_app/features/auth/domain/validator/phone_validator.dart';
import 'package:barcode_system_app/features/auth/domain/validator/surname_validator.dart';
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

  Widget loginTitleText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTitle(
            context, TrStrings.splashTitleText1, context.colorScheme.onSurface),
        SizedBox(width: MediaQuerySize(context).percent5Width),
        buildTitle(
            context, TrStrings.splashTitleText2, context.colorScheme.error),
      ],
    );
  }

  Text buildTitle(BuildContext context, String text, Color color) {
    return Text(
      text,
      style: context.textTheme.headlineLarge?.copyWith(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  CustomTextFormField nameTextFormField(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      prefixIcon: prefixIconDecoration(context, const Icon(Icons.person)),
      labelText: TrStrings.labelName,
      hintText: TrStrings.hintTextName,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: NameValidator.nameValidate,
    );
  }

  CustomTextFormField surnameTextFormField(BuildContext context) {
    return CustomTextFormField(
      controller: surnameController,
      prefixIcon: prefixIconDecoration(
          context, const Icon(Icons.supervised_user_circle)),
      labelText: TrStrings.labelSurname,
      hintText: TrStrings.hintTextSurname,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: SurnameValidator.surnameValidate,
    );
  }

  CustomTextFormField phoneTextFormField(BuildContext context) {
    return CustomTextFormField(
      suffixIcon: const Icon(Icons.phone),
      prefixIcon:
          prefixIconDecoration(context, const Icon(Icons.phone_android)),
      controller: phoneController,
      labelText: TrStrings.labelPhone,
      hintText: TrStrings.hintTextPhone,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      validator: PhoneNumberValidator.phoneNumberValidate,
    );
  }

  CustomTextFormField emailTextFormField(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      prefixIcon:
          prefixIconDecoration(context, const Icon(Icons.email_outlined)),
      labelText: TrStrings.labelEmail,
      hintText: TrStrings.hintTextEmail,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: EmailValidator.emailValidate,
    );
  }

  CustomTextFormField passwordTextFormField(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      prefixIcon: prefixIconDecoration(context, const Icon(Icons.key)),
      labelText: TrStrings.labelPassword,
      hintText: TrStrings.labelPassword,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: PasswordValidator.passwordValidate,
      isPassword: true,
    );
  }

  ElevatedButton signInElevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, RouteNames.login);
      },
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: context.colorScheme.secondary,
        foregroundColor: context.colorScheme.primary,
        minimumSize: Size(MediaQuerySize(context).percent60Width,
            MediaQuerySize(context).percent10Width),
        shape: const StadiumBorder(),
      ),
      child: const Text(TrStrings.signIn),
    );
  }

  ElevatedButton signUpElevatedButton(
    BuildContext context,
  ) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          print(
              'Name:${nameController.text} Surname: ${surnameController.text} Email:${emailController.text} phone: ${phoneController.text} password: ${passwordController.text}');
          Navigator.pushNamed(context, RouteNames.home);
        }
      },
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: context.colorScheme.primary,
        foregroundColor: context.colorScheme.onPrimary,
        minimumSize: Size(MediaQuerySize(context).percent60Width,
            MediaQuerySize(context).percent12Width),
        shape: const StadiumBorder(),
      ),
      child: const Text(TrStrings.signUp),
    );
  }

  Padding prefixIconDecoration(BuildContext context, Icon icon) {
    return Padding(
        padding: AppPaddings.allLowPadding,
        child: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            borderRadius: AppBorderRadius.lowBorderRadius,
          ),
          child: icon,
        ));
  }
}
