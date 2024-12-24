import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/theme/color_scheme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Icon? suffixIcon;
  final int? maxLines;
  final Widget? prefixIcon;
  final bool? filled;
  final InputBorder? border;
  final bool? enabled;
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
    this.border,
    this.enabled,
    this.maxLines,
    this.prefixIcon,
    this.validator,
    this.filled,
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
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        filled: widget.filled ?? true,
        enabled: widget.enabled ?? true,
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
        border: widget.border ??
            OutlineInputBorder(
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
      maxLines: widget.maxLines ?? 1,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
    );
  }
}
