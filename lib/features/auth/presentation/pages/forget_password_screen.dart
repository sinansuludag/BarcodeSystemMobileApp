import 'package:barcode_system_app/core/common_widgets/custom_text_form_field.dart';
import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/constants/strings/tr_strings.dart';
import 'package:barcode_system_app/core/extensions/build_context_extension.dart';
import 'package:barcode_system_app/core/mixins/forget_password_mixin.dart';
import 'package:barcode_system_app/core/routes/route_names.dart';
import 'package:barcode_system_app/core/utils/validator/email_validator.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with ForgetPasswordMixin {
  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

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

  ElevatedButton signInElevatedButton(
    BuildContext context,
  ) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          signIn(context);
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
