import 'package:barcode_system_app/features/auth/data/models/auth_models/user_login_request_model.dart';
import 'package:barcode_system_app/features/auth/data/models/auth_models/user_register_request_model.dart';

abstract class IAuthApiService {
  Future<bool> signIn(UserLoginRequestModel userLoginRequestModel);
  Future<bool> signUp(UserRegisterRequestModel userRegisterRequestModel);
  Future<bool> signOut();
}
