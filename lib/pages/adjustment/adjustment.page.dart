import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itasoft_technical_test/enum/sort_filter.enum.dart';
import 'package:itasoft_technical_test/pages/adjustment/adjustment.controller.dart';
import 'package:itasoft_technical_test/theme/theme.dart';
import 'package:itasoft_technical_test/widget/app_custom_appbar.dart';
import 'package:itasoft_technical_test/widget/app_data_not_found.dart';
import 'package:itasoft_technical_test/widget/app_logout.dart';
import 'package:itasoft_technical_test/widget/app_product_card_skeleton.dart';
import 'package:itasoft_technical_test/widget/app_smart_refresh.dart';
import 'package:itasoft_technical_test/widget/app_text_field_input.dart';
import 'package:itasoft_technical_test/widget/app_user_header.dart';
import 'package:itasoft_technical_test/widget/app_warehouse_card.dart';

class AdjustmentPage extends GetView<AdjustmentController> {
  const AdjustmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppCustomAppBar(
        title: "Adjustment",
        showLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppTheme.padding),
            child: AppLogout(),
          ),
        ],
      ),
      body: Obx(
        () => AppSmartRefresh(
          noData: controller.lastPage,
          onLoading: controller.onLoad,
          onRefresh: controller.onRefresh,
          child: CustomScrollView(
            controller: controller.scrollC,
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(height: AppTheme.padding),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppTheme.padding),
                  child: AppUserHeader(),
                ),
              ),
              const SliverToBoxAdapter(child: AppWarehouseCard()),
              SliverToBoxAdapter(child: filter()),
              if (controller.products.isEmpty && !controller.loading)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: AppDataNotFound(),
                )
              else
                SliverToBoxAdapter(child: productList())
            ],
          ),
        ),
      ),
    );
  }

  Widget filter() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
        right: AppTheme.padding,
        left: AppTheme.padding,
      ),
      child: Row(
        children: [
          Expanded(
            child: Obx(
              () => AppTextFieldInput(
                hintText: "Pencarian...",
                controller: controller.searchC,
                suffixIcon: controller.showSearchClose
                    ? IconButton(
                        onPressed: () => controller.searchC.text = "",
                        icon: const Icon(Icons.close_rounded),
                      )
                    : null,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: expiredFilter()),
        ],
      ),
    );
  }

  Widget expiredFilter() {
    return GestureDetector(
      onTap: controller.changeSortFilter,
      child: Container(
        height: 47,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppTheme.textFieldBorderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 14),
            const Expanded(child: Text("Exp Date")),
            Obx(
              () {
                switch (controller.sortFilter) {
                  case SortFilter.asc:
                    return const Icon(
                      Icons.arrow_drop_up_rounded,
                      color: AppTheme.capColor,
                    );
                  case SortFilter.desc:
                    return const Icon(
                      Icons.arrow_drop_down_rounded,
                      color: AppTheme.capColor,
                    );
                  default:
                    return const Icon(
                      Icons.more_horiz,
                      color: AppTheme.capColor,
                    );
                }
              },
            ),
            const SizedBox(width: 8),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }

  Widget productList() {
    return Obx(
      () => GridView(
        shrinkWrap: true,
        controller: controller.scrollC,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.padding),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          mainAxisExtent: 50,
        ),
        children: [
          if (controller.loading)
            ...List.generate(20, (_) => const AppProductCardSkeleton())
          // else
          //   ...controller.products.map(
          //     (e) => GestureDetector(
          //       onTap: () => controller.productDetailPage(e),
          //       child: AppProductCard(product: e),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
