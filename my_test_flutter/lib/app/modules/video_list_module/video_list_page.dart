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
  var _videoController = Get.put<VideoListController>(VideoListController());
  late VideoPlayerController _playerController;

  Widget build(BuildContext context) {
    Get.lazyPut(() => VideoListController());
    onInit();
    return Scaffold(
      body: /*Center(child: videoDisplay()),*/

      FutureBuilder(
        future: _videoController.getVideoList(),
        builder: _buildFuture,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _playerController.value.isPlaying
              ? _playerController.pause()
              : _playerController.play();
        },
        child: Icon(
          _playerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  void onInit() {
    _playerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        _playerController.pause();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.);
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
        return Container(
          child: Center(
            child: Container(
              child: _playerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _playerController.value.aspectRatio,
                      child: VideoPlayer(_playerController),
                    )
                  : Container(),
            ),
          ),
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

  Widget videoDisplay() {
    return Center(
      child: _playerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _playerController.value.aspectRatio,
              child: VideoPlayer(_playerController),
            )
          : Container(),
      );
  }


}
