import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/widget/BottomNavigationWidget.dart';
import 'package:my_test_flutter/app/widget/MainPage.dart';
import 'package:my_test_flutter/app/widget/SystemPage.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomeController extends GetxController{

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  List<Widget> _pageList = [];

  var appBarTitles = ['首页', '公众号', '体系', '项目' '我的'];

  List<Widget> getData(){
    _pageList.add(MianPage());
    _pageList.add(SystemPage());
    _pageList.add(SystemPage());
    _pageList.add(SystemPage());
    _pageList.add(SystemPage());
    return _pageList;
  }
}


