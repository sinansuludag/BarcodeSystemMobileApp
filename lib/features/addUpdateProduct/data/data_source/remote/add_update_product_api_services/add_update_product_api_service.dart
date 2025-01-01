// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barcode_system_app/core/constants/urls/urls.dart';
import 'package:barcode_system_app/features/addUpdateProduct/data/data_source/remote/add_update_product_api_services/abstract_add_update_product_service.dart';
import 'package:barcode_system_app/features/addUpdateProduct/data/models/product_add_update_model.dart';
import 'package:dio/dio.dart';

class AddUpdateProductApiServiceImpl extends IAddUpdateProductApiService {
  final Dio _dio;
  AddUpdateProductApiServiceImpl(
    this._dio,
  );

  @override
  Future<bool> add(AddUpdateProductModel addUpdateProductModel) async {
    final String url = '${Urls.urun.path}/UrunAdd';
    try {
      final response = await _dio.post(
        url,
        data: addUpdateProductModel.toJson(),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        print('AddUpdateProductApiServiceImpl sayfasınabak');
        throw Exception('Failed to add product');
      }
    } on DioException catch (dioError) {
      print('Hata kodu: ${dioError.response?.statusCode}');
      print('Hata mesajı: ${dioError.response?.data}');
      print('Headers: ${dioError.response?.headers}');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<String>> fetchProductGroups() async {
    final String url = '${Urls.urunGrup.path}/UrunGrupList';
    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is List) {
          // `urunGrupAd` değerlerini çıkarıyoruz
          return data.map((e) => e['urunGrupAd'] as String).toList();
        } else {
          throw Exception('Unexpected data structure: $data');
        }
      } else {
        throw Exception('Failed to fetch product groups');
      }
    } on DioException catch (dioError) {
      print('Hata kodu: ${dioError.response?.statusCode}');
      print('Hata mesajı: ${dioError.response?.data}');
      rethrow;
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
