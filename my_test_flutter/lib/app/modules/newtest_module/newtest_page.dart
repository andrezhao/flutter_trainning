import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/modules/newtest_module/newtest_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class newtestPage extends GetView<newtestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('newtest Page')),
      body: Container(
        child: Obx(()=>Container(child: Text(controller.obj),)),
      ),
    );
  }
}
