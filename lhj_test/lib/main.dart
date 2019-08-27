import 'package:flutter/material.dart';
import 'package:lhj_test/dartTest/home.dart';
import 'package:lhj_test/dartTest/test_1.1_Widget.dart';
import 'package:lhj_test/dartTest/test_1.2_Text.dart';
import 'package:lhj_test/dartTest/test_1.3_Button.dart';
import 'package:lhj_test/dartTest/test_1.4_IconImg.dart';
import 'package:lhj_test/dartTest/test_1.5_Checkbox.dart';
import 'package:lhj_test/dartTest/test_1.6_TextFiled.dart';
import 'package:lhj_test/dartTest/test_2.1_RowColumn.dart';
import 'package:lhj_test/dartTest/test_2.2_Flex.dart';
import 'package:lhj_test/dartTest/test_2.3_WarpOrFlow.dart';
import 'package:lhj_test/dartTest/test_2.4_StackOrPositioned.dart';
import 'package:lhj_test/dartTest/test_2.5_Align.dart';
import 'package:lhj_test/dartTest/test_3.1_Padding.dart';
import 'package:lhj_test/dartTest/test_3.2_ConstrainedBox.dart';

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
        // "new_page":(context)=>SwitchAndCheckBoxTest(),
        // "new_page":(context)=>FiledWidget(),
        // "new_page":(context)=>LineWidget(),
        // "new_page":(context)=>FlexWidget(),
        // "new_page":(context)=>WrapFlowTest(),
        // "new_page":(context)=>StackPositionedWidget(),
        // "new_page":(context)=>AlignWidget(),
        // "new_page":(context)=>PaddingRoute(),
        "new_page":(context)=>SizeLimitWidget(),


      },

      // 应用的首页路由Route（即页面，在iOS中相当于VC）
      home: MyHomePage(title: '首页'),
    );
  }
}