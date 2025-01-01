import 'package:barcode_system_app/features/auth/data/data_source/local/auth_local_services/abstract_local_service.dart';
import 'package:barcode_system_app/features/auth/data/data_source/remote/auth_api_services/abstract_auth_api_service.dart';
import 'package:barcode_system_app/features/auth/data/models/auth_models/user_login_model.dart';
import 'package:barcode_system_app/features/auth/data/models/auth_models/user_register_model.dart';
import 'package:barcode_system_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends IAuthRepository {
  final IAuthApiService _authApiService;
  final ILocalStorageService _localStorageService;

  AuthRepositoryImpl(this._authApiService, this._localStorageService);

  @override
  Future<bool> isSignedIn() {
    return _localStorageService.isLoggedIn();
  }

  @override
  Future<bool> signIn(UserLoginModel userLoginModel) async {
    try {
      bool result = await _authApiService.signIn(userLoginModel);
      if (result) {
        await _localStorageService.setLoggedIn(result);
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<bool> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    await _localStorageService.setLoggedIn(false);
  }

  @override
  Future<bool> signUp(UserRegisterModel userRegisterModel) async {
    try {
      // API servisinden gelen sonucu bekliyoruz
      bool result = await _authApiService.signUp(userRegisterModel);
      if (result) {
        await _localStorageService.setLoggedIn(result);
        await _localStorageService.setUser(userRegisterModel);
      }
      return result; // API'den gelen sonucu geri döndürüyoruz
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserRegisterModel?> getCurrentUser() async {
    try {
      final user = await _localStorageService.getUser();
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
