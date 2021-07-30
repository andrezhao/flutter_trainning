import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/Bean/new_tree.dart';
import 'package:my_test_flutter/app/Http/http_manager.dart';
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

  Future<List> getSystemInfoTitleList() async  {

    Map<String, dynamic> map = Map();
    var list = [];
    var response = await HttpManager.instance.get("https://www.wanandroid.com/tree/json");
    map  = json.decode(response.toString());
    // planListData  = map2['data'];
    var treeEntity = TreeEntity.fromJson(map);

    for (int i = 0; i < treeEntity.data!.length; i++) {
      treeEntity.data![i].isExpanded = false;
      print("1111111 + ${ treeEntity.data![i].name}");
      list.add(treeEntity.data![i].name);
    }
    return list;

  }
}


