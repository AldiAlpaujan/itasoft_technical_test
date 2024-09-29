import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itasoft_technical_test/helper/validator.dart';
import 'package:itasoft_technical_test/pages/login/login.controller.dart';
import 'package:itasoft_technical_test/widget/app_button.dart';
import 'package:itasoft_technical_test/widget/app_text_field_input.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Icon(
                      Icons.apple,
                      size: 80,
                      color: Color(0xFF4B5C6B),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: AppTextFieldInput(
                      label: "Username",
                      hintText: "Masukkan username",
                      controller: controller.usernameC,
                      validator: (v) => emptyValidator("Username", v!),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: AppTextFieldInput(
                      label: "Password",
                      hintText: "Masukkan password",
                      controller: controller.passwordC,
                      obscureText: true,
                      validator: (v) => emptyValidator("Password", v!),
                    ),
                  ),
                  Obx(
                    () => AppButton(
                      text: "Login",
                      onPressed: controller.login,
                      loading: controller.onSubmitLoading,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
