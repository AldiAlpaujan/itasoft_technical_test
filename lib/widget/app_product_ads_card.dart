import 'package:flutter/material.dart';
import 'package:itasoft_technical_test/helper/formatter.dart';
import 'package:itasoft_technical_test/model/product.adjustment.dart';
import 'package:itasoft_technical_test/theme/theme.dart';

class AppProductAdsCard extends StatelessWidget {
  final ProductAdjustment product;
  const AppProductAdsCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            margin: const EdgeInsets.only(right: 12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppTheme.primaryColor.withOpacity(.1),
            ),
            child: Text(
              product.initial,
              style: const TextStyle(
                fontSize: 16,
                color: AppTheme.primaryColor,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  product.expired != null
                      ? dateFormatUI(product.expired!)
                      : "-",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: product.expired != null
                        ? product.expired!.isBefore(DateTime.now())
                            ? Colors.red
                            : AppTheme.capColor
                        : AppTheme.capColor,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Qty. ${product.stock}",
            style: const TextStyle(
              fontSize: 12,
              color: AppTheme.capColor,
            ),
          ),
        ],
      ),
    );
  }
}
