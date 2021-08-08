import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_test_flutter/app/Bean/VideoBean.dart';
import 'package:my_test_flutter/app/Http/http_manager.dart';
import 'package:my_test_flutter/app/Http/request_api.dart';
import 'package:video_player/video_player.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class VideoListController extends GetxController{

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

    var VideoPlayerController _playerController;
     get
  @override
  void onInit() {
    _playerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
    )..initialize().then((_) {
      update();
      _playerController.play();
    });
  }

  Future<Video>getVideoList() async{

    Map<String, dynamic> map = Map();
    var response =  await HttpManager.instance.get(RequestApi.FIRST_PAGE);
    map = json.decode(response.toString());
    var video = Video.fromJson(map);

    print("www ${response.toString()}");
    // print("www ${photo.hits.length.toString()}");
    return video;
  }
}
