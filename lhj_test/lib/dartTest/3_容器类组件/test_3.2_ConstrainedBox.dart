import 'package:flutter/material.dart';

/*
尺寸限制类容器：
尺寸限制类容器用于限制容器大小，Flutter中提供了多种这样的容器，
如ConstrainedBox、SizedBox、UnconstrainedBox、AspectRatio等
 */

//--------1.ConstrainedBox（用于对子组件添加额外的约束）
class ConstrainedBoxTest extends StatelessWidget {
  @override 
  Widget build(BuildContext ctx) {
    Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );
    return ConstrainedBox(
        // 最小高度为50,宽度尽可能大
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: 50.0,
        ),
        // 也可以定制长宽
        // constraints: BoxConstraints.tightFor(width: 80.0,height: 80.0),
        child: Container(
          height: 5.0,
          child: redBox,
        ),
      );
  }
}

//---------2.SizeBox用于给元素指定固定的宽高
class SizeBoxTest extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return SizedBox(
      width: 80,
      height: 80,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.blue),
      ),
    );
  }
}

//----------3.多重限制
class MuchLimitTest extends StatelessWidget {
  Widget build(BuildContext ctx) {
    // 最终显示为100*100，多重最小长度或宽度，取最大值
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 100,minHeight: 50),// 父最小长宽限制
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 50,minHeight: 100),// 子最小长宽限制
        child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.yellow),
       ),
      ),

      // -----------4.UnconstrainedBox（取消子视图按父限制尺寸显示,允许其子组件按照其本身大小绘制，但是子视图所在的父容器尺寸不变）
      // child:UnconstrainedBox(
      //   child: ConstrainedBox(
      //     constraints: BoxConstraints(minWidth: 100,minHeight: 30),
      //     child: DecoratedBox(
      //       decoration: BoxDecoration(color: Colors.yellow),
      //     ),
      //   ),
      // ),
    );
  }
}

//////////////////////////////////
class SizeLimitWidget extends StatelessWidget {
    @override 
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("尺寸限制器学习"),
        actions: <Widget>[
          UnconstrainedBox(
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: SizedBox(
                width: 20,
                height: 20,
                child: IconButton(
                  icon: Icon(Icons.accessibility_new),
                  onPressed: (){
                    print("你好");
                  },
                ),
              ),
            ),
          )
        ],
        ),
      
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: ConstrainedBoxTest(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: SizeBoxTest(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: MuchLimitTest(),
          ),
        ],
      )
    );
  }
}