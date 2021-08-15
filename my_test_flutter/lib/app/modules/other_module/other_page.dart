import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_interactional_widget/flutter_interactional_widget.dart';
import 'package:my_test_flutter/app/modules/other_module/other_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class OtherPage extends GetView<OtherController> {
  @override
  var _controller = Get.put<OtherController>(OtherController());

  Widget build(BuildContext context) {
    Get.lazyPut(() => OtherController());

    return Scaffold(
      body: InteractionalWidget(
        maxAngleX: 30,
        maxAngleY: 80,
        width: Get.width,
        height: Get.height,
        middleScale: 1,
        foregroundScale: 1.1,
        backgroundScale: 1.1,
        backgroundWidget: backgroundWidget(),
        //middleWidget: middleWidget(),
        foregroundWidget: foregroundWidget(),
      ),
    );
  }

  Widget backgroundWidget() {
    return Container(
      child: _controller.getImage('back.png'),
    );
  }

  //"assets/icon/village.jpg",
  Widget foregroundWidget() {
    return Container(
      child: _controller.getImage('fore.png'),
    );
  }

  Widget middleWidget() {
    // return Center(child: Text('hello'));
    return Container(
      child: _controller.getImage('mid.png'),
    );
  }
}
