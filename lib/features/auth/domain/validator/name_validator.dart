import 'package:barcode_system_app/core/constants/strings/tr_strings.dart';

class NameValidator {
  NameValidator._();
  static String? nameValidate(value) {
    if (value == null || value.isEmpty) {
      return TrStrings.requiredName;
    }
    return null;
  }
}
