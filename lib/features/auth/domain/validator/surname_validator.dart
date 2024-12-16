import 'package:barcode_system_app/core/constants/strings/tr_strings.dart';

class SurnameValidator {
  SurnameValidator._();
  static String? surnameValidate(value) {
    if (value == null || value.isEmpty) {
      return TrStrings.requiredSurname;
    }
    return null;
  }
}
