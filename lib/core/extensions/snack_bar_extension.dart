import 'package:flutter/material.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBar(String message,
      {Duration duration = const Duration(seconds: 3)}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
      ),
    );
  }
}
