import 'package:flutter/material.dart';

/*
Button:
Material widget库中提供了多种按钮Widget;
RaisedButton、FlatButton、OutlineButton等,都直接或间接对RawMaterialButton的包装定制;
所有Material 库中的按钮都有如下相同点:
1.按下时都会有“水波动画”。
2.有一个onPressed属性来设置点击回调，当按钮按下时会执行该回调，如果不提供该回调则按钮会处于禁用状态,无点击效果
 */

void _pressed () {
    print("点了点了");
}

//*********RaisedButton(漂浮按钮)，默认带阴影和灰色背景，按下后阴影会变大
class RaisedButtonWidget extends StatelessWidget {
  
  Widget build(BuildContext context) {
    const textStyle = const TextStyle(
      color:  Colors.black,
      fontSize: 20.0
    );
    return RaisedButton(
      child: Text(
        "RaisedButton",
        style: textStyle,//优先取决于这个设置字体颜色
      ),
      // color: Colors.red,//背景颜色
      textColor: Colors.yellow,// 设置字体颜色
      onPressed: _pressed,
    );
  }
}

// *************FlatButton(扁平化按钮)，默认背景颜色透明并不带阴影，按下后会有背景色
class FlatButtonWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return FlatButton(
      // child: Image.asset('lib/images/二维码@2x.png'),
      child: Column(
        children: <Widget>[
          Text("FlatButton"),
          Image.asset('lib/images/删除@2x.png'),//设置背景图片
            ],
      ),
      color: Colors.yellow,
      onPressed: _pressed,
    );
  }
}

// ****************OutlineButton(默认带边框)，不带阴影且背景透明，按下后边框颜色变亮，同时出现较弱的背景和阴影
class OutlineButtonWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text("OutlineButton"),
      onPressed: _pressed,
      borderSide: BorderSide(
        color: Colors.orange,// 边框颜色
        width: 3,//边框宽度
        style: BorderStyle.solid,// 边框样式
      ),
    );
  }
}

// *************IconButton(可点击的Icon)，不包括文字，默认没有背景颜色，点击后会出现背景色
class IconButtonWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.thumb_up),
      onPressed: _pressed,
    );
  }
}

// *************自定义按钮（可以自定义任意一个类型的按钮外观颜色等）
class CusButtonWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(""),
      onPressed: _pressed,
      textColor: Colors.cyan,

    );

  }
}


class ButtonWidget extends StatelessWidget {

    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Button学习"),
        ),

        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButtonWidget(),
              FlatButtonWidget(),
              OutlineButtonWidget(),
              IconButtonWidget(),

            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      );
    }

}