import 'package:barcode_system_app/features/auth/data/data_source/local/auth_local_services/abstract_local_service.dart';
import 'package:barcode_system_app/features/auth/data/data_source/local/auth_local_services/shared_preferences_service.dart';
import 'package:barcode_system_app/features/auth/data/data_source/remote/auth_api_services/abstract_auth_api_service.dart';
import 'package:barcode_system_app/features/auth/data/data_source/remote/auth_api_services/auth_api_service.dart';
import 'package:barcode_system_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/data/repository/auth_repository.dart';

final locator = GetIt.instance;

void setupLocator() {
  //IAuthRepository
  locator.registerLazySingleton<IAuthRepository>(() => AuthRepositoryImpl(
      locator<IAuthApiService>(), locator<ILocalStorageService>()));
  //IAuthApiService
  locator.registerLazySingleton<IAuthApiService>(
      () => AuthApiServiceImpl(locator<Dio>()));
  //Dio
  locator.registerLazySingleton<Dio>(() {
    final dio = Dio();
    return dio;
  });
  //ILocaleStorageService
  locator.registerLazySingleton<ILocalStorageService>(
      () => LocalStorageServiceImpl());
}
