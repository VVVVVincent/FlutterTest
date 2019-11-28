import 'package:flutter/material.dart';

/*
ScrollController:滚动的监听及控制
 */
class ScrollControllerTest extends StatefulWidget {
  _ScrollControllerTestState createState() => new _ScrollControllerTestState();
}

class _ScrollControllerTestState extends State<ScrollControllerTest> {
  //keepScrollOffset 是否存储滚动位置
  ScrollController _controller = new ScrollController(keepScrollOffset: true);
  bool showTopBtn = false;//是否显示回到顶部按钮

  @override 
  void initState() {
    super.initState();
    // 监听滚动事件，打印滚动位置
    _controller.addListener((){
      print("--------$_controller.offset");// 打印滚动位置

      // 如果滚动像素超过10000，显示回到顶部按钮，反之隐藏
      if(_controller.offset >= 1000 && showTopBtn == false)
      {
        setState(() {
          showTopBtn = true;
        });
      }
      else if(_controller.offset < 1000 && showTopBtn == true) 
      {
        setState(() {
          showTopBtn = false;
        });
      }
    }); 
  }

  @override 
  void dispose() {
    // 为了避免内存泄漏,调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override 
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动监听及控制"),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 100,
          itemExtent: 50.0,
          controller: _controller,// 设置监听
          itemBuilder: (BuildContext ctx, int index){
            return ListTile(title: Text("$index"),);
          },
          
        ),
      ),

      floatingActionButton: showTopBtn == false?null:FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          // 获取_controller被几个滚动组件所使用
          print(_controller.positions.length);
          // 回到顶部
          _controller.animateTo(.0,
              duration: Duration(milliseconds:200),
              curve: Curves.ease
          );
        },
      ),
    );
  }
}