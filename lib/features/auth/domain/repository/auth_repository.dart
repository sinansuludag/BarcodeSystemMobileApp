import 'package:barcode_system_app/features/auth/data/models/auth_models/user_login_model.dart';
import 'package:barcode_system_app/features/auth/data/models/auth_models/user_register_model.dart';

abstract class IAuthRepository {
  Future<bool> signInWithGoogle();
  Future<bool> signInWithFacebook();
  Future<bool> signIn(UserLoginModel userLoginModel);
  Future<bool> signUp(UserRegisterModel userRegisterModel);
  Future<UserRegisterModel?> getCurrentUser();
  Future<void> signOut();
  Future<bool> isSignedIn();
}
