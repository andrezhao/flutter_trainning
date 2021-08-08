import 'package:my_test_flutter/app/modules/video_list_module/video_list_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class VideoListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoListController());
  }
}