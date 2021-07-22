import 'package:my_test_flutter/app/modules/newtest_module/newtest_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class newtestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => newtestController());
  }
}