import 'package:flutter/material.dart';

/*
剪裁函数：
ClipOval:子组件为正方形时剪裁为内贴圆形，为矩形时剪裁为内贴椭圆；
ClipRRect：将子组件剪切为圆角矩形
ClipRect：剪裁子组件到实际占用的矩形大小（溢出部分剪裁）
 */

class ClipText extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    // 头像
    Widget avatar = Image.asset("lib/images/cus.jpg",width: 80,);
    return Scaffold(
      appBar: AppBar(title: Text("剪裁学习"),),
      body: Center(
        child: Column(
          children: <Widget>[
            // 不进行剪裁
            avatar,

            // 剪裁为圆形
            ClipOval(child: avatar,),

            // 剪裁为圆角矩形
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: avatar
            ),

            // 溢出部分不裁剪
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,// 宽度设为原来的一半
                  child: avatar,
                ),
                Text("你好世界", style:TextStyle(color:Colors.green)),
              ],
            ),

            // 溢出部分裁剪
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5,
                    child: avatar,
                  ),
                ),
                Text("你好世界", style:TextStyle(color:Colors.green)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

