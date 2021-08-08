import 'package:get/get.dart';
import 'package:my_test_flutter/app/Bean/user_data.dart';
import 'package:my_test_flutter/app/Http/http_manager.dart';
import 'package:my_test_flutter/app/Http/request_api.dart';
import 'package:my_test_flutter/app/defalult/AppState.dart';
import 'package:my_test_flutter/app/defalult/global.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LoginController extends GetxController {
  var _obj = true.obs;

  set obj(value) => _obj.value = value;

  get obj => _obj.value;

  Future loginRequest(String userName, String passWord) async {
    var response = await HttpManager.instance.postFormData(RequestApi.LOGIN,
        {"username": "andrezhao", "password": "huaxia123abc"});
    var user = UserData.fromJson(response).data;
    Global.saveUserProfile(user);
    Get.find<AppState>().loginState.value = LoginState.LOGIN;
    Get.back();
  }
   logOutRequest()async {
    var response = await HttpManager.instance.get(RequestApi.LOGOUT);
    //var user = UserData.fromJson(response).data;

    Get.find<AppState>().loginState.value = LoginState.LOGO_OUT;

  }
}
