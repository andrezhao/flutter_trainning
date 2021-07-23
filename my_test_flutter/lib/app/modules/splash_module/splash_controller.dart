import 'dart:async';

import 'package:get/get.dart';
import 'package:my_test_flutter/app/modules/home_module/home_controller.dart';
import 'package:my_test_flutter/app/modules/home_module/home_page.dart';
import 'package:my_test_flutter/app/utils/strings.dart';

import '../../../main.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SplashController extends GetxController{

  var _obj = 10.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
  late Timer timer;


  void countdown() {
    timer = new Timer.periodic(Duration(seconds: 1), _onTimer);

  }
  void _onTimer(Timer timer) {
    if(_obj == 0){
      _obj (0);
      timer.cancel();
     Get.to(HomePage());

    }
    else{
      _obj(_obj.value-1) ;
      print("111 $_obj.value");
      update();
    }


  }

  void dispose() {
    super.dispose();
    timer.cancel();
  }
}
