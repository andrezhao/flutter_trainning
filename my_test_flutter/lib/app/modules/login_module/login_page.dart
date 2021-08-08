import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_flutter/app/Http/request_api.dart';
import 'package:my_test_flutter/app/modules/login_module/login_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LoginPage extends GetView<LoginController> {
  @override
  var _logInController = Get.put<LoginController>(LoginController());
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());

    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/icon/snow.jpg"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputName(),
            SizedBox(height: 30, width: 100),
            inputPw(),
            SizedBox(height: 30, width: 100),
            loginButton(),
          ],
        ),
      ),
    );
  }

  Widget inputName() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextField(
        decoration: new InputDecoration(
          hintText: "请输入ID",
          prefixIcon: Icon(
            Icons.person,
            color: Colors.red,
          ),
          //helperText: "姓名输入",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.withOpacity(1.0)),
            borderRadius: BorderRadius.circular(30),
          ),

          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.withOpacity(1.0)),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.withOpacity(1.0)),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            _logInController.loginRequest("","");
          },
          child: Text("登录")),
    );
  }

  Widget inputPw() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextField(
        decoration: new InputDecoration(
          hintText: "请输入PASSWORD",
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.red,
          ),
          //helperText: "姓名输入",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.withOpacity(1.0)),
            borderRadius: BorderRadius.circular(30),
          ),

          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.withOpacity(1.0)),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.withOpacity(1.0)),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
