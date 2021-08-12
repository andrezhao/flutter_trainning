import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/Bean/TimeLineBean.dart';
import 'package:my_test_flutter/app/Http/request_api.dart';
import 'package:my_test_flutter/app/modules/wetchat_pub_module/wetchat_pub_controller.dart';
import 'package:timelines/timelines.dart';
import 'dart:math' as math;
import 'package:flutter_swiper/flutter_swiper.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class WechatPubPage extends GetView<WechatPubController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => WechatPubController());
    var _controller = Get.put<WechatPubController>(WechatPubController());
    return Scaffold(
        appBar: AppBar(
            title: new Center(child: Text("TIME LINE")),
            automaticallyImplyLeading: false),
        body: FutureBuilder(
            future: _controller.getWeChatPub(),
            builder: (BuildContext context, AsyncSnapshot<TimeLine> snapshot) {
              if (snapshot.hasData) {
                return widgetToBuild(context, snapshot);
              } else if (snapshot.hasError) {
                return Icon(Icons.error_outline);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }

  Widget widgetToBuild(BuildContext context, AsyncSnapshot<TimeLine> snapshot) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Expanded(flex: 1, child: Container( padding: EdgeInsets.all(5),child: changePicture())),
            //Container( height: 200, child: changePicture()),
            Expanded(flex: 3, child: _timeline(snapshot))
            //Container(height: 800,child: _timeline(snapshot))
          ],
        )

        /* ListView.builder(
        itemCount: snapshot.data!.data.length,
        itemBuilder: (context, index) => itemBuilder(context, index),
      ),*/
        );
  }

  Widget changePicture() {
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          RequestApi.PERSON_PAGE_TOP_BACKGROUND_API, fit: BoxFit.cover,
        );
      },
      itemCount: 5,
      autoplay: true,
      pagination: new SwiperPagination(),
      viewportFraction: 0.8,
      scale: 0.9,
      /*control: new SwiperControl(),*/
    );
  }

  Timeline _timeline(AsyncSnapshot<TimeLine> snapshot) {
    return Timeline.tileBuilder(
      builder: TimelineTileBuilder.fromStyle(
        contentsAlign: ContentsAlign.alternating,
        contentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(24.0),
          child: InkWell(
            onTap: () {
              Get.snackbar("${snapshot.data!.data[index].name}", "GetData",
                  backgroundColor: Colors.green,
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: Colors.white);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: randomColor(),
                  borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(20.0),
                      bottomRight: const Radius.circular(20.0),
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0))),
              width: 150,
              height: 50,
              child: Text(
                "${snapshot.data!.data[index].name}",
                style: TextStyle(color: Colors.white),
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
        itemCount: snapshot.data!.data.length,
      ),
    );
  }

  int random(int min, int max) {
    final _random = math.Random();
    return min + _random.nextInt(max - min + 1);
  }

  Color randomColor() {
    return Color.fromARGB(
        random(150, 255), random(0, 255), random(0, 255), random(0, 255));
  }
}
