import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/Bean/FirstBean.dart';
import 'package:my_test_flutter/app/modules/first_module/first_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class FirstPage extends GetView<FirstController> {
  @override
  Widget build(BuildContext context) {
    var _logInController = Get.put<FirstController>(FirstController());
    _logInController.getPhotoList();
    return Scaffold(
      body: FutureBuilder(
        future: _logInController.getPhotoList(),
        builder: _buildFuture,
      ),
      //浮动按钮
      floatingActionButton: FloatingActionButton(
        //浮动按钮图标
        child: Icon(
          Icons.assistant_photo,
          color: Colors.orange,
        ),
        //浮动按钮背景色
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          Get.forceAppUpdate();
          if (controller.display) {
            controller.setDisplayType(false);
          } else {
            controller.setDisplayType(true);
          }
        },
      ),
      //浮动按钮
      appBar: AppBar(
          title: new Center(child: Text("PICTURES")),
          automaticallyImplyLeading: false),
    );
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot<Welcome> snapshot) {
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
        if (controller.display) {
          return stageType(snapshot);
        } else {
          return ListType(snapshot);
        }
    }
  }

  Widget ListType(AsyncSnapshot<Welcome> snapshot) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: _centerImage(snapshot),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(1),
              child: _bottomListView(snapshot),
            ),
          ),
        ],
      ),
    );
  }

  ScrollController _scrollController = new ScrollController();

  Widget _centerImage(AsyncSnapshot<Welcome> snapshot) {
    return GetBuilder<FirstController>(
      init: FirstController(),
      builder: (logic) {
        return Image.network(
          snapshot.data!.hits[controller.currentIndex].webformatUrl,
          fit: BoxFit.fill,
        );
      },
    );
  }

  Widget _bottomListView(AsyncSnapshot<Welcome> snapshot) {
    return GetBuilder<FirstController>(
      init: FirstController(),
      builder: (logic) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.hits.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  //边框圆角
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  //边框
                  border: Border.all(
                      width: 4,
                      color: controller.currentIndex == index
                          ? Colors.redAccent
                          : Colors.white),
                ),
                padding: EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    int preIndex = controller.currentIndex;
                    if (index > 1) {
                      if (index > preIndex) {
                        _scrollController.animateTo(140.0 * (index),
                            curve: Curves.linear,
                            duration: Duration(milliseconds: 200));
                      } else if (index == preIndex) {
                      } else {
                        _scrollController.animateTo(140.0 * (index - 1),
                            curve: Curves.linear,
                            duration: Duration(milliseconds: 200));
                      }
                    }
                    controller.currentIndex = index;
                    controller.update();
                    // controller.update(["big_image"]);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      snapshot.data!.hits[index].webformatUrl,
                      fit: BoxFit.fitWidth,
                      height: 100,
                      width: 140,
                    ),
                  ),
                ),
              );
            });
      },
    );
  }

  Container stageType(AsyncSnapshot<Welcome> snapshot) {
    return Container(
        color: Colors.blueGrey,
        child: new StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: snapshot.data!.hits.length,
          itemBuilder: (BuildContext context, int index) => new Container(
              color: Colors.grey,
              margin: EdgeInsets.all(5),
              child: new Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                        flex: 8,
                        child: GestureDetector(
                          onTap: () {
                            Get.bottomSheet(Container(
                              height: 500,
                              color: Colors.white,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: FadeInImage.assetNetwork(
                                  image:
                                      snapshot.data!.hits[index].webformatUrl,
                                  placeholder: "assets/icon/ic_launcher.png",
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                ),
                              ),
                            ));
                          },
                          child: Image.network(
                            snapshot.data!.hits[index].largeImageUrl,
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.white,
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.favorite, color: Colors.red, size: 20),
                              Text(
                                " ${snapshot.data!.hits[index].likes}",
                                style: TextStyle(color: Colors.blue),
                              ),
                              SizedBox(width: 10, height: 10),
                              Icon(Icons.person, color: Colors.green, size: 20),
                              Text(
                                " ${snapshot.data!.hits[index].collections.toString()}",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              )),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2 : 1.5),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        )
        // Text("${_logInController.obs.toString()}"),
        //Obx(()=>Container(child: Text("${_logInController.obs.toString()}"),)),
        );
  }
}
