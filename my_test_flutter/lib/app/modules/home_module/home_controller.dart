import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/Bean/new_tree.dart';
import 'package:my_test_flutter/app/Http/http_manager.dart';
import 'package:my_test_flutter/app/modules/first_module/first_page.dart';
import 'package:my_test_flutter/app/widget/SystemPage.dart';
import 'package:common_utils/common_utils.dart';

/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomeController extends GetxController{

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  List<Widget> _pageList = [];

  //var appBarTitles = ['PICTURE', 'VIDEO', 'STUDY', 'TIME' 'MY'];

  /*List<Widget> getData(){
    _pageList.add(FirstPage());
    _pageList.add(SystemPage());
    _pageList.add(SystemPage());
    _pageList.add(SystemPage());
    _pageList.add(SystemPage());
    return _pageList;
  }*/

  Future<List> getSystemInfoTitleList() async  {

    Map<String, dynamic> map = Map();
    var list = [];
    var response = await HttpManager.instance.get("https://www.wanandroid.com/tree/json");
    map  = json.decode(response.toString());
    // planListData  = map2['data'];
    var treeEntity = TreeEntity.fromJson(map);

    for (int i = 0; i < treeEntity.data!.length; i++) {
      treeEntity.data![i].isExpanded = false;
      LogUtil.d("1111111 + ${ treeEntity.data![i].name}");
      list.add(treeEntity.data![i].name);
    }
    return list;

  }
}


