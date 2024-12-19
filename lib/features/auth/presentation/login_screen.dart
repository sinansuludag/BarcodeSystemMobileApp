import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/features/auth/domain/mixins/login_screen_mixin.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginScreenMixin {
  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Klavye açıldığında ekranın boyutunun değiştirilmesini engeller
      body: GestureDetector(
        onTap: () {
          // Ekrana tıklanırsa klavye kapanacak
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: AppPaddings.allDefaultPadding,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                .onDrag, // Klavye, ekranı sürüklediğinizde kapanır
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuerySize(context).percent35Height,
                    child: loginTitleText(context),
                  ),
                  emailTextFormField(context),
                  SizedBox(
                    height: MediaQuerySize(context).percent2Height,
                  ),
                  passwordTextFormField(context),
                  SizedBox(
                    height: MediaQuerySize(context).percent3Height,
                  ),
                  signInElevatedButton(context),
                  SizedBox(
                    height: MediaQuerySize(context).percent1Height,
                  ),
                  signUpElevatedButton(context),
                  SizedBox(
                    height: MediaQuerySize(context).percent2Height,
                  ),
                  forgetPasswordTextButton(context),
                  SizedBox(
                    height: MediaQuerySize(context).percent1Height,
                  ),
                  socialButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
