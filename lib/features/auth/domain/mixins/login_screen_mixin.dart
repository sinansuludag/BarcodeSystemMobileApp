import 'package:barcode_system_app/common_widgets/custom_text_form_field.dart';
import 'package:barcode_system_app/common_widgets/social_card.dart';
import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/constants/strings/tr_strings.dart';
import 'package:barcode_system_app/core/extensions/assets_path_extension.dart';
import 'package:barcode_system_app/core/routes/route_names.dart';
import 'package:barcode_system_app/features/auth/domain/validator/email_validator.dart';
import 'package:barcode_system_app/features/auth/domain/validator/password_validator.dart';
import 'package:flutter/material.dart';

mixin LoginScreenMixin {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  Widget loginTitleText(
      TextTheme textTheme, ColorScheme colorScheme, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        titleText(
          textTheme,
          colorScheme,
          TrStrings.splashTitleText1,
          colorScheme.onSurface,
        ),
        SizedBox(width: MediaQuerySize(context).percent5Width),
        titleText(
          textTheme,
          colorScheme,
          TrStrings.splashTitleText2,
          colorScheme.error,
        ),
      ],
    );
  }

  Text titleText(
    TextTheme textTheme,
    ColorScheme colorScheme,
    String text,
    Color color,
  ) {
    return Text(
      text,
      style: textTheme.headlineLarge?.copyWith(
        color: color,
        fontWeight: FontWeight.bold,
      ),
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
    ColorScheme colorScheme,
    BuildContext context,
  ) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          FocusScope.of(context).unfocus();
          print(
              'Email: ${emailController.text}, Password: ${passwordController.text}');
          passwordController.clear();
          emailController.clear();
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
      child: const Text(TrStrings.signIn),
    );
  }

  ElevatedButton signUpElevatedButton(
    ColorScheme colorScheme,
    BuildContext context,
  ) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, RouteNames.register);
      },
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
        minimumSize: Size(MediaQuerySize(context).percent60Width,
            MediaQuerySize(context).percent10Width),
        shape: const StadiumBorder(),
      ),
      child: const Text(TrStrings.signUp),
    );
  }

  TextButton forgetPasswordTextButton(
    BuildContext context,
    ColorScheme colorScheme,
  ) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, RouteNames.forgetPassword);
      },
      child: Text(
        TrStrings.forgetPassword,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSecondary.withAlpha((255 * 0.8).toInt()),
            ),
      ),
    );
  }

  Widget socialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialCard(
          icon: Image.asset(
            'search'.png,
            fit: BoxFit.cover,
          ),
          press: () {
            print("Google login");
          },
        ),
        SocialCard(
          icon: Image.asset(
            'facebook'.png,
            fit: BoxFit.cover,
          ),
          press: () {
            print("Facebook login");
          },
        ),
      ],
    );
  }
}
