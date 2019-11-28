import 'package:flutter/material.dart';
/// 导入生成随机字符串的语言包
import 'package:english_words/english_words.dart';


/* 
首页：
    继承自StatefulWidget，即有状态的类；
    Stateful widget至少有两个类组成（StatefulWidget类和State类）
*/
/// 首页StatefulWidget类
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/// 首页State类
class _MyHomePageState extends State<MyHomePage> {
  // 计时变量
  int _counter = 0;
  int _selectedIndex = 0;
  // TabController _tabController;
  // List tabs = ["房源","客源","实勘"];
  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(length: tabs.length, vsync: this._tabControlle);
  // }

  // 自增函数
  void _incrementCounter() {
    // setState方法的作用是通知Flutter框架，有状态发生了改变
    // Flutter框架收到通知后，会执行build方法来根据新的状态重新构建界面
    setState(() {
      _counter++;
    });
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  } 

  // 当MyHomePage被第一次创建时，_MyHomePageState类就会被创建，
  // 并且状态的改变就要调用build方法，状态改变依赖该类，所以build方法放在了该类中
  @override
  Widget build(BuildContext context) {
    /// Material库中提供的页面脚手架，包含导航栏，标题和主屏幕页面的body属性以及按钮
    return Scaffold(
      // ---------导航栏
      appBar: AppBar(
        title: Text(widget.title),
        // 导航栏右侧按钮
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){
              print("点击了分享按钮");
            },
          )
        ],
        // bottom: TabBar(
        //   controller: _tabController,
        //   tabs: tabs.map(
        //     (e) => Tab(text: e)
        //   ).toList(),
        // ),
      ),

      // ----------抽屉
      drawer: new MyDrawer(),

      // ----------底部导航
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text("消息")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("我的")),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onTap,
      ),

      // body：body的widget树包含一个Center widget（可以将所有子widget对齐到屏幕中心）
      // center子widget是一个Column widget，作用是将所有的子视图沿屏幕垂直方向依次排开，本例中包含两个Text子widget
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '点击+按钮会看到数量增加',
            ),
            Text(
              //文字取值
              '$_counter',
              // 文字样式
              style: Theme.of(context).textTheme.display1,
            ),

            // 添加跳转按钮
            FlatButton(
              child: Text("点击跳转查看委托", style: TextStyle(fontSize: 20),),
              textColor: Colors.white,
              color: Colors.red,
              onPressed: () {
                /* 
                跳转到新route：
                1.MaterialPageRoute继承自PageRoute类，表示占有整个屏幕空间的模态路由界面；
                  该构造函数的各个参数如下
                  MaterialPageRoute({
                    WidgetBuilder builder,//一个WidgetBuilder类型的回调函数，返回要跳转的新界面
                    RouteSettings settings,// 界面的配置信息，如名称、是否是初始界面
                    bool maintainState = true,// 默认为true，当跳转一个新界面，原界面还在内存中，如果想释放原界面，设置为false
                    bool fullscreenDialog = false,// 默认为false，即是一个带导航栏的且从左右滑出，如果想要全屏的模态对话框，设置为true
                  })
                  2.Navigator是一个界面管理的widget，它提供了一系列方法来管理路由栈，最常用的是push、pop
                */

                // Navigator.push方法打开新路由页面
                // Navigator.push(context, 
                // new MaterialPageRoute(builder: (context){
                //   return new NewRoute();
                //   })
                // );

                // 通过路由名打开新路由页面
                // Navigator.pushNamed(context, "new_page");

                // 通过路由名打开新路由界面并向新界面传值
                Navigator.of(context).pushNamed("new_page", arguments:"我是被传过来的参数");
              },
            ),
          ],
        ),
      ),

      // 页面内悬浮按钮
      floatingActionButton: FloatingActionButton(
        // 按钮被点击时触发的方法
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        // 按钮图标
        child: Icon(Icons.add),
      ),
    );
  }
}

// 自定义抽屉
class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }):super(key:key);

  @override
  Widget build(BuildContext ctx) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: ctx,
        // 移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //----头部
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child:Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset("lib/images/二维码@2x.png",width: 80,),
                    ),
                  ),
                  Text("lhj",style:TextStyle(fontWeight: FontWeight.bold))
                ],
              )
            ),

            //-------单元格
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text("add Account"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Manage accounts"),
                  ),
                ],
              ),
            ),

          ],
        ),

      ),
    );
  }
}


/* 
创建一个新页面路由：
    继承自StatelessWidget,界面简单显示一句话
*/
class NewRoute extends StatelessWidget {
  @override

  // 构建UI
  Widget build(BuildContext context) {
    // 在该路由页，通过RouteSetting对象获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    final randomWords = new WordPair.random();
    print(args);


    // 设置手脚架
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个界面"),
        // 设置单个页面导航栏颜色
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(randomWords.toString()),
      ),
    );
  }
}

class ImgRoute extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("图片显示"),
        backgroundColor: Colors.grey,
      ),
      body: Center( 
        child:Image.asset('lib/images/二维码@2x.png'),
      ),
    );
  }
}

