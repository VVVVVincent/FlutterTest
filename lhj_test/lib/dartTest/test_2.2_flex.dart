import 'package:flutter/material.dart';

// 弹性布局：允许子widget按照一定比例来分配父容器空间

/*
Flex：
可以沿着水平或垂直方向排列子widget；
Row和Column都继承自Flex，参数基本相同；
所以能使用Flex的地方一定可以使用Row或Column；

Expanded：
可以按比例“扩伸”Row、Column和Flex子widget所占用的空间
 */

class FlexWidget extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹性布局学习"),
        backgroundColor: Colors.grey,
      ),
      body: Column(
      children: <Widget>[
        //////
        Flex(
          direction: Axis.horizontal,// 水平方向分布
          children: <Widget>[
            Expanded(
              flex: 1,//弹性系数，如果为0或者null，则没有弹性
              child: Container(
                height: 30,
                color: Colors.yellow,
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                height: 50,
                color: Colors.red,
              ),
            )
          ],
        ),

        //////
        Padding(
          padding: const EdgeInsets.only(top: 20.0),//内容偏移量
          child: SizedBox(
            height: 100,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.blue,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                )
              ],
            ),
          )
         )
        ],
      )
    );
  }
}

