import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/modules/other_module/other_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class OtherPage extends GetView<OtherController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OtherController());
    return Scaffold(
      body: Container(
        child: Obx(()=>Container(child: Text(controller.obj),)),
      ),
    );
  }
}
