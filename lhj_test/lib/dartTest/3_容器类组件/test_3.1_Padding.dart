import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
Padding(填充)
padding属性：
fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向的填充。
all(double value) : 所有方向均使用相同数值的填充。
only({left, top, right ,bottom })：可以设置具体某个方向的填充(可以同时指定多个方向)。
symmetric({ vertical, horizontal })：用于设置对称方向的填充，vertical指top和bottom，horizontal指left和right。
 */

class PaddingRoute extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text("Padding填充学习"),),
      body: Padding(
        padding: EdgeInsets.all(50.0),// 上下左右各添加50像素留白
        child: Column(
          // 显示指定对齐方式为左对齐，排除对齐干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              // 左边添加8像素补白
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("左边添加8像素留白"),
            ),
            Padding(
              // 上下各添加8像素补白
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("上下各添加8像素留白"),
            ),
            Padding(
              // 分别指定4个方向的补白
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),//左上右下
              child: Text("分别指定4个方向的补白"),
            ),
          ],
        ),
      ),
    );
  }
}