import 'package:barcode_system_app/features/addUpdateProduct/data/data_source/remote/add_update_product_api_services/abstract_add_update_product_service.dart';
import 'package:barcode_system_app/features/addUpdateProduct/data/repository/add_update_product_repository.dart';
import 'package:barcode_system_app/features/addUpdateProduct/presentation/state_management/provider/product_group_notifier.dart';
import 'package:barcode_system_app/features/addUpdateProduct/presentation/state_management/provider/product_state_manager.dart';
import 'package:barcode_system_app/features/addUpdateProduct/presentation/state_management/provider/product_unit_notifier.dart';
import 'package:barcode_system_app/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider =
    StateNotifierProvider<AddUpdateProductNotifier, ProductState>((ref) {
  final productApiService = ref.watch(_productApiServiceProvider);
  final productRepository = AddUpdateProductRepositoryImpl(productApiService);
  return AddUpdateProductNotifier(productRepository);
});

final _productApiServiceProvider = Provider<IAddUpdateProductApiService>((ref) {
  return locator<IAddUpdateProductApiService>();
});

final productBarcodeProvider = StateProvider<String>(
  (ref) {
    return '';
  },
);

final productGroupProvider =
    StateNotifierProvider<ProductGroupNotifier, List<String>>(
  (ref) {
    final productApiService = ref.watch(_productApiServiceProvider);
    final productRepository = AddUpdateProductRepositoryImpl(productApiService);
    return ProductGroupNotifier(repository: productRepository);
  },
);

final productUnitProvider =
    StateNotifierProvider<ProductUnitNotifier, List<String>>(
        (ref) => ProductUnitNotifier());

final selectedGroupProvider = StateProvider<String>((ref) => 'Grupsuz ürün');
final selectedUnitProvider = StateProvider<String>((ref) => 'Adet');

final productAmountProvider = StateProvider<double>((ref) => 0.0);
