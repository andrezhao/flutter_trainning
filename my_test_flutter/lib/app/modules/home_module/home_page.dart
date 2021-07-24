import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/modules/home_module/home_controller.dart';
import 'package:my_test_flutter/app/widget/BottomNavigationWidget.dart';
import 'package:my_test_flutter/app/widget/MainPage.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomePage extends GetView<HomeController> {
  @override
  List<Widget> _PageList =[];
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    _PageList = controller.getData();
    return  BottomNavigationWidget();
    /*Scaffold(
      appBar: AppBar(
          title: Text('Home Page'),
          automaticallyImplyLeading: false,
          centerTitle: true),
      body: Container(
        child: Obx(() => Container(
              child: Text(controller.obj),
            )),
      ),
    );flutter*/
  }


}


