import 'package:flutter/material.dart';

/*
层叠布局:
子组件根据父视图四个角的位置来确定自己的位置，
Flutter中用Stack和Positioned两个组件来实现绝对定位，
Stack允许子组件重叠，而Positioned用于根据Stack的四个角来确定位置
 */
class StackPositionedWidget extends StatelessWidget {
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局学习"),
        backgroundColor: Colors.grey,
      ),

      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,//指定未定位或者部分定位widget的对齐方式
          // 未定位的widget占满整个屏幕，一旦打开了，由于stack是层叠的，所以第一个被第二个没定位占满屏的遮档了
          fit: StackFit.expand,
          children: <Widget>[
            // 指定了水平方向的坐标，垂直居中显示
            Positioned(
              left: 20.0,
              child: Text("我定位了左坐标"),
            ),

            // 没有指定任何定位，垂直和水平都居中显示
            Container(
              child: Text("我没有任何定位", style: TextStyle(color: Colors.white),),
              color: Colors.red,
            ),

            // 指定了垂直方向定位，则水平居中
            Positioned(
              top: 20.0,
              child: Text("我定位了上坐标"),
            )
          ],
        ),
      ),
    );
  }
}
