import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
/*
Text -- Text用于显示简单样式文本，它包含一些控制文本显示样式的一些属性
 */

// ****************Text基本属性设置
class Text1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Text(
      "hello world" * 1,                // 字符串显示N遍
      textAlign: TextAlign.center,      // 对齐方式
      maxLines: 5,                      // 行数
      overflow: TextOverflow.ellipsis,  // 满行时显示样式，以省略号显示
      textScaleFactor: 2,               // 缩放倍数
      style: TextStyle(
        color: Colors.blue,
        fontSize: 18.0,
        height: 1.2,
        fontFamily: "Courier",
        background: new Paint()..color = Colors.yellow,
        decoration: TextDecoration.underline,//设置下划线
        decorationStyle: TextDecorationStyle.dashed// 下划线样式为虚线
      ),// 字体样式
    );
  }
}

// ***************TextSpan:同一段字符串分多种格式显示
class Text2 extends StatelessWidget {

  Widget build(BuildContext context){
    return Text.rich(TextSpan(
      children: [
        TextSpan(
          text: "home: ",
          style: TextStyle(
            fontSize: 25.0
          ),
        ),

        TextSpan(
          text: "https://baidu.com",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18.0
          ),
          // recognizer: ...//点击效果
        ),
      ]
    )
    );
  }
}

// **************DefaultTextStyle文本默认样式，如果在某一个节点widget里设置了文本默认样式，那该节点所有文字都会默认该样式
class Text3 extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return DefaultTextStyle(
    // 设置文本默认样式
      style:TextStyle(
        color: Colors.red,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.start,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hi"),// 使用默认样式
          Text("What`s your name ？"),// 使用默认样式
          Text(
            "My name is jack",
            style: TextStyle(
              // 不使用默认样式
              inherit: false,
              color: Colors.green,
              fontSize: 30.0,
            ),

          ),
        ],
      ),

    );
  }
}

class Text4 extends StatelessWidget {

  Widget build(BuildContext context) {

    const textStyle = const TextStyle(
    fontSize: 20.0,
    color: Colors.red
    );

    return ButtonBar(
      alignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Use the font for this text",
          style: textStyle,

        ),
      ],
    );
  }
}



// --------------专用于调用
class TextWidget extends StatelessWidget {
  Widget build(BuildContext context) {
      return Scaffold (
    appBar: AppBar(
      title: Text("Text学习"),
      backgroundColor: Colors.grey,
    ),


    body: Center(
      // child: Text1(),
      // child: Text2(),
      child:Text3(),
      // child: Text4(),
      ),
    );
  }
}