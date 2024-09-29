import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itasoft_technical_test/helper/global_var.dart';
import 'package:itasoft_technical_test/pages/dashboard/dashboard.controller.dart';
import 'package:itasoft_technical_test/theme/theme.dart';
import 'package:itasoft_technical_test/widget/app_custom_appbar.dart';
import 'package:itasoft_technical_test/widget/app_logout.dart';
import 'package:itasoft_technical_test/widget/app_product_card_skeleton.dart';
import 'package:itasoft_technical_test/widget/app_text_field_input.dart';
import 'package:itasoft_technical_test/widget/app_user_header.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppCustomAppBar(
        title: "Dashboard",
        showLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppTheme.padding),
            child: AppLogout(),
          ),
        ],
      ),
      body: ListView(
        controller: controller.scrollC,
        padding: const EdgeInsets.all(AppTheme.padding),
        children: [
          const AppUserHeader(),
          warehouseCard(),
          filter(),
          productList(),
        ],
      ),
    );
  }

  Widget warehouseCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppTheme.primaryColor.withOpacity(.1),
            ),
            child: Text(
              user.warehouse.initial,
              style: const TextStyle(
                fontSize: 16,
                color: AppTheme.primaryColor,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.warehouse.warehouseName),
                const Text(
                  "Makanan, Minuman, Stationary, Meidicine",
                  style: TextStyle(fontSize: 12, color: AppTheme.capColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget filter() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Expanded(
            child: AppTextFieldInput(
              hintText: "Pencarian...",
              controller: controller.searchC,
            ),
          ),
          const SizedBox(width: 8),
          // TODO: sesuaikan bagian ini
          const Expanded(
            child: AppTextFieldInput(
              hintText: "Pencarian...",
            ),
          ),
        ],
      ),
    );
  }

  Widget productList() {
    return GridView(
      shrinkWrap: true,
      controller: controller.scrollC,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        mainAxisExtent: 50,
      ),
      children: [
        ...List.generate(20, (_) => const AppProductCardSkeleton()),
      ],
    );
  }
}
