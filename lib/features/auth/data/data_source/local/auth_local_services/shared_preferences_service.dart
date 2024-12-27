import 'package:barcode_system_app/features/auth/data/data_source/local/auth_local_services/abstract_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServiceImpl implements ILocalStorageService {
  static const String _isLoggedInKey = 'isLoggedIn';

  @override
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  @override
  Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, value);
  }
}
