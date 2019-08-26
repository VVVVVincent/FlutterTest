import 'package:flutter/material.dart';

/*
align和stack对比：
相似点：都是用于指定子元素相对父元素的偏移

区别：
1.定位系统不同：
Stack/Positioned定位的的参考系可以是父容器矩形的四个顶点；
而Align则需要先通过alignment 参数来确定坐标原点，
不同的alignment会对应不同原点，最终的偏移是需要通过alignment的转换公式来计算出；
2.Stack可以有多个子元素，并且子元素可以堆叠，而Align只能有一个子元素，不存在堆叠。
 */

class AlignWidget extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text("对齐与相对定位学习")),
      body: Container(
        // height: 200,
        // width: 200,
        
        color: Colors.orange,
        child: Align(
          /* 
          设置内容偏移量计算公式
          Alignment = (Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight+childHeight/2)
          FractionalOffset = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)
          */
          // alignment: Alignment.topRight,
          // alignment: Alignment(2, 0.0),//(90,30)
          alignment: FractionalOffset(0.2, 0.6),//(12,36)
          
          widthFactor: 2,
          heightFactor: 2,
          child: FlutterLogo(
            size: 60,// 如果不指定宽高，但是指定了widthFactor值，则宽值为size*widthFactor，高值同理
          ),
        ),
      ),
    );
  }
}