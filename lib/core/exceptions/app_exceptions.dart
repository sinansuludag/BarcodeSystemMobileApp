// core/exceptions/app_exceptions.dart
abstract class AppException implements Exception {
  final String message;
  final int? code;

  AppException(this.message, {this.code});

  @override
  String toString() => 'Hata: $message (Kod: $code)';
}

/// API'den gelen hatalar için
class ApiException extends AppException {
  ApiException(String message, {int? code}) : super(message, code: code);
}

/// Yetkisiz erişim hataları için
class UnauthorizedException extends AppException {
  UnauthorizedException(String message, {int? code})
      : super(message, code: code);
}

/// Ağ bağlantısı hataları için
class NetworkException extends AppException {
  NetworkException(String message, {int? code}) : super(message, code: code);
}

/// Genel hatalar için
class GeneralException extends AppException {
  GeneralException(String message, {int? code}) : super(message, code: code);
}
