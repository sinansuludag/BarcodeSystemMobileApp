import 'package:flutter/material.dart';

mixin AppUpdateProductScreenMixin {
  final formKey = GlobalKey<FormState>();
  final barkodController = TextEditingController();
  final productNameController = TextEditingController();
  final salePriceController = TextEditingController();
  final purchasePriceController = TextEditingController();
  final profitRatioController = TextEditingController();
  final kdvRatioController = TextEditingController();
  final productDetailsController = TextEditingController();

  void disposeControllers() {
    barkodController.dispose();
    productNameController.dispose();
    salePriceController.dispose();
    purchasePriceController.dispose();
    profitRatioController.dispose();
    kdvRatioController.dispose();
    productDetailsController.dispose();
  }
}
