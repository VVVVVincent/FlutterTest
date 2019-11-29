import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';

// --------1.少量组件时
class ListViewTest1 extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return ListView(
      // 该属性表示是否根据子组件的总长度来设置ListView的长度，默认值为false
      shrinkWrap: true,
      // itemExtent: 50,// 代表子视图的宽度或高度
      padding: EdgeInsets.all(20),
      children: <Widget>[
        const Text('I\'m dedicating every day to you'),
        const Text('Domestic life was never quite my style'),
        const Text('When you smile, you knock me out, I fall apart'),
        const Text('And I thought I was so smart'),
      ],
    );
  }
}


// ------ 2.子组件过多不带分割组件
class ListViewTest2 extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return ListView.builder(
      itemCount: 50,// 子组件
      itemExtent: 50.0,//子组件高度
      // 返回一个widget构造器
      itemBuilder:(BuildContext context, int index){
        return ListTile(title: Text("$index"),);
      },
    );
  }
}

//----------3.子组件过多带分割组件
class ListViewTest3 extends StatelessWidget {
  Widget build(BuildContext ctx) {
    Widget divider1 = Divider(color: Colors.red,);// 红色分割线
    Widget divider2 = Divider(color: Colors.blue,);// 蓝色分割线
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (BuildContext ctx, int index) {
        return ListTile(title: Text("$index"),);
      },
      separatorBuilder: (BuildContext ctx, int index) {
        return index % 2 == 0?divider1:divider2;//奇数蓝色，偶数红色
      },
    );
  }
}

// --------4. 无限加载
class ListViewTest4 extends StatefulWidget {
  @override
  _ListViewTest4State createState() => new _ListViewTest4State();
}

class _ListViewTest4State extends State <ListViewTest4> {
  //结尾标记
  static const loadingText = "##loading##";
  var _words = <String> [loadingText];

  @override
  void initState () {
    super.initState();
    _retrieveData();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
      });
    });
  }

  Widget build(BuildContext ctx) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (BuildContext ctx, int index) {
        // 表尾
        if(_words[index] == loadingText)
        {
          if(_words.length - 1 < 100) 
          {
            // 数据不足100条 获取数据
            _retrieveData();

            return Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                width: 25.0,
                height: 25.0,
                child: CircularProgressIndicator(strokeWidth: 2.0,),
              ),
            );
          }
          else
          {
            //已经加载了100条,不再加载
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: Text("没有更多了！", style:TextStyle(color:Colors.grey)),
            );
          }
        }

        // 每一行
        return ListTile(title: Text("$index"),);
      },
      separatorBuilder: (BuildContext ctx, int index) {
        return Divider(color: Colors.blue,);
      },
    );
  }
}

// ---------------5.带头视图的滚动视图
class ListViewTest5 extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return Column(
      children: <Widget>[
        ListTile(title: Text("数字展示"),),
        
        Expanded(
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext ctx, int index) {
              return ListTile(title: Text("$index"),);
            },
          ),
        ),
      ],
    );
  }
}


//---------------------
class ListViewTest extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView学习"),),
      // body: ListViewTest1(),
      // body: ListViewTest2(),
      // body: ListViewTest3(),
      // body: ListViewTest4(),
      body: ListViewTest5(),
    );
  }
}