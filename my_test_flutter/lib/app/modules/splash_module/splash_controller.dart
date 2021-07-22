import 'dart:async';

import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SplashController extends GetxController{

  var _obj = 100.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;


  void countdown() {
    Timer.periodic(Duration(seconds: 10), _onTimer);

  }
  void _onTimer(Timer timer) {
    if(_obj < 1){
      _obj (0);
    }
    else{
      _obj(_obj.value-1) ;

      print("111 $_obj.value");
    }
    update();

  }
}
