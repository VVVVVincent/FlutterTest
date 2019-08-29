import 'package:flutter/material.dart';

/*
线性布局Row和Column：
是指沿水平或垂直方向布局子widget，row和column都继承于flex

主轴和纵轴：
如果是沿水平方向，主轴就是水平，纵轴就是垂直，如果是沿垂直方向，主轴就是垂直方向，纵轴就是水平方向
 */

/*-----Row:
textDirection:水平方向的布局顺序，从左往右或者从右往左
mainAxisSize：表示row在主轴方向占用的空间
mainAxisAlignment：表示子Widgets在Row所占用的水平空间内对齐方式
verticalDirection：表示纵轴方向的的对齐方向
*/
class RowTest extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("你好"),
        Text("嘿嘿"),
        
      ],
    );
  }
}

/*Column：
垂直方向排列子widget，参数同Row
 */

class LineWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局练习"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.green,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,// 此处设置有效，外层column高度为整个屏幕
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Column(
                mainAxisSize: MainAxisSize.max,//无效，内层column高度为实际高度
                children: <Widget>[
                  Text("hello world"),
                  Text("I am lili"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}