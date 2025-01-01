import 'package:barcode_system_app/features/addUpdateProduct/data/models/product_add_update_model.dart';

abstract class IAddUpdateProductApiService {
  Future<bool> add(AddUpdateProductModel addUpdateProductModel);
  Future<bool> update(AddUpdateProductModel addUpdateProductModel);
  Future<List<AddUpdateProductModel>> list();
  Future<bool> delete(AddUpdateProductModel addUpdateProductModel);
  Future<bool> getOneProduct();
  Future<List<String>> fetchProductGroups();
}
