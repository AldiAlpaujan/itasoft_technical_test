import 'package:itasoft_technical_test/helper/global_var.dart';
import 'package:itasoft_technical_test/model/product.adjustment.dart';
import 'package:itasoft_technical_test/model/product.dart';
import 'package:itasoft_technical_test/model/product.detail.dart';
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

  static Future<List<ProductAdjustment>> getProductAdjustments({
    required int page,
    required int pageSize,
    required String search,
  }) async {
    final offset = (page - 1) * pageSize;
    final response = await ApiService.get(
      url + productAdjustmentUrl,
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
      return data.map((e) => ProductAdjustment.fromJson(e)).toList();
    }
    return [];
  }

  static Future<ProductDetail?> getSingle(String id) async {
    final response = await ApiService.get(
      '$url$productDetailUrl/$id',
    );
    final success = await manageResponse(response);
    if (success) {
      final data = getDataResponse(response);
      return ProductDetail.fromJson(data);
    }
    return null;
  }

  static Future<bool> adjustmentStock(ProductDetail data) async {
    final response = await ApiService.post(
      url + productAdjustmentStockUrl,
      data: {
        "id_barang": data.id,
        "expired": data.expired.toString(),
        "createdByName": data.createdByName,
        "image": data.image,
        "gudang": data.gudang,
        "kategori": data.kategori,
        "dateModified": data.dateModified.toString(),
        "stok": data.stok,
        "dateCreated": data.dateCreated.toString(),
        "modifiedByName": data.modifiedByName,
        "createdBy": data.createdBy,
        "modifiedBy": data.modifiedBy,
        "nama_barang": data.namaBarang,
      },
    );
    final success = await manageResponse(response);
    return success;
  }
}
