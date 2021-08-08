import 'package:get/get.dart';

class AppState extends GetxController {
  ///是否登录
  var loginState = LoginState.LOGO_OUT.obs;
  void setIsLogin(LoginState state) {
    loginState.value = state;
  }

  /// status
  var loadState = LoadState.SUCCESS.obs;
  void setLoadState(LoadState state){
    loadState.value = state;
  }
}

enum LoadState { LOADING, SUCCESS, FAILURE, DONE, NO_MORE, EMPTY }

enum LoginState { LOGIN, LOGO_OUT }