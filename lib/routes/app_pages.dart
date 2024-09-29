import 'package:itasoft_technical_test/pages/adjustment/adjustment.controller.dart';
import 'package:itasoft_technical_test/pages/dashboard/dashboard.controller.dart';
import 'package:itasoft_technical_test/pages/login/login.controller.dart';
import 'package:itasoft_technical_test/pages/login/login.page.dart';

import 'package:get/get.dart';
import 'package:itasoft_technical_test/pages/navigation/navigation.controller.dart';
import 'package:itasoft_technical_test/pages/navigation/navigation.page.dart';
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
      name: Routes.navigation,
      page: () => const NavigationPage(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => NavigationController())),
        BindingsBuilder(() => Get.lazyPut(() => DashboardController())),
        BindingsBuilder(() => Get.lazyPut(() => AdjustmentController())),
      ],
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
