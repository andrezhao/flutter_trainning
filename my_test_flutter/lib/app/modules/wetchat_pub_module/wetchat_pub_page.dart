
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/Bean/TimeLineBean.dart';
import 'package:my_test_flutter/app/modules/wetchat_pub_module/wetchat_pub_controller.dart';
import 'package:timelines/timelines.dart';
import 'dart:math' as math;
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class WechatPubPage extends GetView<WechatPubController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => WechatPubController());
    var _controller = Get.put<WechatPubController>(WechatPubController());
    return Scaffold(
        appBar: AppBar(title: new Center(child: Text("TIME LINE")),
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
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Timeline.tileBuilder(
        builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.alternating,
          contentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: InkWell(

              onTap: (){
                Get.snackbar("${snapshot.data!.data[index].name}", "GetData",backgroundColor: Colors.green,
                  snackPosition: SnackPosition.BOTTOM,colorText: Colors.white);
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
                child: Text("${snapshot.data!.data[index].name}",style: TextStyle(color: Colors.white),) ,alignment: Alignment.center,),
          ),),
          itemCount: snapshot.data!.data.length,
        ),
      ),


     /* ListView.builder(
        itemCount: snapshot.data!.data.length,
        itemBuilder: (context, index) => itemBuilder(context, index),
      ),*/
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
