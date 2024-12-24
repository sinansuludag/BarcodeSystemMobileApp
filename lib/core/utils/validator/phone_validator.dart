import 'package:barcode_system_app/core/constants/strings/tr_strings.dart';

class PhoneNumberValidator {
  PhoneNumberValidator._();

  // Telefon numarası geçerliliği kontrolü
  static String? phoneNumberValidate(String? value) {
    if (value == null || value.isEmpty) {
      return TrStrings.requiredPhoneNumber;
    } else if (!_isValidPhoneNumber(value)) {
      return TrStrings.invalidPhoneNumber;
    }
    return null;
  }

  // Telefon numarasının geçerliliği için RegExp
  static bool _isValidPhoneNumber(String value) {
    // Türkiye'de telefon numaraları genellikle 10 hanelidir ve 5 ile başlar (örneğin: 05XX XXX XXXX)
    final regex = RegExp(r"^(05[0-9]{1}[0-9]{8})$");
    return regex.hasMatch(value);
  }
}
