import 'dart:convert';
import 'package:barcode_system_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:barcode_system_app/features/auth/data/models/auth_models/user_register_model.dart';
import 'package:barcode_system_app/features/auth/data/data_source/local/auth_local_services/abstract_local_service.dart';

class LocalStorageServiceImpl implements ILocalStorageService {
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _userKey = 'user';

  @override
  Future<bool> isLoggedIn() async {
    final prefs = locator<SharedPreferences>();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  @override
  Future<void> setLoggedIn(bool value) async {
    final prefs = locator<SharedPreferences>();
    await prefs.setBool(_isLoggedInKey, value);
  }

  @override
  Future<void> setUser(UserRegisterModel user) async {
    final prefs = locator<SharedPreferences>();
    String userJson =
        json.encode(user.toJson()); // User modelini JSON formatında kaydet
    await prefs.setString(_userKey, userJson);
  }

  @override
  Future<UserRegisterModel?> getUser() async {
    final prefs = locator<SharedPreferences>();
    String? userJson = prefs.getString(_userKey);

    if (userJson != null) {
      return UserRegisterModel.fromJson(json.decode(userJson));
    }
    return null; // Eğer kullanıcı yoksa null döndür
  }
}
