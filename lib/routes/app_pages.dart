import 'package:itasoft_technical_test/pages/dashboard/dashboard.controller.dart';
import 'package:itasoft_technical_test/pages/dashboard/dashboard.page.dart';
import 'package:itasoft_technical_test/pages/login/login.controller.dart';
import 'package:itasoft_technical_test/pages/login/login.page.dart';

import 'package:get/get.dart';
import 'package:itasoft_technical_test/pages/product_detail/product_detail.controller.dart';
import 'package:itasoft_technical_test/pages/product_detail/product_detail.page.dart';
import 'package:itasoft_technical_test/pages/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.splashScreen;

  static final pages = <GetPage>[
    GetPage(name: Routes.splashScreen, page: () => const SplashScreen()),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => LoginController())),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => DashboardController())),
    ),
    GetPage(
      name: Routes.productDetail,
      page: () => const ProductDetailPage(),
      binding: BindingsBuilder(
        () => Get.lazyPut(() => ProductDetailController()),
      ),
    ),
  ];
}
