import '../../app/modules/home_module/home_page.dart';
import '../../app/modules/home_module/home_bindings.dart';
import '../../app/modules/splash_module/splash_page.dart';
import '../../app/modules/splash_module/splash_bindings.dart';

import '../../app/modules/test_module/test_bindings.dart';
import '../../app/modules/test_module/test_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';
/**
 * GetX Generator - fb.com/htngu.99
 * */

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.TEST,
      page: () => testPage(),
      binding: testBinding(),
    ),

    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
