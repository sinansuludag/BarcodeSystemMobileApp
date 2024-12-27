import 'dart:async';
import 'package:barcode_system_app/core/constants/urls/urls.dart';
import 'package:barcode_system_app/features/auth/data/data_source/remote/auth_api_services/abstract_auth_api_service.dart';
import 'package:barcode_system_app/features/auth/data/models/auth_models/user_login_request_model.dart';
import 'package:barcode_system_app/features/auth/data/models/auth_models/user_register_request_model.dart';
import 'package:dio/dio.dart';

class AuthApiServiceImpl extends IAuthApiService {
  final Dio _dio;

  AuthApiServiceImpl(this._dio);

  @override
  Future<bool> signIn(UserLoginRequestModel userLoginRequestModel) async {
    final String url = '${Urls.kullanici.path}/KullaniciList';
    try {
      // Tüm kullanıcı listesini getir
      final response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Kullanıcı listesini parse et
        final List<dynamic> userList = response.data;
        final List<UserLoginRequestModel> users = userList
            .map((user) => UserLoginRequestModel.fromJson(user))
            .toList();

        // Eposta ve şifre eşleşmesi kontrolü
        final isMatching = users.any(
          (user) =>
              user.eposta == userLoginRequestModel.eposta &&
              user.password == userLoginRequestModel.password,
        );

        if (isMatching) {
          // Kullanıcı bulunduysa giriş başarılı
          return true;
        } else {
          // Kullanıcı bulunamazsa hata fırlat
          throw Exception('Eposta veya şifre yanlış');
        }
      } else {
        throw Exception('Failed to fetch user list');
      }
    } on DioException catch (dioError) {
      // Dio hatalarını yönet
      rethrow;
    } catch (e) {
      // Diğer hataları yönet
      rethrow;
    }
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<bool> signUp(UserRegisterRequestModel userRequestModel) async {
    final String url = '${Urls.kullanici.path}/KullaniciAdd';
    try {
      final response = await _dio.post(
        url,
        data: userRequestModel.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Failed to register');
      }
    } on DioException catch (dioError) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
