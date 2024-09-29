import 'package:flutter/widgets.dart';
import 'package:itasoft_technical_test/helper/global_var.dart';
import 'package:itasoft_technical_test/theme/theme.dart';

class AppWarehouseCard extends StatelessWidget {
  const AppWarehouseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.padding),
      child: Container(
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
      ),
    );
  }
}
