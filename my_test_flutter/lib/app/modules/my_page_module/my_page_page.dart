import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/Http/request_api.dart';
import 'package:my_test_flutter/app/defalult/AppState.dart';
import 'package:my_test_flutter/app/defalult/global.dart';
import 'package:my_test_flutter/app/modules/login_module/login_controller.dart';
import 'package:my_test_flutter/app/modules/login_module/login_page.dart';
import 'package:my_test_flutter/app/modules/my_page_module/my_page_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MyPage extends GetView<MyPageController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MyPageController());
    return new Scaffold(
        backgroundColor: Colors.grey,
        body: new CustomScrollView(
          slivers: [
            _buildTitleUI(),
            //_buildTopUIPage(),
            _commonUIPage(),
            _toolUIPage(),
            _myOther1UIPage(),
            _myOther2UIPage(),
            _myOther3UIPage(),
          ],
        ));
  }

  /*TOP TITLE UI*/
  Widget _buildTitleUI() {
    return SliverAppBar(
      brightness: Brightness.light,
      expandedHeight: 300.0,
      backgroundColor: Colors.grey,
      title: Text("MyPage"),
      automaticallyImplyLeading: false,
      //是否随着滑动隐藏标题
      floating: true,
      //标题是否固定在顶部
      pinned: false,

      flexibleSpace: FlexibleSpaceBar(
          background: Stack(
        children: [
          Image.network(
            RequestApi.PERSON_PAGE_TOP_BACKGROUND_API,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 10.0,
            top: 150.0,
            right: 10.0,
            child: Container(child: _buildTopUIPage()),
          ),
        ],
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
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
              bottomLeft: const Radius.circular(20.0),
              bottomRight: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0),
              topLeft: const Radius.circular(20.0))),
      width: 150.0,
      height: 150.0,
      child: Obx(() {
        if (Get.put(AppState()).loginState.value == LoginState.LOGIN) {
          return UserLogin();
        }
        {
          return UserNotLogin();
        }
      }),
    );
  }

  Widget UserLogin() {
    return Row(
      children: [
        /* if (Global.userProfile.icon.isEmpty) {*/
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          width: 100,
          height: 100,
          child: CircleAvatar(
              radius: 10.0,
              backgroundImage: NetworkImage(RequestApi.PERSON_PAGE_AVATAR)),
          // }
          /* return Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              width: 100,
              height: 100,
              child: CircleAvatar(
                  radius: 10.0,
                 backgroundImage: AssetImage("assets/icon/village.jpg")));*/
        ),
        SizedBox(width: 10),
        Container(
            child: Text(
          Global.userProfile.nickname,
          style: TextStyle(fontSize: 12, color: Colors.black),
        )),
        SizedBox(width: 10),
        Container(
          alignment: Alignment.bottomLeft,
          child: ElevatedButton(
              onPressed: () {
                LoginController controller = Get.find();
                controller.logOutRequest();
              },
              child: Text("退出登录")),
        )
      ],
    );
  }

  Widget UserNotLogin() {
    return Row(
      children: [
        /* if (Global.userProfile.icon.isEmpty) {*/
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          width: 100,
          height: 100,
          child: CircleAvatar(
              radius: 10.0,
              backgroundImage: AssetImage("assets/icon/village.jpg")),
          // }
          /* return Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              width: 100,
              height: 100,
              child: CircleAvatar(
                  radius: 10.0,
                 backgroundImage: AssetImage("assets/icon/village.jpg")));*/
        ),
        SizedBox(width: 10),
        Container(
          child: TextButton(
            onPressed: () {
              Get.to(LoginPage());
            },
            child: Text(
              "请登录",
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
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            color: Colors.white,
            child: _MyToolRow()));
  }

  /*GIHUT */
  Container _MyToolRow() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              child: Text("常用工具", textAlign: TextAlign.left)),
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

  Widget _myOther1UIPage() {
    return SliverToBoxAdapter(
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            color: Colors.white,
            child: _MyOther1Row()));
  }

  Widget _myOther2UIPage() {
    return SliverToBoxAdapter(
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            color: Colors.white,
            child: _MyOther2Row()));
  }

  Widget _myOther3UIPage() {
    return SliverToBoxAdapter(
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            color: Colors.white,
            child: _MyOther3Row()));
  }

  Container _MyOther1Row() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              child: Text("OTHER", textAlign: TextAlign.left)),
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

  Container _MyOther2Row() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              child: Text("OTHER", textAlign: TextAlign.left)),
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

  Container _MyOther3Row() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              child: Text("OTHER3", textAlign: TextAlign.left)),
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
