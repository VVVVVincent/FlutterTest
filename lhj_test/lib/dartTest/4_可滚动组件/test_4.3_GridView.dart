import 'package:flutter/material.dart';

//--------
class GridViewTest1 extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return GridView(
      // 下面代码等价于GridView.count
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 3,//横轴三个元素
      //   childAspectRatio: 1,// 宽高比为1
      //   ),
      // 下面代码等价于GridView.extent
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 120,// 子元素在横轴上的最大长度
        childAspectRatio: 2.0,//宽高比
      ),

      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast)
      ],
    );
  }
}

// --------动态设置子元素
class GridViewTest2 extends StatefulWidget {
  @override
  _GridViewTest2State createState()=> new _GridViewTest2State();

}

class _GridViewTest2State extends State <GridViewTest2> {
  List <IconData> _icons = [];

  @override
  void initState() {
    super.initState();
    // 更新数据
    _receivedata();
  }

  // 模拟异步请求数据
  void _receivedata() {
    Future.delayed(Duration(milliseconds: 200)).then((e){
      setState(
        (){
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access, Icons.cake,
          Icons.free_breakfast]);
        });
     });
  }

  Widget build(BuildContext ctx) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,//每行三个
        childAspectRatio: 2,//宽高比
        // crossAxisSpacing: 10.0,
        // mainAxisSpacing: 10.0,
      ),
      itemCount: _icons.length,
      itemBuilder: (BuildContext ctx, int index) {
        // 如果显示到最后一个并且Icon总数小于200时继续获取数据
        if((index == _icons.length - 1) && _icons.length < 200)
        {
          _receivedata();
        }
        return Icon(_icons[index]);
      },
    );
  }
}

//-----------
class GridViewTest extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text("GridView学习"),),
      // body: GridViewTest1(),
      body: GridViewTest2(),
    );
  }
}