import 'package:barcode_system_app/features/auth/data/data_source/local/auth_local_services/abstract_local_service.dart';
import 'package:barcode_system_app/features/auth/data/data_source/remote/auth_api_services/abstract_auth_api_service.dart';
import 'package:barcode_system_app/features/auth/data/repository/auth_repository.dart';
import 'package:barcode_system_app/features/auth/domain/repository/auth_repository.dart';
import 'package:barcode_system_app/features/auth/presentation/state_management/provider/auth_state_manager.dart';
import 'package:barcode_system_app/service_locator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  final localStorageService =
      ref.watch(localStorageServiceProvider); // Local servis
  final authRepository =
      AuthRepositoryImpl(authService, localStorageService); // Repository

  // Repository doğrudan AuthNotifier'a enjekte edildi
  return AuthNotifier(authRepository);
});

final localStorageServiceProvider = Provider<ILocalStorageService>((ref) {
  return locator<
      ILocalStorageService>(); // LocalStorageService örneği burada sağlanır
});

final authServiceProvider = Provider<IAuthApiService>((ref) {
  return locator<IAuthApiService>();
});

final isLoadingProvider = StateProvider<bool>((ref) => false);
