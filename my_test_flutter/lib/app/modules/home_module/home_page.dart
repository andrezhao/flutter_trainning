import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/modules/home_module/home_controller.dart';
import 'package:my_test_flutter/app/widget/BottomNavigationWidget.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomePage extends GetView<HomeController> {
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return  BottomNavigationWidget();
  }


}


