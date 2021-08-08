import 'package:my_test_flutter/app/modules/other_module/other_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class OtherBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtherController());
  }
}