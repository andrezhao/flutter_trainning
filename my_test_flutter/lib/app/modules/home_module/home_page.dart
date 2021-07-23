import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/modules/home_module/home_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>HomeController());
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Container(
        child: Obx(()=>Container(child: Text(controller.obj),)),
      ),
    );
  }
}
