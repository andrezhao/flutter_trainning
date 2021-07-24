
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_test_flutter/app/utils/strings.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);
  @override
  _MianPageState createState() => _MianPageState();
}
class _MianPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        centerTitle: true,  // 中央寄せを解除//设置没有返回按钮
        title: new Text(MyPageTitle),

      ),
      body: Center(
        child: Text(MyPageTitle),
      ),
    );
  }
}
