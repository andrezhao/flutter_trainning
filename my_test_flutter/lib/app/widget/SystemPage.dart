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
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true, // 中央寄せを解除//设置没有返回按钮
        title: new Text(SystemPageTitle),
      ),
      body: FutureBuilder(
          future: _systemController.getSystemInfoTitleList(),
          builder: _buildFuture),
    );
  }
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
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
        // return ListView(children: getData(snapshot.data));
        return ListView.builder(
            itemCount: getData(snapshot.data).length, //
            itemBuilder: (context, index) =>
                _itemBiluder(context, index, getData(snapshot.data)));

    //Text("${snapshot.data[index]}"));

    }
  }
  Widget _itemBiluder(context, int index, List<dynamic> contentList) {
    return Card(
      color: Colors.white,
      //z轴的高度，设置card的阴影
      elevation: 20.0,
      //设置shape，这里设置成了R角
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      ),
      //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
      clipBehavior: Clip.antiAlias,
      semanticContainer: false,
      child: getChild(index, contentList),
    );
  }
  getChild(int index, List<dynamic> list) {
    return Container(
      color: Colors.white,
      alignment: Alignment.topLeft,
      child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text(
          list[index].toString(),
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 28, color: Colors.black),
        ),
        _buildTipItemChildrenUI(index)
      ]),
    );
  }
  Widget _buildTipItemChildrenUI (int index) {
    List<Widget> _childs = [];
    List<TreeDatachild> _children = <TreeDatachild>[];
    _children = _systemController.treeEntity.data![index].children;
    for (int i = 0; i < _children.length; i++) {
      var chip = ActionChip( label: Text(_children[i].name,style:TextStyle(color: Colors.white),),
            backgroundColor: Colors.blue, onPressed: () {  },
        );
        _childs.add(chip);
    }
    return Wrap(
      spacing: 15.0,
      runSpacing: 10.0,
      children: _childs,
    );
  }
}
/*List<Widget> getData(List tlist) {
  List<Widget> list = [];
  for (var i = 0; i < tlist.length; i++) {
    list.add(ListTile(
      title: Text("${tlist[i].toString()}"),
    ));
  }
  return list;
}*/
List<dynamic> getData(List tlist) {
  List<dynamic> list = [];
  for (var i = 0; i < tlist.length; i++) {
    list.add(tlist[i].toString());
  }
  return list;
}

class SystemController extends GetxController {
  var _tipItems = <String>[].obs;
  late   TreeEntity treeEntity;

  List<String> get tipItems => _tipItems;


  getSystemInfoTitleList() async {
    Map<String, dynamic> map = Map();
    var response =
        await HttpManager.instance.get("https://www.wanandroid.com/tree/json");
    map = json.decode(response.toString());
     treeEntity = TreeEntity.fromJson(map);

    for (int i = 0; i < treeEntity.data!.length; i++) {
      treeEntity.data![i].isExpanded = false;
      _tipItems.add(treeEntity.data![i].name);
    }
    return _tipItems;
  }
}
