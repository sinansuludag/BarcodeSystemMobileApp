import 'package:barcode_system_app/features/addUpdateProduct/domain/repository/add_update_product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductUnitNotifier extends StateNotifier<List<String>> {
  ProductUnitNotifier() : super(['Adet']) {
    fetchProductUnit(); // İlk başta verileri çek
  }

  List<String> get productGroups => ['Adet', 'Kg', 'Litre', 'Metre'];

  void fetchProductUnit() {
    try {
      final groups = productGroups;
      state = groups;
    } catch (e) {
      print('Hata: $e');
      state = [];
    }
  }
}
