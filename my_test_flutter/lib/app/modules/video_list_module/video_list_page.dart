import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/Bean/VideoBean.dart';
import 'package:my_test_flutter/app/modules/video_list_module/video_list_controller.dart';
import 'package:video_player/video_player.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class VideoListPage extends GetView<VideoListController> {
  @override
  late VideoPlayerController _playerController;
  late Future<void> _initializeVideoPlayerFuture;
  Widget build(BuildContext context) {
    initState();
    VideoPlayerController _playerController;
    Get.lazyPut(() => VideoListController());
    var _videoController = Get.put<VideoListController>(VideoListController());
    return Scaffold(
      body: FutureBuilder(
        future: _videoController.getVideoList(),
        builder: _buildFuture,
      ),
    );
  }
  @override
  void initState() {
    // 動画プレーヤーの初期化
    _playerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
    )..initialize().then((_) {
       
      _playerController.play();
    });

  }
  Widget _buildFuture(BuildContext context, AsyncSnapshot<Video> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        return Container(color: Colors.blue,height: 300,
        child: _playerController.value.isInitialized
          ? AspectRatio(
          aspectRatio: _playerController.value.aspectRatio,
          child: VideoPlayer(_playerController),
        )
        : Container(),
    );

           /* child: ListView.builder(
              itemBuilder: (BuildContext context, int index){
                return Container(
                  child:
                );
              },)
        );*/
    }
  }

  }


