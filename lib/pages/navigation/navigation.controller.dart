import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itasoft_technical_test/pages/adjustment/adjustment.page.dart';
import 'package:itasoft_technical_test/pages/dashboard/dashboard.page.dart';

class NavigationController extends GetxController {
  final current = 0.obs;
  final pages = <Map<String, dynamic>>[
    {
      'icon': Icons.dashboard,
      'title': 'Dashboard',
      "page": const DashboardPage(),
    },
    {
      'icon': Icons.edit_document,
      'title': 'Adjustment',
      "page": const AdjustmentPage(),
    },
  ];

  Widget get page => pages[current.value]["page"];

  onNavChanged(int index) => current.value = index;
}
