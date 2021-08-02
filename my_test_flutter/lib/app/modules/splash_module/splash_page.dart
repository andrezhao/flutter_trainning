import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/modules/home_module/home_page.dart';
import 'package:my_test_flutter/app/modules/splash_module/splash_controller.dart';

import '../../../main.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SplashController());
    controller.countdown();
    return Scaffold(
        appBar: AppBar(title: Text('Splash Page')),
        body: Stack(  alignment: Alignment.center,
          children: [
            Positioned(
                top: 10.0,
                right: 10.0,
                width: 100.0,
                height: 30.0,
                child: new ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.blue,
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Obx(
                        () => TextButton(
                            onPressed: () {
                              //controller.dispose();
                              Get.to(HomePage());
                            },
                            child: Text("Skip" '${controller.obj.toString()}',
                                style: TextStyle(color: Colors.white))),
                      ),
                    ))),
            Positioned(
              child: new Container(
                alignment: Alignment.center,
                child: new Image.asset("assets/icon/village.jpg"),
              ),
            ),
            Positioned(
                bottom: 100,
                child: new Container(alignment: Alignment.center,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                              onPressed: () {
                                controller.dispose();
                                Get.to(HomePage());
                              },
                              child: Text(
                                "Andre FLUTTER",
                                style: TextStyle(fontSize: 20, color: Colors.blue),
                              )),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ));
  }
}
