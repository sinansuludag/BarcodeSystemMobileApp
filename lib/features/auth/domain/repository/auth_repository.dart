import 'package:barcode_system_app/features/auth/data/models/auth_models/user_login_request_model.dart';
import 'package:barcode_system_app/features/auth/data/models/auth_models/user_register_request_model.dart';

abstract class IAuthRepository {
  Future<bool> signInWithGoogle();
  Future<bool> signInWithFacebook();
  Future<bool> signIn(UserLoginModel userLoginModel);
  Future<bool> signUp(UserRegisterModel userRegisterModel);
  Future<void> signOut();
  Future<bool> isSignedIn();
}
