import 'package:barcode_system_app/features/auth/data/models/auth_models/user_login_model.dart';
import 'package:barcode_system_app/features/auth/data/models/auth_models/user_register_model.dart';

abstract class IAuthApiService {
  Future<bool> signIn(UserLoginModel userLoginModel);
  Future<bool> signUp(UserRegisterModel userRegisterModel);
  Future<bool> signOut();
}
