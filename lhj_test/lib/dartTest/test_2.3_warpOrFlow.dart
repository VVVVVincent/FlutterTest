import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
在学习row和column时，如果子widget超过屏幕尺寸，就会报错，因为row默认只有一行，不会折行
我们把超出屏幕显示范围会自动折行的布局称为流式布局。
Flutter中通过Wrap和Flow来支持流式布局
*/

/*
Wrap：
spacing:主轴方向子widget的间距
runSpacing：纵轴方向的间距
runAlignment：纵轴方向的对齐方式
 */
class WrapTest extends StatelessWidget {
  @override 
  Widget build(BuildContext ctx) {
    return Wrap(
      spacing: 10.0,// 主轴方向间距
      runSpacing: 5.0,// 纵轴方向间距
      alignment: WrapAlignment.start,// 主轴方向对齐方式
      children: <Widget>[
        new Chip(
          avatar: new CircleAvatar(backgroundColor:Colors.blue, child: Text("A")),
          label: new Text("appleeeeeeee"),
        ),
        new Chip(
          avatar: new CircleAvatar(backgroundColor:Colors.blue, child: Text("B")),
          label: new Text("boyyyyyyyy"),
        ),
        new Chip(
          avatar: new CircleAvatar(backgroundColor:Colors.blue, child: Text("C")),
          label: new Text("catttttttt"),
        ),
        new Chip(
          avatar: new CircleAvatar(backgroundColor:Colors.blue, child: Text("D")),
          label: new Text("dogggggggg"),
        ),
      ],
    );
  }
}


/*
Flow:
一般很少会使用Flow，因为其过于复杂，需要自己实现子widget的位置转换;
Flow主要用于一些需要自定义布局策略或性能要求较高(如动画中)的场景;
性能好、灵活  但是使用复杂，不能自适应子widget大小
 */
class FlowTest extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return Flow(
      delegate: FlowTestDelegate(margin: EdgeInsets.all(10.0)),
      children: <Widget>[
        new Container(width: 80.0, height:80.0, color: Colors.red,),
        new Container(width: 80.0, height:80.0, color: Colors.green,),
        new Container(width: 80.0, height:80.0, color: Colors.blue,),
        new Container(width: 80.0, height:80.0,  color: Colors.yellow,),
        new Container(width: 80.0, height:80.0, color: Colors.brown,),
        new Container(width: 80.0, height:80.0,  color: Colors.purple,),
      ],
    );
  }
}

// 实现代理
class FlowTestDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  FlowTestDelegate({this.margin});

  @override 
  void paintChildren(FlowPaintingContext context)
  {
    var x = margin.left;
    var y = margin.top;
    // 计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) 
    {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) 
      {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      }
       else 
       {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)  
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
         x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }

  }

  @override
  // 指定flow的大小
  Size getSize(BoxConstraints constraints)
  {
    return Size(double.infinity, 200);
  }

  @override
  bool shouldRelayout(covariant FlowDelegate oldDelegate)
  {
    return oldDelegate != this;
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate)
  {
    return oldDelegate != this;
  }
}




class WrapFlowTest extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("流性布局学习"),
      ),

      body: Column(
        children: <Widget>[
          WrapTest(),
          FlowTest(),
        ],
      ),
    );
  }
}