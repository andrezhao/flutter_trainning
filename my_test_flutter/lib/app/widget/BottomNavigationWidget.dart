


import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_test_flutter/app/utils/strings.dart';
import 'package:my_test_flutter/app/widget/MyPage.dart';
import 'package:my_test_flutter/app/widget/ProjectPage.dart';
import 'package:my_test_flutter/app/widget/PublicPge.dart';

import 'MainPage.dart';
import 'SystemPage.dart';
class  BottomNavigationWidget extends StatefulWidget {

  @override
  _State createState() => _State();


}

class _State extends State<BottomNavigationWidget> {
  @override
  List<Widget> list = [];
  void initState() {
    list.add(MianPage());
    list.add(PublicPage());
    list.add(SystemPage());
    list.add(ProjectPage());
    list.add(MyPage());
  }
  int _currentIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        body:list[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(items: [

          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text(FirestPageTitle)),
          BottomNavigationBarItem(
              icon: Icon(Icons.addchart), title: new Text(PublicPageTitle)),
          BottomNavigationBarItem(
              icon: Icon(Icons.pages), title: new Text(SystemPageTitle)),
          BottomNavigationBarItem(
              icon: Icon(Icons.widgets_outlined), title: new Text(ProjectPageTitle
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



