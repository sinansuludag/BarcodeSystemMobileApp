import 'package:barcode_system_app/features/auth/data/data_source/remote/abstract_auth_api_service.dart';
import 'package:barcode_system_app/features/auth/data/data_source/remote/auth_api_service.dart';
import 'package:barcode_system_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/data/repository/auth_repository.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(locator<IAuthApiService>()));
  locator.registerLazySingleton<IAuthApiService>(
      () => AuthApiServiceImpl(locator<Dio>()));
  locator.registerLazySingleton<Dio>(() {
    final dio = Dio(BaseOptions(
      baseUrl: "https://api.example.com", // API'nin temel URL'si
    ));
    return dio;
  });
}
