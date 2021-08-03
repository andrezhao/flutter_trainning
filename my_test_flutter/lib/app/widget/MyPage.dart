import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
        backgroundColor: Colors.grey,
        body: new CustomScrollView(
          slivers: [
            _buildTitleUI(),
            _buildTopUIPage(),
            _commonUIPage(),
            _toolUIPage(),
          ],
        ));
  }

  /*TOP TITLE UI*/
  Widget _buildTitleUI() {
    return SliverAppBar(
      brightness: Brightness.light,
      expandedHeight: 250.0,
      title: Text("MyPage"),
      automaticallyImplyLeading: false,
      //是否随着滑动隐藏标题
      floating: true,
      //标题是否固定在顶部
      pinned: false,
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
            color: Colors.white,
            width: 150.0,
            height: 150.0,
            child: UserLogin()));
  }

  Row UserLogin() {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            width: 100,
            height: 100,
            child: CircleAvatar(
                radius: 10.0,
                backgroundImage: AssetImage("assets/icon/village.jpg"))),
        SizedBox(width: 10),
        Container(

          child: TextButton(
            onPressed: () {



            },
            child: Text(
              "用户登录",
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _commonUIPage() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        color: Colors.white,
        child: MyInfoRow(),
      ),
    );
  }

  /*收藏 分享 积分 排行 历史*/
  Row MyInfoRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(
              children: [
                Icon(
                  Icons.add_business_sharp,
                  size: 30,
                  color: Colors.blue,
                ),
                Text(
                  "收藏",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Icon(
                  Icons.add_to_photos_rounded,
                  color: Colors.orange,
                ),
                Text(
                  "分享",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Icon(
                  Icons.point_of_sale,
                  color: Colors.red,
                ),
                Text(
                  "积分",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Icon(
                  Icons.add_to_photos,
                  color: Colors.green,
                ),
                Text(
                  "排行榜",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Icon(
                  Icons.history,
                  color: Colors.greenAccent,
                ),
                Text(
                  "浏览历史",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
        ],
      );
  }

  Widget _toolUIPage() {
    return SliverToBoxAdapter(
        child: Container(color: Colors.white,
            child: _MyToolRow()));

  }

  /*GIHUT */
  Container _MyToolRow() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container( alignment:Alignment.topLeft,child: Text("常用工具" ,textAlign: TextAlign.left)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  children: [
                    Icon(
                      Icons.analytics_sharp,
                      size: 30,
                      color: Colors.blue,
                    ),
                    Text(
                      "GITHUB",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  children: [
                    Icon(
                      Icons.add_moderator,
                      size: 30,
                      color: Colors.yellow,
                    ),
                    Text(
                      "TODO",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 30,
                      color: Colors.pink,
                    ),
                    Text(
                      "日历",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  children: [
                    Icon(
                      Icons.airplanemode_inactive,
                      size: 30,
                      color: Colors.deepPurple,
                    ),
                    Text(
                      "快递",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }


}


