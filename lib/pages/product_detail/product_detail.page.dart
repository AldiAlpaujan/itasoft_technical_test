import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itasoft_technical_test/helper/formatter.dart';
import 'package:itasoft_technical_test/helper/global_var.dart';
import 'package:itasoft_technical_test/pages/product_detail/product_detail.controller.dart';
import 'package:itasoft_technical_test/theme/theme.dart';
import 'package:itasoft_technical_test/widget/app_custom_appbar.dart';
import 'package:itasoft_technical_test/widget/app_key_value_item.dart';
import 'package:itasoft_technical_test/widget/app_loading.dart';
import 'package:itasoft_technical_test/widget/app_logout.dart';
import 'package:itasoft_technical_test/widget/app_user_header.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppCustomAppBar(
        title: "Detail",
        showLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppTheme.padding),
            child: AppLogout(),
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.loading) return const AppLoading();
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppTheme.padding),
            child: Column(
              children: [
                const AppUserHeader(),
                headerCard(),
                imageCard(),
                AppKeyValueItem(
                  keyItem: "ID Gudang",
                  value: user.warehouse.warehouseCode,
                  padding: const EdgeInsets.only(top: 16, bottom: 12),
                ),
                AppKeyValueItem(
                  keyItem: "Nama Barang",
                  value: controller.product.namaBarang,
                  padding: const EdgeInsets.only(bottom: 12),
                ),
                AppKeyValueItem(
                  keyItem: "Exp Date",
                  value: dateFormatUI(controller.product.expired),
                  padding: const EdgeInsets.only(bottom: 12),
                ),
                AppKeyValueItem(
                  keyItem: "Quantity",
                  value: controller.product.stok,
                  padding: const EdgeInsets.only(bottom: 12),
                ),
                AppKeyValueItem(
                  keyItem: "Safety Stock",
                  value: controller.product.safetyStok,
                  padding: const EdgeInsets.only(bottom: 16),
                ),
                ElevatedButton(
                  onPressed: Get.back,
                  child: const Text("Kembali"),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget headerCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(controller.product.namaBarang),
            Text(
              "Kategori : ${controller.product.kategori}",
              style: const TextStyle(fontSize: 12, color: AppTheme.capColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageCard() {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: Image.network(
          controller.product.image,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            height: 30,
            width: 30,
            margin: const EdgeInsets.only(right: 6),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppTheme.primaryColor.withOpacity(.2),
            ),
            child: Text(
              controller.product.initial,
              style: const TextStyle(
                fontSize: 26,
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
