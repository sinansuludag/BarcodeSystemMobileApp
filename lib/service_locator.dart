import 'package:barcode_system_app/features/addUpdateProduct/data/data_source/remote/add_update_product_api_services/abstract_add_update_product_service.dart';
import 'package:barcode_system_app/features/addUpdateProduct/data/data_source/remote/add_update_product_api_services/add_update_product_api_service.dart';
import 'package:barcode_system_app/features/addUpdateProduct/data/repository/add_update_product_repository.dart';
import 'package:barcode_system_app/features/addUpdateProduct/domain/repository/add_update_product_repository.dart';
import 'package:barcode_system_app/features/auth/data/data_source/local/auth_local_services/abstract_local_service.dart';
import 'package:barcode_system_app/features/auth/data/data_source/local/auth_local_services/shared_preferences_service.dart';
import 'package:barcode_system_app/features/auth/data/data_source/remote/auth_api_services/abstract_auth_api_service.dart';
import 'package:barcode_system_app/features/auth/data/data_source/remote/auth_api_services/auth_api_service.dart';
import 'package:barcode_system_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/data/repository/auth_repository.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  //IAuthRepository
  locator.registerLazySingleton<IAuthRepository>(() => AuthRepositoryImpl(
      locator<IAuthApiService>(), locator<ILocalStorageService>()));
  //IAuthApiService
  locator.registerLazySingleton<IAuthApiService>(
      () => AuthApiServiceImpl(locator<Dio>()));
  //Dio
  locator.registerLazySingleton<Dio>(() {
    final dio = Dio(BaseOptions(
      headers: {
        'Content-Type': 'application/json',
      },
    ));
    return dio;
  });
  //ILocalStorageService
  locator.registerLazySingleton<ILocalStorageService>(
      () => LocalStorageServiceImpl());
  //IAddUpdateProductApiService
  locator.registerLazySingleton<IAddUpdateProductApiService>(
      () => AddUpdateProductApiServiceImpl(locator<Dio>()));
  //IAddUpdateProductRepository
  locator.registerLazySingleton<IAddUpdateProductRepository>(() =>
      AddUpdateProductRepositoryImpl(locator<IAddUpdateProductApiService>()));

  // SharedPreferences asenkron kaydediliyor
  final prefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => prefs);
}
