import 'package:flutter/material.dart';

/*
WillPopScope： 导航返回拦截
为了避免用户误触返回按钮而导致APP退出，在很多APP中都拦截了用户点击返回键的按钮，然后进行一些防误触判断，
 */

class WillPopScopeRoute extends StatefulWidget {
  @override
  WillPopScopeRouteState createState(){
    return new WillPopScopeRouteState();
  }
}

class WillPopScopeRouteState extends State<WillPopScopeRoute> {
  DateTime _lastTime;//上次点击时间
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override 
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航拦截器学习"),
      ),
      body: WillPopScope(
        onWillPop: () async { 
          if (_lastTime == null || DateTime.now().difference(_lastTime) > Duration(seconds: 1))
          {
            // 两次点击间隔超过1秒，重新计时
            _lastTime = DateTime.now();
            return false;
          }
          // 间隔小于一秒，返回
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          child: Text("1秒内连续点击两次退出")
        ),
      ),
    );
  }
}