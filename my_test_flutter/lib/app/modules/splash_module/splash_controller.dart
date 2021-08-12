import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/modules/home_module/home_controller.dart';
import 'package:my_test_flutter/app/modules/home_module/home_page.dart';
import 'package:my_test_flutter/app/utils/log_utils.dart';
import 'package:my_test_flutter/app/utils/strings.dart';

import '../../../main.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SplashController extends GetxController
    with SingleGetTickerProviderMixin {
  var _obj = 10.obs;

  set obj(value) => _obj.value = value;

  get obj => _obj.value;
  late Timer timer;
  late AnimationController ct;
  late CurvedAnimation curve;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration.zero, () {
      initData();
    });

    ct = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);
    Animation<double> animation = Tween(begin: 1.0, end: 0.0).animate(ct);
    curve = new CurvedAnimation(parent: ct, curve: Curves.easeInOut);
    animation.addListener(() {});
  }

  void countdown() {
    timer = new Timer.periodic(Duration(seconds: 1), _onTimer);
  }

  void _onTimer(Timer timer) {
    if (_obj == 0) {
      _obj(0);
      timer.cancel();
      Get.off(HomePage());
    } else {
      _obj(_obj.value - 1);
      update();
    }
  }

  void dispose() {
    super.dispose();
    timer.cancel();
    ct.dispose();
  }

  void initData() async {
    bool isLog = !bool.fromEnvironment("dart.vm.product");
    LogUtils.init(islog: isLog);
  }
}
