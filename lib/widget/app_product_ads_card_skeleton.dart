import 'package:flutter/material.dart';
import 'package:itasoft_technical_test/widget/app_skeleton.dart';

class AppProductAdsCardSkeleton extends StatelessWidget {
  const AppProductAdsCardSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppSkeleton(
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 8,
                  width: 65,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 8,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
          ),
        ],
      ),
    );
  }
}
