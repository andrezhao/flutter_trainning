import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/Bean/system_page_bean.dart';
import 'package:my_test_flutter/app/Http/http_manager.dart';
import 'package:my_test_flutter/app/Http/request_api.dart';

import 'package:my_test_flutter/app/utils/strings.dart';

class SystemPage  extends GetView<SystemController> {
  
  @override
  var _systemController = Get.put<SystemController>(SystemController());
  
      
  Widget build(BuildContext context) {
    _systemController.getSystemInfo();
    return  new Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        centerTitle: true,  // 中央寄せを解除//设置没有返回按钮
        title: new Text(SystemPageTitle),

      ),
      body: Center(
        
        child: Text(SystemPageTitle),
      ),
    );
  }
  }

class SystemController extends GetxController {

  var _bean = SystemPageBean().obs;

  void getSystemInfo() {
    /* HttpManager.instance.get(
        "tree/json", noCache: true, params: {}) ;*/
    print("ssss");
  }
}
