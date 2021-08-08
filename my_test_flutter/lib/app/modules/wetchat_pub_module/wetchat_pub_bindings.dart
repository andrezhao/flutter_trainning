import 'package:my_test_flutter/app/modules/wetchat_pub_module/wetchat_pub_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class WechatPubBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WechatPubController());
  }
}