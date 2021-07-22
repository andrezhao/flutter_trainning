import 'package:my_test_flutter/app/modules/test_module/test_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class testBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => testController());
  }
}