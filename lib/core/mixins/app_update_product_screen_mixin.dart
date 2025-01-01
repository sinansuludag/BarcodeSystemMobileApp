import 'package:flutter/material.dart';

mixin AppUpdateProductScreenMixin {
  final formKey = GlobalKey<FormState>();
  final barkodController = TextEditingController();
  final productNameController = TextEditingController();
  final purchasePriceController = TextEditingController();
  final sellPriceController = TextEditingController();
  final kdvRatioController = TextEditingController();
  final productDetailsController = TextEditingController();
  final kdvPriceController = TextEditingController();
  final amountController = TextEditingController();

  void disposeControllers() {
    amountController.dispose();
    kdvPriceController.dispose();
    barkodController.dispose();
    productNameController.dispose();
    purchasePriceController.dispose();
    sellPriceController.dispose();
    kdvRatioController.dispose();
    productDetailsController.dispose();
  }
}
