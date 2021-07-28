import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/Bean/address.dart';
import 'package:my_test_flutter/app/Bean/new_tree.dart';

import 'package:my_test_flutter/app/Http/http_manager.dart';
import 'package:my_test_flutter/app/Http/request_api.dart';

import 'package:my_test_flutter/app/utils/strings.dart';

class SystemPage  extends GetView<SystemController> {
  
  @override
  var _systemController = Get.put<SystemController>(SystemController());
  
      
  Widget build(BuildContext context) {
     _systemController.getSystemInfo();

    return  new Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        centerTitle: true,  // 中央寄せを解除//设置没有返回按钮
        title: new Text(SystemPageTitle),

      ),
      body: Center(
        
        child: Text(SystemPageTitle),
      ),
    );
  }
  }

class SystemController extends GetxController {





  void getSystemInfo() async  {

    Map<String, dynamic> map = Map();
    var response = await HttpManager.instance.get("https://www.wanandroid.com/tree/json");
       map  = json.decode(response.toString());
   // planListData  = map2['data'];
    var treeEntity = TreeEntity.fromJson(map);

    for (int i = 0; i < treeEntity.data!.length; i++) {
      treeEntity.data![i].isExpanded = false;
      print("1111111 + ${ treeEntity.data![i].name}");
    }


  }

}
