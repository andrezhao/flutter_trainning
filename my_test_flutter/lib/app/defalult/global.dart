import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/Bean/user_data.dart';
import 'package:sp_util/sp_util.dart';

import 'Constans.dart';


class Global {
  static User userProfile = User(id: 0, email: '', publicName: '', nickname: '', chapterTops: [], token: '', admin: true, username: '', coinCount: 0, type: 0, password: '', icon: '', collectIds: []);

  //是否第一次打开程序
  //static bool isFirstOpen = false;

  ///在项目启动前做一些初始化操作
  /*static Future init() async {
    var appState = Get.put<AppState>(AppState());
    var themeController = Get.put<ThemeController>(ThemeController());
    //告诉程序在启动之前需要做一些其他操作
    WidgetsFlutterBinding.ensureInitialized();
    //初始化持久工具
    await SpUtil.getInstance();

    await HttpManager.getCookieJar();

    if (Platform.isAndroid) {
      //如果是android设备，状态栏设置为透明沉浸
      SystemUiOverlayStyle _style =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(_style);
    }

    Map userMap = SpUtil.getObject(ConstantInfo.KEY_USER);
    if (userMap != null) {
      userProfile = User.fromJson(userMap);
    }
   // isFirstOpen = SpUtil.getBool(ConstantInfo.KEY_IS_FIRST_OPEN_APP, defValue: true);

  //  appState.setIsLogin(isUserOnLine ? LoginState.LOGIN : LoginState.LOGO_OUT);

   // themeController.setThemeData(SpUtil.getString(ThemeKey.KEY_APP_THEME)??ThemeKey.LIGHT);
  }
  */


  static saveUserProfile(User user) {
    SpUtil.putObject(ConstantInfo.KEY_USER, user);
    userProfile = user;
  }

  static bool get isUserOnLine =>
      SpUtil.getObject(ConstantInfo.KEY_USER) != null;
}
