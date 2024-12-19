import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/constants/strings/tr_strings.dart';
import 'package:barcode_system_app/core/extensions/build_context_extension.dart';
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
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: context.colorScheme.surface,
        title: Text(
          TrStrings.forgetPasswordScreenTitle,
          style: TextStyle(color: context.colorScheme.onSecondary),
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
                    style: context.textTheme.headlineMedium
                        ?.copyWith(color: context.colorScheme.onSurface),
                  ),
                  SizedBox(height: MediaQuerySize(context).percent2Height),
                  Text(
                    TrStrings.forgetPasswordScreenText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: context.colorScheme.onSecondary),
                  ),
                  SizedBox(height: MediaQuerySize(context).percent10Height),
                  emailTextFormField(context),
                  SizedBox(height: MediaQuerySize(context).percent10Height),
                  signInElevatedButton(context),
                  SizedBox(height: MediaQuerySize(context).percent10Height),
                  noAccountTextButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget noAccountTextButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(TrStrings.fogetPasswordScreenNoAccountText,
            style: context.textTheme.bodyMedium
                ?.copyWith(color: context.colorScheme.onSecondary)),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteNames.register);
          },
          child: Text(
            TrStrings.signUp,
            style: TextStyle(
              color: context.colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }
}
