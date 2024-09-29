import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itasoft_technical_test/pages/dashboard/dashboard.controller.dart';
import 'package:itasoft_technical_test/widget/app_custom_appbar.dart';
import 'package:itasoft_technical_test/widget/app_logout.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppCustomAppBar(
        title: "Dashboard",
        showLeading: false,
        actions: [
          AppLogout(),
          SizedBox(width: 16),
        ],
      ),
      body: Container(),
    );
  }
}
