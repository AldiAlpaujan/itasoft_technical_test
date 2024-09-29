import 'package:itasoft_technical_test/helper/global_var.dart';
import 'package:itasoft_technical_test/model/product.dart';
import 'package:itasoft_technical_test/services/api/api_helper.dart';
import 'package:itasoft_technical_test/services/api/api_service.dart';

class ProductData {
  static Future<List<Product>> get({
    required int page,
    required int pageSize,
    required String search,
  }) async {
    final offset = (page - 1) * pageSize;
    final response = await ApiService.get(
      url + productUrl,
      queryParameters: {
        "pageSize": pageSize,
        "startOffset": offset,
        "d-1558783-fn_c_gudang": user.warehouse.warehouseCode,
        "c_nama_barang": search,
      },
    );
    final success = await manageResponse(response);
    if (success) {
      final data = getDataResponse(response)['data'] as List<dynamic>;
      return data.map((e) => Product.fromJson(e)).toList();
    }
    return [];
  }

  static Future<Product?> getSingle(String id) async {
    return null;
  }
}
