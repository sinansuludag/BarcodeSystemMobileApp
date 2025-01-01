import 'dart:async';
import 'package:barcode_system_app/core/constants/urls/urls.dart';
import 'package:barcode_system_app/features/auth/data/data_source/remote/auth_api_services/abstract_auth_api_service.dart';
import 'package:barcode_system_app/features/auth/data/models/auth_models/user_login_model.dart';
import 'package:barcode_system_app/features/auth/data/models/auth_models/user_register_model.dart';
import 'package:dio/dio.dart';

class AuthApiServiceImpl extends IAuthApiService {
  final Dio _dio;

  AuthApiServiceImpl(this._dio);

  @override
  Future<bool> signIn(UserLoginModel userLoginModel) async {
    final String url = '${Urls.kullanici.path}/KullaniciList';
    try {
      // Tüm kullanıcı listesini getir
      final response = await _dio.get(
        url,
      );

      if (response.statusCode == 200) {
        return _isUserValid(response, userLoginModel);
      } else {
        throw Exception('Failed to fetch user list');
      }
    } on DioException catch (dioError) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<bool> signUp(UserRegisterModel userRegisterModel) async {
    final String url = '${Urls.kullanici.path}/KullaniciAdd';
    try {
      final response = await _dio.post(
        url,
        data: userRegisterModel.toJson(),
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

  bool _isUserValid(Response<dynamic> response, UserLoginModel userLoginModel) {
    final List<dynamic> userList = response.data;
    final List<UserLoginModel> users =
        userList.map((user) => UserLoginModel.fromJson(user)).toList();

    // Eposta ve şifre eşleşmesi kontrolü
    final isMatching = users.any(
      (user) =>
          user.eposta == userLoginModel.eposta &&
          user.password == userLoginModel.password,
    );
    return isMatching;
  }
}
