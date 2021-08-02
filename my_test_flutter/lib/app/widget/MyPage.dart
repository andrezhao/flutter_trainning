import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_test_flutter/app/Http/request_api.dart';

/*我的主页*/
class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MianPageState createState() => _MianPageState();
}

class _MianPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new CustomScrollView(
      slivers: [
        _buildTitleUI(),
        _buildTopUIPage(),
        //_commonUIPage(),
      ],
    ));
  }

  /*TOP TITLE UI*/
  Widget _buildTitleUI() {
    return SliverAppBar(
      brightness: Brightness.light,
      expandedHeight: 250.0,
      automaticallyImplyLeading: false,
      //是否随着滑动隐藏标题
      floating: false,
      //标题是否固定在顶部
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          background: Image.network(
        RequestApi.PERSON_PAGE_TOP_BACKGROUND_API,
        fit: BoxFit.fill,
      )),
    );
  }

  /* Widget _buildTopUIPage() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Text('.AAAAAA');
        },
        childCount: 200,
        semanticIndexOffset: 2,
      ),
    );
  }
*/
  Widget _buildTopUIPage() {
    return SliverToBoxAdapter(
        child: Container(
      width: 150.0,
      height: 150.0,
          child:
    ));
  }

/*Widget _commonUIPage() {
    return
  }*/
}
