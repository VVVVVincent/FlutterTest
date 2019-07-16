import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// widget可以用来表示View或VC，Element表示其中的元素

/*
StatelessWidget：-> extend Widget
用于不需要构建状态的场景；
重写了createElement()方法
*/

// 自定义一个显示字符串的视图->此处表示一个view
class Ehco extends StatelessWidget 
{
  const Ehco({
      Key key,
      @required this.text,
      this.backgroundColor:Colors.grey,
    }):super(key:key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

/*
Stateful Widget：-> extend Widget
用于有状态变化的场景；
重写了createElement()方法；
不同于StatelessWidget，新增加了一个createState()接口；
createState()用于创建和StatefulWidget相关的状态，在该widget生命周期内，会被多次调用；

state：
每一个StatefulWidge对应一个状态；
state中保存的状态信息可以：
1.在build方法中被同步读取
2.在生命周期中可以被改变，
当state被改变时，可以手动调用setState()方法通知FlutterFramework状态发生改变，
FlutterFramework在收到消息后，会重新调用其build方法重新构建widget树，从而达到更新UI的目的。

state有两个常用属性：1.widget 2.context 

 */

//----- state生命周期演示
// CounterWidget接收一个initValue整型参数，它表示计数器的初始值
class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key key,
    this.initValue: 0
  });

  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

// state
class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();

    // 初始化状态-该方法后会调用build
    _counter = widget.initValue;
    print("-----初始化状态");
  }

  @override
  Widget build(BuildContext context) {
    print("-----build");

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("计时器"),
      //   backgroundColor: Colors.grey,
      // ),
      body: Center(
        child: FlatButton(
          child: Text(
            "$_counter",
            style: new TextStyle(fontSize: 32.0,color: Colors.yellow),
            ),// 取字段_counter的值
  
          // 计时器自增-setState方法后会调用build
          onPressed: ()=>setState(()=> ++_counter,),
        ),
      ),
    );
  }
  
  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    // 该方法后会调用build
    super.didUpdateWidget(oldWidget);
    print("-----didUpdateWidget");// 点击热加载时会调用
  }

  @override
  void deactivate () {
    super.deactivate();
    print("-----deactivate");// widget即将消失时调用---禁用
  }

  @override
  void dispose () {
    super.dispose();
    print("-----dispose");// widget页面已经消失时调用，即被永久移除
  }

  @override
  void reassemble () {
    super.reassemble();
    print("-----reassemble");// 点击热加载时调用重新组装
  }

  @override
  void didChangeDependencies () {
    // 该方法后会调用build
    super.didChangeDependencies();
    print("-----didChangeDependencies");// 改变依赖关系
  }

}


/*
状态管理常用方法：
Widget自己管理自己的状态->TapBoxA；
父Widget管理状态->TapBoxB；
混合管理（父和子都管理状态）->TabBoxC

如下例子：
创建一个盒子。当点击它时背景在绿色和灰色之间切换，
状态 _active决定颜色（true绿 false灰）
 */
// -------------TapBoxA:Widget自己管理自己的状态--------
class TabBoxA extends StatefulWidget {
  const TabBoxA({Key key}) : super(key: key);

  @override
  _TapBoxAState createState() => new _TapBoxAState();

}

class _TapBoxAState extends State<TabBoxA> {
  bool _active  = false;

  void _handsTap () {
    setState(() {
      _active = !_active;
    });
  }

  Widget build (BuildContext context) {
    return new GestureDetector(
      onTap: _handsTap,
      child: new Container(
        child:  new Center(
          child: new Text(
            _active ? "Active" : "Inactive",
            style: new TextStyle(fontSize: 32.0,color: Colors.blue),
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: _active?Colors.green:Colors.grey,
        ),
      ),
    );
  }
}

// -------------TapBoxB:父Widget管理状态--------
class ParentWidget extends StatefulWidget {
  @override 
  _ParentWidgetSate createState() => new _ParentWidgetSate();
}

class _ParentWidgetSate extends State<ParentWidget> {
  bool _active = false;

  void _handleBoxChanged (bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override 
  Widget build(BuildContext context) {
    return new Container(
      child: new TabBoxB(
        active: _active,
        onChanged: _handleBoxChanged,
      ),
    );
  }
}

class TabBoxB extends StatelessWidget {
  TabBoxB({Key key, this.active: false, @required this.onChanged}):super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap () {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active?'Active':'Inactive',
            style:new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200, height: 200,
        decoration: new BoxDecoration(
          color: active ?Colors.green : Colors.grey,
        ),
      ),

    );
  }
}

// -------------TapBoxC:父和子Widget混合管理状态--------
class ParentWidgetC extends StatefulWidget {
  @override 

  _ParentWidgetStateC createState() => new _ParentWidgetStateC();
}

class _ParentWidgetStateC extends State<ParentWidgetC> {
  // 父状态用来管理外部状态-》点击盒子颜色改变 
  bool _active = false;

  void _handleBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override 
  Widget build(BuildContext context) {
    return new Container(
      child: new TabBoxC(
        active: _active,
        onChanged: _handleBoxChanged,
      ),
    );
  }
}

class TabBoxC extends StatefulWidget {
  TabBoxC({Key key, this.active:false, @required this.onChanged}):super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;

  @override 
  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TabBoxC> {
  // 子widget管理内部状态改变-》高亮时边框颜色改变
  bool _highlight = false;

  void _hadleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _hadleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _hadleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override 
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return new GestureDetector(
      onTapDown: _hadleTapDown,//按下时
      onTapUp: _hadleTapUp,//抬起时
      onTap: _handleTap,// 点击时
      onTapCancel: _hadleTapCancel,// 取消点击

      child: new Container(
        child: new Center(
          child: new Text(
            widget.active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white)),
          ),

          width: 200, height: 200,
          decoration: new BoxDecoration(
            color: widget.active ? Colors.green : Colors.grey,

            // 边框颜色
            border:_highlight?new Border.all(
                  color: Colors.teal,
                  width: 10.0,
                )
              : null,
              ),
          ),
        );
      }
}

/*
基础的Widget：
Text:带格式的文本
Row、column：弹性空间的布局类
Stack：取代线性布局
Container：矩形元素，装饰一个BoxDecoration，
 */
//CupertinoWidget
class CupertinoWidget extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("demo"),
      ),

      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text("Press"),
          onPressed: () {print("点击了");}
        ),
      ),
    );
  }
}


/* ******************专用于调用************* */
class WidgetText extends StatelessWidget{
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text("widget学习"),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        // child:Ehco(text: "你好",backgroundColor: Colors.blue),
        // child: CounterWidget(),
        // child: TabBoxA(),
        // child: TabBoxB(active: false,onChanged: (active){},),
        // child: ParentWidget(),
        child:  ParentWidgetC(),
        // child: TabBoxC(active: false, onChanged: (active){},),
      ),
    );

      // return CupertinoWidget();
  }

}

