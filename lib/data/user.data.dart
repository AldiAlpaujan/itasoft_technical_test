import 'package:itasoft_technical_test/helper/global_var.dart';
import 'package:itasoft_technical_test/model/user.dart';
import 'package:itasoft_technical_test/services/api/api_helper.dart';
import 'package:itasoft_technical_test/services/api/api_service.dart';

class UserData {
  static Future<bool> login(String username, String password) async {
    final response = await ApiService.post(
      url,
      data: setFormData({"j_username": username, "j_password": password}),
    );
    final success = await manageResponse(response);
    if (success) {
      final data = getDataResponse(response);
      user = User.fromJson(data);
    }
    return success;
  }
}
