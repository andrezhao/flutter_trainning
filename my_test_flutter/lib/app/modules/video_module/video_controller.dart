import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/modules/other_module/other_page.dart';
import 'package:my_test_flutter/app/modules/video_list_module/video_list_page.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class VideoController extends GetxController with SingleGetTickerProviderMixin {

  late TabController tabController;
  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    super.onInit();
  }

}
class TabInfo {
  String label;
  Widget widget;
  TabInfo(this.label, this.widget);
}
