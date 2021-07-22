import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/modules/splash_module/splash_controller.dart';

import '../../../main.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SplashPage extends GetView<SplashController> {
  @override

  Widget build(BuildContext context) {
     Get.lazyPut(()=>SplashController());
     controller.countdown();

    return Scaffold(
      appBar: AppBar(title: Text('Splash Page')),
      body:Stack(
        children: [
           Positioned( top: 10.0,
               right: 10.0,
               width: 100.0,
               height: 30.0,
               child: new ClipRRect( borderRadius: BorderRadius.circular(20),
                    child: Container(color: Colors.blue,
                    alignment: AlignmentDirectional(0.0, 0.0),
                         child: Obx(() => Text (controller.obj.toString())),
                      ),
                    )),

            Container( alignment: Alignment(0.0, 0.0),  child: Text("チョウ FLUTTER"),
            ),
    ], ));
       }


  }

