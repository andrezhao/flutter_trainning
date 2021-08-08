import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/modules/other_module/other_page.dart';
import 'package:my_test_flutter/app/modules/video_list_module/video_list_page.dart';
import 'package:my_test_flutter/app/modules/video_module/video_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class VideoPage extends GetView<VideoController> {
  @override
  var _videoController = Get.put<VideoController>(VideoController());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(child: Text("VIDEO")),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Material(
            color: Colors.white,
            child: TabBar(
              labelColor: Colors.blue,
              controller: _videoController.tabController,
              tabs: [
                Tab(
                    text: "VideoList",
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.blue,
                    )),
                Tab(
                    text: "Other",
                    icon: Icon(
                      Icons.video_call_outlined,
                      color: Colors.blue,
                    )),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [VideoListPage(), OtherPage()],
      ),
    );
  }
}
