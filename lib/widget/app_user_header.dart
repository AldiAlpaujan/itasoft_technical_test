import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itasoft_technical_test/helper/assets.dart';
import 'package:itasoft_technical_test/helper/global_var.dart';
import 'package:itasoft_technical_test/theme/theme.dart';
import 'package:itasoft_technical_test/widget/app_image.dart';

class AppUserHeader extends StatelessWidget {
  const AppUserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            margin: const EdgeInsets.only(right: 10),
            child: AppImage(
              link: userImgDummy,
              type: ImageType.local,
              fit: BoxFit.fill,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back, ${user.username.capitalize}",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 1),
              Text(
                user.isAdmin ? "Admin warehouse" : "Warehouse employee",
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.capColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
