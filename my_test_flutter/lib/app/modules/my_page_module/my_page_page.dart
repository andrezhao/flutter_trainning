import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/Bean/PackageInfoBean.dart';
import 'package:my_test_flutter/app/Http/request_api.dart';
import 'package:my_test_flutter/app/defalult/AppState.dart';
import 'package:my_test_flutter/app/defalult/global.dart';
import 'package:my_test_flutter/app/modules/login_module/login_controller.dart';
import 'package:my_test_flutter/app/modules/login_module/login_page.dart';
import 'package:my_test_flutter/app/modules/my_page_module/my_page_controller.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MyPage extends GetView<MyPageController> {
  var _myPageController = Get.put<MyPageController>(MyPageController());

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey,
        body: new CustomScrollView(
          slivers: [
            _buildTitleUI(),
            _commonUIPage(),
            //_toolUIPage(),
            _deviceInfoUIPage(),
            _packInfoPage(),
            //_myOther3UIPage(),
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

  /*battery permission verup*/
  Row MyInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Column(
            children: [
              Container(
                child: Obx(
                  () => Text(
                    "${_myPageController.obj} %",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "BATTERY INFO",
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Icon(
                Icons.camera_alt_outlined,
                color: Colors.orange,
              ),
              OutlinedButton(
                onPressed: () async {
                  if (await Permission.camera.request().isGranted) {

                    _myPageController.getImage();


                  }
                  if (await Permission.camera.request().isPermanentlyDenied) {
                    openAppSettings();
                  }
                },
                child: Text("Camera"),
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
                "VERSION UP",
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

  Widget _deviceInfoUIPage() {
    return SliverToBoxAdapter(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(20.0),
                    bottomRight: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                    topLeft: const Radius.circular(20.0))),
            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: _deviceInfoRow()));
  }

  Widget _packInfoPage() {
    return SliverToBoxAdapter(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(20.0),
                    bottomRight: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0),
                    topLeft: const Radius.circular(20.0))),
            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: _packageInfoRow()));
  }

  Container _deviceInfoRow() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(children: <Widget>[
        _DeviceInfoRow(),
      ]),
    );
  }

  Widget _DeviceInfoRow() {
    return FutureBuilder(
        future: _myPageController.getDeviceInfo(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return switchPlatform(snapshot);
        });
  }

  Widget _packageInfoRow() {
    return FutureBuilder(
        future: _myPageController.getPackageInfo(),
        builder:
            (BuildContext context, AsyncSnapshot<PackageInfoBean> snapshot) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                    "PACKAGE INFO",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                itemText(100, Icons.person_outlined, "APP NAME : ",
                    snapshot.data!.appName),
                itemText(200, Icons.person_outlined, "PACKAGE NAME:",
                    snapshot.data!.packageName),
                itemText(100, Icons.person_outlined, "BUILD NUMBER:",
                    snapshot.data!.buildNumber),
                itemText(200, Icons.person_outlined, "VERSION:",
                    snapshot.data!.version),
              ],
            ),
          );
        });
  }

  Widget itemText(int v, IconData icon, String title, String contents) {
    return Container(
      alignment: Alignment.topLeft,
      color: Colors.grey[v],
      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.blue,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 15, color: Colors.blue),
          ),
          Container(
            child: Expanded(
                child: Text(
              "${contents}",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.right,
            )),
          )
        ],
      ),
    );
  }

  Widget switchPlatform(AsyncSnapshot<dynamic> snapshot) {
    var hardWare;
    var id;
    var androidID;
    if (Platform.isAndroid) {
      AndroidDeviceInfo info = snapshot.data;
      hardWare = info.product;
      id = info.id;
      androidID = info.androidId;
    } else {
      IosDeviceInfo info = snapshot.data;
      hardWare = info.systemVersion;
      id = info.name;
    }
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Text(
              "DEVICE INFO",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          itemText(100, Icons.person_outlined, "HARDWARE : ", hardWare),
          itemText(200, Icons.person_outlined, "ID:", id),
          itemText(100, Icons.person_outlined, "Android id", androidID),
        ],
      ),
    );
  }
}
