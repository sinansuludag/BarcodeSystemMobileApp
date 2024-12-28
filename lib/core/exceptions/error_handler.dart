// core/exceptions/error_handler.dart
import 'app_exceptions.dart';
import 'package:dio/dio.dart';

class ErrorHandler {
  static AppException handleException(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return NetworkException('Bağlantı zaman aşımına uğradı.');

        case DioExceptionType.badResponse:
          switch (error.response?.statusCode) {
            case 400:
              return ApiException('Geçersiz istek.', code: 400);
            case 401:
              return UnauthorizedException('Yetkisiz erişim.', code: 401);
            case 404:
              return ApiException('Kaynak bulunamadı.', code: 404);
            case 500:
              return ApiException('Sunucu hatası.', code: 500);
            default:
              return ApiException('Bilinmeyen bir hata oluştu.');
          }

        case DioExceptionType.cancel:
          return GeneralException('İstek iptal edildi.');

        case DioExceptionType.unknown:
        default:
          return GeneralException('Bilinmeyen bir hata oluştu.');
      }
    } else if (error is AppException) {
      return error; // Zaten bir özel hata ise direkt döndür
    } else {
      return GeneralException('Beklenmeyen bir hata oluştu.');
    }
  }
}
