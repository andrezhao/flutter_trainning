import 'package:my_test_flutter/app/modules/haha_module/haha_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class hahaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => hahaController());
  }
}