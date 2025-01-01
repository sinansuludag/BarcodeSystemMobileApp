import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:barcode_system_app/features/addUpdateProduct/domain/repository/add_update_product_repository.dart';
import 'package:barcode_system_app/features/addUpdateProduct/data/models/product_add_update_model.dart';

enum ProductState {
  initial,
  loading,
  success,
  failure,
}

class AddUpdateProductNotifier extends StateNotifier<ProductState> {
  final IAddUpdateProductRepository _repository;

  AddUpdateProductNotifier(this._repository) : super(ProductState.initial);

  // Ürün ekleme
  Future<void> addProduct(AddUpdateProductModel productModel) async {
    state = ProductState.loading;
    try {
      final result = await _repository.add(productModel);
      state = result ? ProductState.success : ProductState.failure;
    } catch (e) {
      print('AddUpdateProductNotifier sayfasına bak');
      state = ProductState.failure;
      rethrow;
    }
  }

  // Ürün güncelleme
  Future<void> updateProduct(AddUpdateProductModel productModel) async {
    state = ProductState.loading;
    try {
      final result = await _repository.update(productModel);
      state = result ? ProductState.success : ProductState.failure;
    } catch (e) {
      state = ProductState.failure;
      rethrow;
    }
  }

  // Ürün silme
  Future<void> deleteProduct(AddUpdateProductModel productModel) async {
    state = ProductState.loading;
    try {
      final result = await _repository.delete(productModel);
      state = result ? ProductState.success : ProductState.failure;
    } catch (e) {
      state = ProductState.failure;
      rethrow;
    }
  }

  // Ürünleri listeleme
  Future<List<AddUpdateProductModel>> fetchProducts() async {
    state = ProductState.loading;
    try {
      final products = await _repository.list();
      state = ProductState.success;
      return products;
    } catch (e) {
      state = ProductState.failure;
      rethrow;
    }
  }
}
