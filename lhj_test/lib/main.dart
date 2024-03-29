import 'package:flutter/material.dart';
import 'package:lhj_test/dartTest/home.dart';
import 'package:lhj_test/dartTest/1_基础组件/test_1.1_Widget.dart';
import 'package:lhj_test/dartTest/1_基础组件/test_1.2_Text.dart';
import 'package:lhj_test/dartTest/1_基础组件/test_1.3_Button.dart';
import 'package:lhj_test/dartTest/1_基础组件/test_1.4_IconImg.dart';
import 'package:lhj_test/dartTest/1_基础组件/test_1.5_Checkbox.dart';
import 'package:lhj_test/dartTest/1_基础组件/test_1.6_TextFiled.dart';
import 'package:lhj_test/dartTest/2_布局类组件/test_2.1_RowColumn.dart';
import 'package:lhj_test/dartTest/2_布局类组件/test_2.2_Flex.dart';
import 'package:lhj_test/dartTest/2_布局类组件/test_2.3_WarpOrFlow.dart';
import 'package:lhj_test/dartTest/2_布局类组件/test_2.4_StackOrPositioned.dart';
import 'package:lhj_test/dartTest/2_布局类组件/test_2.5_Align.dart';
import 'package:lhj_test/dartTest/3_容器类组件/test_3.1_Padding.dart';
import 'package:lhj_test/dartTest/3_容器类组件/test_3.2_ConstrainedBox.dart';
import 'package:lhj_test/dartTest/3_容器类组件/test_3.3_DecoratedBox.dart';
import 'package:lhj_test/dartTest/3_容器类组件/test_3.4_Tranform.dart';
import 'package:lhj_test/dartTest/3_容器类组件/test_3.5_Container.dart';
import 'package:lhj_test/dartTest/3_容器类组件/test_3.6_Clip.dart';
import 'package:lhj_test/dartTest/4_可滚动组件/test_4.1_SingleChildScrollView.dart';
import 'package:lhj_test/dartTest/4_可滚动组件/test_4.2_ListView.dart';
import 'package:lhj_test/dartTest/4_可滚动组件/test_4.3_GridView.dart';
import 'package:lhj_test/dartTest/4_可滚动组件/test_4.4_CustomScrollView.dart';
import 'package:lhj_test/dartTest/4_可滚动组件/test_4.5_ ScrollController.dart';
import 'package:lhj_test/dartTest/5_功能性组件/test_5.1_ WillPopScope.dart';
import 'package:lhj_test/dartTest/5_功能性组件/test_5.2_ InheritedWidget.dart';



import 'package:lhj_test/dartTest/CheckTrust.dart';


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
        brightness:Brightness.light,
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
        // "new_page":(context)=>SizeLimitWidget(),
        // "new_page":(context)=>DecoratedBoxTest(),
        // "new_page":(context)=>TransformTest(),
        // "new_page":(context)=>ContainerTest(),
        // "new_page":(context)=>ClipText(),
        // "new_page":(context)=>SingleScrollViewTest(),
        // "new_page":(context)=>ListViewTest(),
        // "new_page":(context)=>GridViewTest(),
        // "new_page":(context)=>CustomScrollViewTest(),
        // "new_page":(context)=>ScrollControllerTest(),
        // "new_page":(context)=>WillPopScopeRoute(),
        "new_page":(context)=>InheritedWidgetTestRoute(),



        // "new_page":(context)=>CheckTrustRoute(),
      },

      // 应用的首页路由Route（即页面，在iOS中相当于VC）
      home: MyHomePage(title: '首页'),
    );
  }
}