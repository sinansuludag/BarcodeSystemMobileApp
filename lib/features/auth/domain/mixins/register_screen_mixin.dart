import 'package:barcode_system_app/common_widgets/custom_text_form_field.dart';
import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/constants/strings/tr_strings.dart';
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

  Widget loginTitleText(
      BuildContext context, TextTheme textTheme, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTitle(textTheme, colorScheme, TrStrings.splashTitleText1,
            colorScheme.onSurface),
        SizedBox(width: MediaQuerySize(context).percent5Width),
        buildTitle(textTheme, colorScheme, TrStrings.splashTitleText2,
            colorScheme.error),
      ],
    );
  }

  Text buildTitle(
      TextTheme textTheme, ColorScheme colorScheme, String text, Color color) {
    return Text(
      text,
      style: textTheme.headlineLarge?.copyWith(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  CustomTextFormField nameTextFormField(ColorScheme colorScheme) {
    return CustomTextFormField(
      controller: nameController,
      prefixIcon: prefixIconDecoration(colorScheme, const Icon(Icons.person)),
      labelText: TrStrings.labelName,
      hintText: TrStrings.hintTextName,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: NameValidator.nameValidate,
    );
  }

  CustomTextFormField surnameTextFormField(ColorScheme colorScheme) {
    return CustomTextFormField(
      controller: surnameController,
      prefixIcon: prefixIconDecoration(
          colorScheme, const Icon(Icons.supervised_user_circle)),
      labelText: TrStrings.labelSurname,
      hintText: TrStrings.hintTextSurname,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: SurnameValidator.surnameValidate,
    );
  }

  CustomTextFormField phoneTextFormField(ColorScheme colorScheme) {
    return CustomTextFormField(
      suffixIcon: const Icon(Icons.phone),
      prefixIcon:
          prefixIconDecoration(colorScheme, const Icon(Icons.phone_android)),
      controller: phoneController,
      labelText: TrStrings.labelPhone,
      hintText: TrStrings.hintTextPhone,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      validator: PhoneNumberValidator.phoneNumberValidate,
    );
  }

  CustomTextFormField emailTextFormField(ColorScheme colorScheme) {
    return CustomTextFormField(
      controller: emailController,
      prefixIcon:
          prefixIconDecoration(colorScheme, const Icon(Icons.email_outlined)),
      labelText: TrStrings.labelEmail,
      hintText: TrStrings.hintTextEmail,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: EmailValidator.emailValidate,
    );
  }

  CustomTextFormField passwordTextFormField(ColorScheme colorScheme) {
    return CustomTextFormField(
      controller: passwordController,
      prefixIcon: prefixIconDecoration(colorScheme, const Icon(Icons.key)),
      labelText: TrStrings.labelPassword,
      hintText: TrStrings.labelPassword,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: PasswordValidator.passwordValidate,
      isPassword: true,
    );
  }

  ElevatedButton signInElevatedButton(
      ColorScheme colorScheme, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, RouteNames.login);
      },
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
        minimumSize: Size(MediaQuerySize(context).percent60Width,
            MediaQuerySize(context).percent10Width),
        shape: const StadiumBorder(),
      ),
      child: const Text(TrStrings.signIn),
    );
  }

  ElevatedButton signUpElevatedButton(
    ColorScheme colorScheme,
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
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        minimumSize: Size(MediaQuerySize(context).percent60Width,
            MediaQuerySize(context).percent12Width),
        shape: const StadiumBorder(),
      ),
      child: const Text(TrStrings.signUp),
    );
  }

  Padding prefixIconDecoration(ColorScheme colorScheme, Icon icon) {
    return Padding(
        padding: AppPaddings.allLowPadding,
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.secondary,
            borderRadius: AppBorderRadius.lowBorderRadius,
          ),
          child: icon,
        ));
  }
}
