import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/theme/color_scheme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Icon? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    required this.keyboardType,
    required this.textInputAction,
    required this.controller,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        filled: true,
        fillColor: CustomColorScheme.lightColorScheme.cardBackground,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon ??
            (widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )
                : null),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: CustomColorScheme.lightColorScheme.borders),
          borderRadius: AppBorderRadius.highBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.highBorderRadius,
          borderSide:
              BorderSide(color: CustomColorScheme.lightColorScheme.borders),
        ),
      ),
      obscureText: widget.isPassword ? !_isPasswordVisible : false,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
    );
  }
}
