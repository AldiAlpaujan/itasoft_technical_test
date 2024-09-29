import 'package:itasoft_technical_test/helper/dialog.dart';
import 'package:itasoft_technical_test/helper/global_var.dart';
import 'package:itasoft_technical_test/model/user.dart';
import 'package:itasoft_technical_test/model/warehouse.dart';
import 'package:itasoft_technical_test/services/api/api_helper.dart';
import 'package:itasoft_technical_test/services/api/api_service.dart';

class UserData {
  static Future<bool> login(String username, String password) async {
    final response = await ApiService.post(
      url + loginUrl,
      data: setFormData({"j_username": username, "j_password": password}),
    );
    var success = await manageResponse(response);
    if (success) {
      final data = getDataResponse(response);
      user = User.fromJson(data);
      user.warehouses = await getUserWarehouses();
      success = user.warehouses != null && user.warehouses!.isNotEmpty;
      if (!success) info(message: 'Data gudang user terkait tidak Ditemukan');
    }
    return success;
  }

  static Future<List<Warehouse>?> getUserWarehouses() async {
    final response = await ApiService.get(
      url + warehouseUrl,
      queryParameters: {"user_name": user.username},
    );
    final success = await manageResponse(response, error: false);
    if (success) {
      final data = getDataResponse(response)['data'] as List<dynamic>;
      return data.map((e) => Warehouse.fromJson(e)).toList();
    }
    return null;
  }
}
