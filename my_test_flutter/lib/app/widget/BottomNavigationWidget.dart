


import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_test_flutter/app/modules/first_module/first_page.dart';
import 'package:my_test_flutter/app/modules/my_page_module/my_page_page.dart';
import 'package:my_test_flutter/app/modules/video_module/video_page.dart';
import 'package:my_test_flutter/app/modules/wetchat_pub_module/wetchat_pub_page.dart';
import 'package:my_test_flutter/app/utils/strings.dart';

import 'SystemPage.dart';
class  BottomNavigationWidget extends StatefulWidget {

  @override
  _State createState() => _State();

}

class _State extends State<BottomNavigationWidget> {
  @override
  List<Widget> list = [];
  void initState() {
    list.add(FirstPage());
    list.add(VideoPage());
    list.add(SystemPage());
    list.add(WechatPubPage());
    list.add(MyPage());
  }
  int _currentIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        body:list[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(items: [

          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.red,), title: Text(FirestPageTitle)),
          BottomNavigationBarItem(
              icon: Icon(Icons.addchart,color: Colors.blue,), title: new Text(PublicPageTitle)),
          BottomNavigationBarItem(
              icon: Icon(Icons.pages,color: Colors.orange,), title: new Text(SystemPageTitle)),
          BottomNavigationBarItem(
              icon: Icon(Icons.widgets_outlined,color: Colors.green,), title: new Text(ProjectPageTitle
              )),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text(MyPageTitle
              ))
        ],
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
        ),);
  }

}



