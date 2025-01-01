import 'package:barcode_system_app/features/auth/data/models/auth_models/user_register_model.dart';

abstract class ILocalStorageService {
  Future<void> setLoggedIn(bool value);
  Future<bool> isLoggedIn();
  Future<void> setUser(UserRegisterModel user);
  Future<UserRegisterModel?> getUser();
}
