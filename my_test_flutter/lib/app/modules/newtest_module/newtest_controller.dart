import 'dart:async';

import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */
import 'dart:async';
class newtestController extends GetxController{

  var _obj = 'timer'.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  void countdown() {
    Timer.periodic(Duration(seconds: 10), _onTimer);
  }
  void _onTimer(Timer timer) {
    var counter = 10;
    _obj= counter-- as RxString;
  }
}
