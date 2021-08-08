import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_test_flutter/app/Bean/TimeLineBean.dart';
import 'package:my_test_flutter/app/Http/http_manager.dart';
import 'package:my_test_flutter/app/Http/request_api.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class WechatPubController extends GetxController {
  var _obj = ''.obs;

  set obj(value) => _obj.value = value;

  get obj => _obj.value;

  Future<TimeLine >getWeChatPub() async {
    Map<String, dynamic> map = Map();
    var response =
        await HttpManager.instance.get(RequestApi.TIMELINE_PAGE);
    map = json.decode(response.toString());
    var timeline = TimeLine.fromJson(map);

    return timeline;
  }

}
