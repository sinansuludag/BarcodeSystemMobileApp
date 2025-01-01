import 'package:barcode_system_app/features/addUpdateProduct/domain/repository/add_update_product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductGroupNotifier extends StateNotifier<List<String>> {
  final IAddUpdateProductRepository repository;

  ProductGroupNotifier({required this.repository}) : super([]) {
    fetchProductGroups(); // İlk başta verileri çek
  }

  Future<void> fetchProductGroups() async {
    try {
      final groups = await repository.getProductGroups();
      state = groups; // "Grupsuz ürün" ekleniyor
    } catch (e) {
      print('Hata: $e');
      state = []; // Hata durumunda sadece "Grupsuz ürün" gösterilir
    }
  }
}
