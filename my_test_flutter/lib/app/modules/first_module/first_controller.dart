import 'dart:convert';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/Bean/FirstBean.dart';
import 'package:my_test_flutter/app/Http/http_manager.dart';
import 'package:my_test_flutter/app/Http/request_api.dart';
import 'package:common_utils/common_utils.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class FirstController extends GetxController{

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  var _display = false.obs;
  get display=> _display.value;
  set display(value) {
    _display.value = value;
  }

  var _currentIndex = 0.obs;
  get currentIndex=> _currentIndex.value;
  set currentIndex(value) {
    _currentIndex.value = value;
    LogUtil.e("${_currentIndex}");
  }

  Future<Welcome> getPhotoList() async{
    Map<String, dynamic> map = Map();
      var response =  await HttpManager.instance.get(RequestApi.FIRST_PAGE);
      map = json.decode(response.toString());
    var photo = Welcome.fromJson(map);

     print("www ${response.toString()}");
    LogUtil.e("${photo}");
    return photo;
  }

  setDisplayType(bool type ){
    _display.value =  type;
  }


}
