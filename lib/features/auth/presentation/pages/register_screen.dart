import 'package:barcode_system_app/core/common_widgets/custom_text_form_field.dart';
import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/constants/strings/tr_strings.dart';
import 'package:barcode_system_app/core/extensions/build_context_extension.dart';
import 'package:barcode_system_app/core/mixins/register_screen_mixin.dart';
import 'package:barcode_system_app/core/routes/route_names.dart';
import 'package:barcode_system_app/core/utils/validator/email_validator.dart';
import 'package:barcode_system_app/core/utils/validator/name_validator.dart';
import 'package:barcode_system_app/core/utils/validator/password_validator.dart';
import 'package:barcode_system_app/core/utils/validator/phone_validator.dart';
import 'package:barcode_system_app/core/utils/validator/surname_validator.dart';
import 'package:barcode_system_app/features/auth/data/models/auth_models/user_register_request_model.dart';
import 'package:barcode_system_app/features/auth/domain/repository/auth_repository.dart';
import 'package:barcode_system_app/features/auth/presentation/state_management/provider/auth_state_manager.dart';
import 'package:barcode_system_app/features/auth/presentation/state_management/provider/auth_state_provider.dart';
import 'package:barcode_system_app/service_locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen>
    with RegisterScreenMixin {
  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      child: loginTitleText(context),
                    ),
                    nameTextFormField(context),
                    SizedBox(
                      height: MediaQuerySize(context).percent2Height,
                    ),
                    surnameTextFormField(context),
                    SizedBox(
                      height: MediaQuerySize(context).percent2Height,
                    ),
                    phoneTextFormField(context),
                    SizedBox(
                      height: MediaQuerySize(context).percent2Height,
                    ),
                    emailTextFormField(context),
                    SizedBox(
                      height: MediaQuerySize(context).percent2Height,
                    ),
                    passwordTextFormField(context),
                    SizedBox(
                      height: MediaQuerySize(context).percent3Height,
                    ),
                    signUpElevatedButton(context),
                    SizedBox(
                      height: MediaQuerySize(context).percent2Height,
                    ),
                    signInElevatedButton(context),
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
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          try {
            // Yükleniyor durumunu aktif et
            ref.read(isLoadingProvider.notifier).state = true;
            var userRegisterRequestModel = UserRegisterRequestModel(
                name: nameController.text,
                surname: surnameController.text,
                phone: phoneController.text,
                eposta: emailController.text,
                password: passwordController.text);
            // Auth işlemi
            final authNotifier = ref.read(authProvider.notifier);
            await authNotifier.signUp(userRegisterRequestModel);

            // Eğer giriş başarılıysa yönlendirme yap
            if (ref.watch(authProvider) == AuthState.authenticated) {
              emailController.clear();
              passwordController.clear();
              Navigator.pushReplacementNamed(context, RouteNames.home);
            } else {
              throw Exception();
            }
          } catch (e) {
            // Hata tipi kontrolü
          } finally {
            // Yükleniyor durumunu pasif et
            ref.read(isLoadingProvider.notifier).state = false;
          }
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
