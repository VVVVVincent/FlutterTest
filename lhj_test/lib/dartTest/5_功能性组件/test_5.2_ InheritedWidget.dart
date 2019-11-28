import 'package:flutter/cupertino.dart';

/*
 * InheritedWidget（数据共享）
 * 是Flutter中非常重要的一个功能型组件，它提供了一种数据在widget树中从上到下传递、共享的方式，
 * 比如我们在应用的根widget中通过InheritedWidget共享了一个数据，那么我们便可以在任意子widget中来获取该共享的数据！
 */

// -----计数器”示例应用程序的InheritedWidget版本
// class ShareDataWidget extends InheritedWidget {
//   ShareDataWidget ({
//     @required this.data,
//     Widget child
//   }) : super(child: child);

//   // 需要在子树中共享的数据，保存点击次数 
//   final int data;

//   // 定义一个快捷方法，方便子树中的widget获取共享数据
//   static ShareDataWidget of(BuildContext ctx) {
//     return ctx.inheritFromWidgetOfExactType(ShareDataWidget);
//   }

//   // 该回调决定当data发生变化时，是否通知子树中依赖data的Widget

// }