import 'package:barcode_system_app/common_widgets/custom_text_form_field.dart';
import 'package:barcode_system_app/common_widgets/social_card.dart';
import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/constants/strings/tr_strings.dart';
import 'package:barcode_system_app/core/extensions/assets_path_extension.dart';
import 'package:barcode_system_app/core/extensions/build_context_extension.dart';
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

  Widget loginTitleText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        titleText(
          context,
          TrStrings.splashTitleText1,
          context.colorScheme.onSurface,
        ),
        SizedBox(width: MediaQuerySize(context).percent5Width),
        titleText(
          context,
          TrStrings.splashTitleText2,
          context.colorScheme.error,
        ),
      ],
    );
  }

  Text titleText(
    BuildContext context,
    String text,
    Color color,
  ) {
    return Text(
      text,
      style: context.textTheme.headlineLarge?.copyWith(
        color: color,
        fontWeight: FontWeight.bold,
      ),
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

  ElevatedButton signInElevatedButton(
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
        backgroundColor: context.colorScheme.primary,
        foregroundColor: context.colorScheme.onPrimary,
        minimumSize: Size(MediaQuerySize(context).percent60Width,
            MediaQuerySize(context).percent12Width),
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
        Navigator.pushNamed(context, RouteNames.register);
      },
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: context.colorScheme.secondary,
        foregroundColor: context.colorScheme.primary,
        minimumSize: Size(MediaQuerySize(context).percent60Width,
            MediaQuerySize(context).percent10Width),
        shape: const StadiumBorder(),
      ),
      child: const Text(TrStrings.signUp),
    );
  }

  TextButton forgetPasswordTextButton(
    BuildContext context,
  ) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, RouteNames.forgetPassword);
      },
      child: Text(
        TrStrings.forgetPassword,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onSecondary,
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
