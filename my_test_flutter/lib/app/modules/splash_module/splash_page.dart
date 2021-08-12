import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/modules/home_module/home_page.dart';
import 'package:my_test_flutter/app/modules/splash_module/splash_controller.dart';
import 'package:my_test_flutter/app/utils/log_utils.dart';

import '../../../main.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SplashPage extends GetView<SplashController> {
  get child => null;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SplashController());
    controller.countdown();
    controller.onInit();
    controller.ct.forward(from: 0.0);

    LogUtils.e("ssss");
    bool _visible = true;
    return Scaffold(
        body: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Center(
                  child: AnimationOpav(context),
                ),
              ),
             Positioned(
                  top: 50.0,
                  right: 10.0,
                  width: 100.0,
                  height: 30.0,
                  child: new ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.red,
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Obx(
                          () => TextButton(
                              onPressed: () {
                                controller.dispose();
                                Get.off(HomePage());
                              },
                              child: Text("Skip ${controller.obj}", style: TextStyle(color: Colors.white))),
                        ),
                      ))),

              //Positioned(bottom: 50, child: Animation(context)),
            ],
          ),
        ));
  }

  Widget picture() {
    return  Container(
        height: double.infinity,
        width: double.infinity,
        child: new Image.asset("assets/icon/village.jpg",fit: BoxFit.cover));
  }

  @override
  Widget Animation(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.ct, // 传入动画对象
      child: textAnimation(),
      // 动画构建回调
      builder: (context, child) => Transform.rotate(
        angle: controller.ct.value * 2,

        child: child, // 即 AnimatedBuilder 中的 child
      ),
    );
  }

  Widget textAnimation(){
    return Container(
       width: 100,
      height: 100,
      child: FlutterLogo(),
    );

  }

  Widget AnimationOpav(BuildContext context) {
    return FadeTransition(
        opacity: controller.curve,
        child: picture(),);
  }
}
