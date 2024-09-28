import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itasoft_technical_test/data/user.data.dart';
import 'package:itasoft_technical_test/helper/dialog.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();

  login() async {
    if (formKey.currentState!.validate()) {
      waitingDialog();
      final result = await UserData.login(usernameC.text, passwordC.text);
      Get.back();
    }
  }
}
