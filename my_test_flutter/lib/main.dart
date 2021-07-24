import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/modules/splash_module/splash_page.dart';

//MaterialAppをGetMaterialAppに置き換える
void main() => runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    ));

class Controller extends GetxController {
  //obsをつけると変更を監視できるようになる。
  var count = 0.obs;

  increment() => count++;
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // Get.put()を使ってクラスをインスタンス化し、配下のウィジェットで利用できるようにする。
    final Controller c = Get.put(Controller());

    return Scaffold(
        // カウントが変更されるたびにText()を更新するためにObx(()=>を使用します。
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // Get.to()で画面遷移ができる。Navigatorに比べたらめちゃくちゃ簡単
        body: Center(
            child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("スナックバーを表示します")),
            OutlineButton(
              onPressed: () {
                print("OutlineButton");
              },
              child: Text("OutlineButton"),
            ),
            TextButton.icon(
                onPressed: () {
                  print("TextButton.icon");
                },
                icon: Icon(Icons.local_florist),
                label: Text("TextButton.icon")),
            ElevatedButton(
              child: Text("ボトムシートを表示します"),
              onPressed: () {
                Get.bottomSheet(Container(
                  height: 500,
                  color: Colors.white,
                  child: Center(
                    child: Text("ボトムシートだよ、コンテキスト必要ないよ"),
                  ),
                ));
              },
            ),
          ],
        )));
  }
}

class Other extends StatelessWidget {
  // 他のページで使われているコントローラーを見つけて、それを使用できる。
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // 更新された変数にアクセス
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}
