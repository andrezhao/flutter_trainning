import 'package:my_test_flutter/app/modules/video_module/video_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class VideoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoController());
  }
}