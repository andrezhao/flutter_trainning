import 'package:my_test_flutter/app/modules/first_module/first_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class FirstBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirstController());
  }
}