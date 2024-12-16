import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/features/auth/domain/mixins/register_screen_mixin.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with RegisterScreenMixin {
  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Ekrana tıklanırsa klavye kapanacak
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: AppPaddings.allDefaultPadding,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                .manual, // Klavye, ekranı sürüklediğinizde kapanır
            child: Form(
              key: formKey,
              child: Stack(children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuerySize(context).percent30Height,
                      child: loginTitleText(context, textTheme, colorScheme),
                    ),
                    nameTextFormField(colorScheme),
                    SizedBox(
                      height: MediaQuerySize(context).percent2Height,
                    ),
                    surnameTextFormField(colorScheme),
                    SizedBox(
                      height: MediaQuerySize(context).percent2Height,
                    ),
                    phoneTextFormField(colorScheme),
                    SizedBox(
                      height: MediaQuerySize(context).percent2Height,
                    ),
                    emailTextFormField(colorScheme),
                    SizedBox(
                      height: MediaQuerySize(context).percent2Height,
                    ),
                    passwordTextFormField(colorScheme),
                    SizedBox(
                      height: MediaQuerySize(context).percent3Height,
                    ),
                    signUpElevatedButton(colorScheme, context),
                    SizedBox(
                      height: MediaQuerySize(context).percent2Height,
                    ),
                    signInElevatedButton(colorScheme, context),
                    SizedBox(
                      height: MediaQuerySize(context).percent1Height,
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
