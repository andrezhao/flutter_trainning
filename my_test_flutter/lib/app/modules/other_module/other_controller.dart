

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class OtherController extends GetxController{

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  Image getImage(String s) {
    return Image.asset(
      "assets/icon/$s",
      width: Get.width-10,
      height: Get.height-250,
      fit: BoxFit.cover,
      scale: 2.0,
    );
  }
}
