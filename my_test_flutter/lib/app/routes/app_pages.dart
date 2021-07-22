import '../../app/modules/splash_module/splash_page.dart';
import '../../app/modules/splash_module/splash_bindings.dart';
import '../../app/modules/haha_module/haha_page.dart';
import '../../app/modules/haha_module/haha_bindings.dart';
import '../../app/modules/newtest_module/newtest_page.dart';
import '../../app/modules/newtest_module/newtest_bindings.dart';
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
      name: Routes.NEWTEST,
      page: () => newtestPage(),
      binding: newtestBinding(),
    ),
    GetPage(
      name: Routes.HAHA,
      page: () => hahaPage(),
      binding: hahaBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}
