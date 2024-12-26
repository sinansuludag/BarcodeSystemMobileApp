import 'package:barcode_system_app/features/auth/data/models/user_register_request_model.dart';

abstract class IAuthRepository {
  Future<void> signInWithGoogle();
  Future<void> signInWithFacebook();
  Future<void> signIn(String email, String password);
  Future<bool> signUp(UserRegisterRequestModel userRequestModel);
  Future<void> signOut();
  Future<bool> isSignedIn();
}
