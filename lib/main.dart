import 'package:barcode_system_app/app/my_app.dart';
import 'package:barcode_system_app/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}
