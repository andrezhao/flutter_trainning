import 'package:my_test_flutter/app/modules/my_page_module/my_page_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyPageController());
  }
}