import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

/*
Transform可以在其子组件绘制时对其应用一些矩阵变换来实现一些特效;
Transform的变换是在绘制阶段，而不是在布局layout阶段，
所以无论其子组件如何变换，其占用的空间大小和位置都是固定不变的
 */

//-----变换
class TransformTest1 extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return Container(
      color: Colors.black,
      child: Transform(
        alignment: Alignment.topRight,//相对于坐标系原点的对齐方式
        transform: Matrix4.skewY(0.3),//沿y轴倾斜0.3弧度(Matrix4是一个4D矩阵)
        child: Container(
          padding: EdgeInsets.all(8.0),
          color: Colors.orange,
          child: Text("hello world"),
        ),
      ),
    );
  }
}

//-------平移
class TranslateTest extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      // 默认原点为左上角，左移20像素，向上平移5像素
      child: Transform.translate(
        offset: Offset(-20.0, -5.0),
        child: Text("hello world"),
      ),
    );
  }
}

//-----------旋转
class RotateTest extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Transform.rotate(
        // 旋转90度
        angle: math.pi / 2,
        child: Text("hello  world"),
      ),
    );
  }
}

//----------缩放
class ScaleTest extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,// 主轴对齐方式
      children: <Widget>[
        DecoratedBox(
        decoration: BoxDecoration(color: Colors.red),
        child:Transform.scale(
            scale: 1.5,
            child: Text("hello world"),
          ),
        ),
        Text("你好", style:TextStyle(color:Colors.green, fontSize:18.0))
      ],
    );
  }
}

//-----先平移再旋转 和 先旋转再平移对比
class CompareText extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // 先平移再旋转
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.cyan),
          child: Transform.translate(
            offset: Offset(-20, -5),
            child: Transform.rotate(
              angle: math.pi / 2,
              child: Text("先平移再旋转"),
            ),
          ),
        ),

        // 先旋转再平移
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.yellow),
          child: Transform.rotate(
            angle: math.pi / 2,
            child:  Transform.translate(
              offset: Offset(-20, -5),
              child: Text("先旋转再平移"),
            ),
          ),
        ),
      ],
    );
  }
}

/*----RotatedBox旋转变换，
与Transform.rorate功能相似，
但不同的是，RotatedBox是在layout阶段，会影响子组件布局
*/
class RotatedBoxTest extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: RotatedBox(
            quarterTurns: 1,//旋转90度
            child: Text("hello world"),
          ),
        ),
        Text("你好"),
      ],
    );
  }
}



////////////////////
class TransformTest extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform学习"),
      ),
      body:Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
              child:TransformTest1(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child:TranslateTest(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child:RotateTest(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child:ScaleTest(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child:CompareText(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child:RotatedBoxTest(),
            ),
          ],
        )
      ),
    );
  }
}