import 'package:get/get.dart';

import 'logic.dart';

class ChartsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChartsLogic());
  }
}
