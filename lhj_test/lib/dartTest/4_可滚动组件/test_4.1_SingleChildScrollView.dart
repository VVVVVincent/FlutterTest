import 'package:flutter/material.dart';

/*
SingleChildScrollView类似于Scrollview，只接收一个组件
 */

class SingleScrollViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(title: Text("SingleChildScrollView学习"),),
      body: Scrollbar(// 显示进度条
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: (
              // 动态创建list
              str.split("").map(
                (c) => Text(c,textScaleFactor: 2.0)
              ).toList()
            ),
          ),
         ), 
        ),
      ),
    );
  }
}