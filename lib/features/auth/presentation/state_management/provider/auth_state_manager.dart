import 'package:barcode_system_app/features/auth/data/models/auth_models/user_login_request_model.dart';
import 'package:barcode_system_app/features/auth/data/models/auth_models/user_register_request_model.dart';
import 'package:barcode_system_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthState {
  initial,
  authenticated,
  unauthenticated,
}

class AuthNotifier extends StateNotifier<AuthState> {
  final IAuthRepository _repository;

  AuthNotifier(this._repository) : super(AuthState.initial) {
    checkLoginStatus(); // Başlangıçta login durumunu kontrol et
  }

  // Giriş yapma
  Future<void> signIn(UserLoginRequestModel userLoginRequestModel) async {
    try {
      final result = await _repository.signIn(userLoginRequestModel);
      state = result ? AuthState.authenticated : AuthState.unauthenticated;
    } catch (e) {
      state = AuthState.unauthenticated;
      rethrow; // Diğer tüm hataları ilet
    }
  }

  // Kayıt olma
  Future<void> signUp(UserRegisterRequestModel userRegisterRequestModel) async {
    try {
      final result = await _repository.signUp(userRegisterRequestModel);
      state = result ? AuthState.authenticated : AuthState.unauthenticated;
    } catch (e) {
      state = AuthState.unauthenticated;
      rethrow; // Diğer tüm hataları ilet
    }
  }

  // Çıkış yapma
  Future<void> signOut() async {
    try {
      await _repository.signOut();
      state = AuthState.unauthenticated;
    } catch (e) {
      rethrow; // Diğer tüm hataları ilet
    }
  }

  // Giriş durumunu kontrol etme
  Future<void> checkLoginStatus() async {
    try {
      bool isLoggedIn = await _repository.isSignedIn();
      if (isLoggedIn) {
        state = AuthState.authenticated;
      } else {
        state = AuthState.unauthenticated;
      }
    } catch (e) {
      state = AuthState.unauthenticated;
      rethrow; // Diğer tüm hataları ilet
    }
  }
}
