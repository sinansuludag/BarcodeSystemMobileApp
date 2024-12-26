import 'package:barcode_system_app/features/auth/data/data_source/remote/abstract_auth_api_service.dart';
import 'package:barcode_system_app/features/auth/data/models/user_register_request_model.dart';
import 'package:barcode_system_app/features/auth/domain/repository/auth_repository.dart';
import 'package:barcode_system_app/service_locator.dart';

class AuthRepositoryImpl extends IAuthRepository {
  final IAuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<bool> isSignedIn() {
    // TODO: implement isSignedIn
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<bool> signUp(UserRegisterRequestModel userRequestModel) async {
    try {
      // API servisinden gelen sonucu bekliyoruz
      bool result = await _authApiService.signUp(userRequestModel);
      return result; // API'den gelen sonucu geri döndürüyoruz
    } catch (e) {
      print('Error during signUp in repository: $e');
      return false;
    }
  }
}
