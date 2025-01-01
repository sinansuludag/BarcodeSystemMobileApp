import 'package:barcode_system_app/features/addUpdateProduct/data/data_source/remote/add_update_product_api_services/abstract_add_update_product_service.dart';
import 'package:barcode_system_app/features/addUpdateProduct/data/models/product_add_update_model.dart';
import 'package:barcode_system_app/features/addUpdateProduct/domain/repository/add_update_product_repository.dart';

class AddUpdateProductRepositoryImpl extends IAddUpdateProductRepository {
  final IAddUpdateProductApiService _addUpdateProductApiService;

  AddUpdateProductRepositoryImpl(this._addUpdateProductApiService);

  @override
  Future<bool> add(AddUpdateProductModel addUpdateProductModel) async {
    try {
      // API servisinden gelen sonucu bekliyoruz
      bool result =
          await _addUpdateProductApiService.add(addUpdateProductModel);
      return result; // API'den gelen sonucu geri döndürüyoruz
    } catch (e) {
      print('AddUpdateProductRepositoryImpl sayfasınabak');
      rethrow;
    }
  }

  @override
  Future<List<String>> getProductGroups() async {
    try {
      return await _addUpdateProductApiService.fetchProductGroups();
    } catch (e) {
      throw Exception('Failed to load product groups: $e');
    }
  }

  @override
  Future<bool> getOneProduct() {
    // TODO: implement getOneProduct
    throw UnimplementedError();
  }

  @override
  Future<List<AddUpdateProductModel>> list() {
    // TODO: implement list
    throw UnimplementedError();
  }

  @override
  Future<bool> update(AddUpdateProductModel addUpdateProductModel) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(AddUpdateProductModel addUpdateProductModel) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
