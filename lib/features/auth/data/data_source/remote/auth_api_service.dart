import 'dart:async';
import 'package:barcode_system_app/core/constants/urls/urls.dart';
import 'package:barcode_system_app/features/auth/data/data_source/remote/abstract_auth_api_service.dart';
import 'package:barcode_system_app/features/auth/data/models/user_register_request_model.dart';
import 'package:dio/dio.dart';

class AuthApiServiceImpl extends IAuthApiService {
  final Dio _dio;

  AuthApiServiceImpl(this._dio);

  @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
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
        return false;
      }
    } on DioException catch (dioError) {
      throw Exception('Dio error occurred: ${dioError.message}');
    } catch (e) {
      throw Exception('Unexpected error occurred: $e');
    }
  }
}
