import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/constants/strings/tr_strings.dart';
import 'package:barcode_system_app/core/routes/route_names.dart';
import 'package:barcode_system_app/features/auth/domain/mixins/login_screen_mixin.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with LoginScreenMixin {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        title: Text(
          TrStrings.forgetPasswordScreenTitle,
          style: TextStyle(color: colorScheme.onSecondary),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: AppPaddings.horizontalSimetricDefaultPadding,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: MediaQuerySize(context).percent4Height),
                  Text(
                    TrStrings.forgetPasswordScreenTitle,
                    style: textTheme.headlineMedium,
                  ),
                  SizedBox(height: MediaQuerySize(context).percent2Height),
                  Text(
                    TrStrings.forgetPasswordScreenText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colorScheme.onSecondary),
                  ),
                  SizedBox(height: MediaQuerySize(context).percent10Height),
                  emailTextFormField(colorScheme),
                  SizedBox(height: MediaQuerySize(context).percent10Height),
                  signInElevatedButton(colorScheme, context),
                  SizedBox(height: MediaQuerySize(context).percent10Height),
                  NoAccountTextButton(colorScheme)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget NoAccountTextButton(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          TrStrings.fogetPasswordScreenNoAccountText,
          style: TextStyle(color: colorScheme.onSecondary.withAlpha(180)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteNames.register);
          },
          child: Text(
            TrStrings.signUp,
            style: TextStyle(
              color: colorScheme.error,
            ),
          ),
        ),
      ],
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
          print('Email: ${emailController.text}');
          emailController.clear();
          Navigator.pushNamed(context, RouteNames.login);
        }
      },
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        minimumSize: Size(MediaQuerySize(context).percent80Width,
            MediaQuerySize(context).percent12Width),
        shape: const StadiumBorder(),
      ),
      child: const Text(TrStrings.forgetPasswordScreenButtonText),
    );
  }
}
