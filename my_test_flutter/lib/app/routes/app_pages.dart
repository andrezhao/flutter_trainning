import '../../app/modules/other_module/other_page.dart';
import '../../app/modules/other_module/other_bindings.dart';
import '../../app/modules/video_list_module/video_list_page.dart';
import '../../app/modules/video_list_module/video_list_bindings.dart';
import '../../app/modules/video_module/video_page.dart';
import '../../app/modules/video_module/video_bindings.dart';
import '../../app/modules/wetchat_pub_module/wetchat_pub_page.dart';
import '../../app/modules/wetchat_pub_module/wetchat_pub_bindings.dart';
import '../../app/modules/first_module/first_page.dart';
import '../../app/modules/first_module/first_bindings.dart';
import '../../app/modules/my_page_module/my_page_page.dart';
import '../../app/modules/my_page_module/my_page_bindings.dart';
import '../../app/modules/login_module/login_page.dart';
import '../../app/modules/login_module/login_bindings.dart';
import '../../app/modules/splash_module/splash_page.dart';
import '../../app/modules/splash_module/splash_bindings.dart';

import 'package:get/get.dart';
part './app_routes.dart';
/**
 * GetX Generator - fb.com/htngu.99
 * */

abstract class AppPages {
  static final pages = [


    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
  /*  GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),*/
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.MY_PAGE,
      page: () => MyPage(),
      binding: MyPageBinding(),
    ),
    GetPage(
      name: Routes.FIRST,
      page: () => FirstPage(),
      binding: FirstBinding(),
    ),
    GetPage(
      name: Routes.WETCHAT_PUB,
      page: () => WechatPubPage(),
      binding: WechatPubBinding(),
    ),
    GetPage(
      name: Routes.VIDEO,
      page: () => VideoPage(),
      binding: VideoBinding(),
    ),
    GetPage(
      name: Routes.VIDEO_LIST,
      page: () => VideoListPage(),
      binding: VideoListBinding(),
    ),
    GetPage(
      name: Routes.OTHER,
      page: () => OtherPage(),
      binding: OtherBinding(),
    ),
  ];
}
