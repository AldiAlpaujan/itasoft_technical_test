import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itasoft_technical_test/helper/dialog.dart';
import 'package:itasoft_technical_test/helper/global_var.dart';
import 'package:itasoft_technical_test/routes/app_pages.dart';

class AppLogout extends StatefulWidget {
  const AppLogout({super.key});

  @override
  State<AppLogout> createState() => _AppLogoutState();
}

class _AppLogoutState extends State<AppLogout> {
  logout() {
    confirm(
      message: "Apakah Anda yakin ingin keluar?",
      onOk: () {
        Get.offAllNamed(Routes.login);
        user = null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: logout,
      child: Container(
        color: Colors.transparent,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: const Text(
          "Logout",
          style: TextStyle(
            color: Colors.red,
            decoration: TextDecoration.underline,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
