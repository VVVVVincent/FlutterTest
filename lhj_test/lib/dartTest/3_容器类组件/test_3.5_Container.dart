import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/*
Container:组合类容器:
它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等组件组合的一个多功能容器;
所以我们只需通过一个Container组件可以实现同时需要装饰、变换、限制的场景;

注意：
1.容器的大小可以通过width、height属性来指定，也可以通过constraints来指定；
如果它们同时存在时，width、height优先。

2.color和decoration是互斥的，如果同时设置它们则会报错
 */

class ContainerTest extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text("Container组合类容器学习")),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50,left: 50,bottom: 100),// 外边距
            // 设置大小
            width: 200,
            height: 200,
            // constraints: BoxConstraints.tightFor(width: 200, height: 200),

            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.red, Colors.orange]),//渐变背景
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(5, 5),
                  blurRadius: 5.0
                  ),
              ],// 设置阴影
            ),
            transform: Matrix4.skewY(0.3),
            alignment: Alignment.center,
            child: Text(
              "你好", style: TextStyle(color: Colors.white,fontSize: 40.0),
              ),
          ),

          Container(
            padding: EdgeInsets.all(10.0),//设置内边距
            color: Colors.orange,
            child: Text("hello"),
          ),

        ],
      ),
    );
  }
}