import 'package:flutter/material.dart';

/*
DecoratedBox:
可以在子组件绘制前或后绘制一些装饰，如背景，边框，渐变等
decoration:代表要绘制的装饰,通常使用BoxDecoration类，它是Decoration的子类
position：在什么时候绘制，在自组建以来前或者后
 */
class DecoratedBoxTest extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("装饰容器学习")),
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.cyan,
          gradient: LinearGradient(colors: [Colors.red,Colors.orange]),//背景渐变
          borderRadius: BorderRadius.circular(10.0),//圆角
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0,2.0),
              blurRadius: 4.0
            )
          ],//阴影,可以指定多个
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80,vertical: 20),
          child: Text("Login", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}