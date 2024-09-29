import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itasoft_technical_test/pages/navigation/navigation.controller.dart';
import 'package:itasoft_technical_test/pages/navigation/widget/app_bottom_nav.dart';

class NavigationPage extends GetView<NavigationController> {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.page,
        bottomNavigationBar: AppBottomNav(
          menu: controller.pages,
          currentIndex: controller.current.value,
          onChanged: controller.onNavChanged,
        ),
      ),
    );
  }
}
