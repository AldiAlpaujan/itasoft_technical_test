import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itasoft_technical_test/data/user.data.dart';
import 'package:itasoft_technical_test/routes/app_pages.dart';

class LoginController extends GetxController {
  final _onSubmitLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();

  bool get onSubmitLoading => _onSubmitLoading.value;
  set onSubmitLoading(bool value) => _onSubmitLoading.value = value;

  login() async {
    if (formKey.currentState!.validate()) {
      onSubmitLoading = true;
      final result = await UserData.login(usernameC.text, passwordC.text);
      onSubmitLoading = false;
      if (result) {
        Get.offAllNamed(Routes.navigation);
      }
    }
  }
}
