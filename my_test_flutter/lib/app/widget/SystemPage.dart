import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/Bean/address.dart';
import 'package:my_test_flutter/app/Bean/new_tree.dart';
import 'package:my_test_flutter/app/Http/http_manager.dart';
import 'package:my_test_flutter/app/Http/request_api.dart';
import 'package:my_test_flutter/app/utils/strings.dart';

class SystemPage extends GetView<SystemController> {
  @override
  var _systemController = Get.put<SystemController>(SystemController());

  Widget build(BuildContext context) {
    /* _systemController.getSystemInfoTitleList().then((value) =>
        print("2222+${value}"));*/
    /* List<Widget> _getData() {
      List<Widget> list = [];
      for (var i = 0; i < list.length; i++) {
        list.add(ListTile(
          title: Text("${list[i].toString()}"),
        ));
      }
      return list;
    }*/

    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true, // 中央寄せを解除//设置没有返回按钮
        title: new Text(SystemPageTitle),
      ),
      body: FutureBuilder(
        future: _systemController.getSystemInfoTitleList(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:

              return Text('还没有开始网络请求');
            case ConnectionState.active:

              return Text('ConnectionState.active');
            case ConnectionState.waiting:

              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:

              print("${snapshot.data}");
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              return ListView(children: getData(snapshot.data));
          }
        },
      ),
    );
  }
}



List<Widget> getData(List tlist) {

  List<Widget> list = [];
  for (var i = 0; i < tlist.length; i++) {
    list.add(ListTile(
      title: Text("${tlist[i].toString()}"),
    ));
  }
  return list;
}

class SystemController extends GetxController {
  var _tipItems = <String>[].obs;

  List<String> get tipItems => _tipItems;

  getSystemInfoTitleList() async {
    Map<String, dynamic> map = Map();
    List<String> _list = [];
    var response =
        await HttpManager.instance.get("https://www.wanandroid.com/tree/json");
    map = json.decode(response.toString());
    var treeEntity = TreeEntity.fromJson(map);

    for (int i = 0; i < treeEntity.data!.length; i++) {
      treeEntity.data![i].isExpanded = false;
      _tipItems.add(treeEntity.data![i].name);
    }
    return _tipItems;
  }
}
