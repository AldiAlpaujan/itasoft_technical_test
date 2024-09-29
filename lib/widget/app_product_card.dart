import 'package:flutter/material.dart';
import 'package:itasoft_technical_test/helper/formatter.dart';
import 'package:itasoft_technical_test/model/product.dart';
import 'package:itasoft_technical_test/theme/theme.dart';

class AppProductCard extends StatelessWidget {
  final Product product;
  const AppProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            margin: const EdgeInsets.only(right: 6),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppTheme.primaryColor.withOpacity(.1),
            ),
            child: Text(
              product.initial,
              style: const TextStyle(
                fontSize: 14,
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
                  product.cNamaBarang,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  dateFormatUI(product.cExpired),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    color: product.cExpired.isBefore(DateTime.now())
                        ? Colors.red
                        : AppTheme.capColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
