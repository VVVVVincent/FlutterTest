import 'package:flutter/material.dart';
import 'package:lhj_test/dartTest/home.dart';
import 'package:lhj_test/dartTest/test_1.1_widget.dart';
import 'package:lhj_test/dartTest/test_1.2_text.dart';
import 'package:lhj_test/dartTest/test_1.3_button.dart';
import 'package:lhj_test/dartTest/test_1.4_iconImg.dart';
import 'package:lhj_test/dartTest/test_1.5_checkbox.dart';

/* 
应用入口
*/
void main() => runApp(MyApp());

/* 
应用结构
*/
class MyApp extends StatelessWidget {
  @override
  // flutter在构建UI时，会调用build方法，widget的主要工作是提供一个build()方法来描述如何构建UI界面
  Widget build(BuildContext context) {
    return MaterialApp(
      // 应用名称
      title: 'Flutter Demo',
      // 应用主题
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      // 命名路由，注册路由表
      routes: {
        // key是一个字符串，为路由的名称。value是个builder回调函数，用于生成相应的widget
        // "new_page":(context)=>NewRoute(),
        // "new_page":(context)=>ImgRoute(),
        // "new_page":(context)=>WidgetText(),
        // "new_page":(context)=>TextWidget(),
        // "new_page":(context)=>ButtonWidget(),
        // "new_page":(context)=>IconImgWidget(),
        "new_page":(context)=>SwitchAndCheckBoxTest(),

      },

      // 应用的首页路由Route（即页面，在iOS中相当于VC）
      home: MyHomePage(title: '首页'),
    );
  }
}