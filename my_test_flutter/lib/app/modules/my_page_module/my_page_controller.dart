import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/Bean/PackageInfoBean.dart';
import 'package:package_info/package_info.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';
import 'package:battery_plus/battery_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MyPageController extends GetxController {
  var _obj = 0.obs;

  set obj(value) => _obj.value = value;

  get obj => _obj.value;

  late final Permission _permission;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void onInit() {
    getBattery();
  }

  Future<PackageInfoBean> getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    PackageInfoBean packageInfoBean = new PackageInfoBean();
    packageInfoBean.appName = packageInfo.appName;
    packageInfoBean.packageName = packageInfo.packageName;
    packageInfoBean.version = packageInfo.version;
    packageInfoBean.buildNumber = packageInfo.buildNumber;
    return packageInfoBean;
  }

  Future<dynamic> getDeviceInfo() async {
    // print(androidInfo.manufacturer); // 产品/硬件的制造商。
    // print(androidInfo.device); //设备名称
    // print(androidInfo.model); //最终产品的最终用户可见名称。
    // print(androidInfo.androidId);// Android硬件设备ID。
    // print(androidInfo.board);//设备基板名称
    // print(androidInfo.bootloader); //获取设备引导程序版本号
    // print(androidInfo.product); //整个产品的名称
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo;
      print('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo;
      print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"
    } else {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      return webBrowserInfo;
    }
  }

  getBattery() async {
    var battery = Battery();

// Access current battery level
    _obj.value = (await battery.batteryLevel);

    battery.onBatteryStateChanged.listen((BatteryState state) {
      // Do something with new state

    });
  }

  Future getImage() async {
    final picker = ImagePicker();
    await picker.pickImage(source: ImageSource.camera);

  }

}





