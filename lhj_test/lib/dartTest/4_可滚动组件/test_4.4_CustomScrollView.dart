import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*
CustomScrollView
是可以使用Sliver来自定义滚动模型（效果）的组件。它可以包含多种滚动模型

实际上Sliver版的可滚动组件和非Sliver版的可滚动组件最大的区别就是：
前者不包含滚动模型（子身不能再滚动），而后者包含滚动模型
 */

class CustomScrollViewTest extends StatelessWidget {
  @override 
  Widget build(BuildContext ctx) {
    return Material(
      child: CustomScrollView(
        // 需要粘连在一起的滑动碎片
        slivers: <Widget>[
          // 头部
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("CustomScrollView学习"),
              background: Image.asset("lib/images/cus.jpg", fit: BoxFit.cover),
            ),
          ),

          // SliverGrid一个两列，宽高比为4的网格，它有20个子组件
          SliverPadding(
            padding: EdgeInsets.all(10.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4,
              ),
              delegate: SliverChildBuilderDelegate((BuildContext context, int index)
              {
                return  Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
               },
               childCount: 20,
              ),
            ),
          ),
          
          // list
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate(
              (BuildContext ctx, int index){
                // 创建列表页
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: new Text('list item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}