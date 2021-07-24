import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_test_flutter/app/utils/strings.dart';

class SystemPage  extends StatefulWidget {
  const SystemPage({Key? key}) : super(key: key);

  @override
  _SystemPageState createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> {
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        centerTitle: true,  // 中央寄せを解除//设置没有返回按钮
        title: new Text(SystemPageTitle),

      ),
      body: Center(
        child: Text(SystemPageTitle),
      ),
    );
  }
  }
