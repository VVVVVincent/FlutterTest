import 'package:flutter/material.dart';

/*
TextFiled：
用于文本输入
 */
class TFWidget extends StatefulWidget {
  @override
  _tfWidgetState createState() => new _tfWidgetState();
}
class _tfWidgetState extends State<TFWidget> {
  // 定义一个controller,
  TextEditingController _uNameController = new TextEditingController();

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;
  

  @override
  void initState () {
    // 设置默认值，从第三个字符开始选中
    _uNameController.text = "hello world";
    _uNameController.selection = TextSelection(
      baseOffset: 2,
      extentOffset: _uNameController.text.length,
    );
    
    // 监听输入变化
    _uNameController.addListener((){
      print(_uNameController.text);
    });
  }

  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        TextField(
          autofocus: true,// 是否自动获取焦点
          // 设置输入格式
          decoration: InputDecoration(
            labelText: "用户名",
            labelStyle: TextStyle(
              color: Colors.blue
            ),
            hintText: "用户名或邮箱",
            prefixIcon: Icon(Icons.person),
          ),
          textInputAction: TextInputAction.done,
          focusNode: focusNode1,

          // 获取输入内容方式1
          // onChanged: (value){
          //   print(value);
          // },

          // 获取输入内容方式2
          controller: _uNameController,
          
        ),

        TextField(
          decoration: InputDecoration(
            labelText: "密码",
            hintText: "您的登陆密码",
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,//是否加密显示输入文字
          focusNode: focusNode2,
        ),

        Builder(builder: (ctx){
          return Column(
            children: <Widget>[
              RaisedButton(
                child: Text("移动焦点"),
                onPressed: (){
                  if(null == focusScopeNode) {
                    focusScopeNode = FocusScope.of(context);
                  }
                  focusScopeNode.requestFocus(focusNode2);
                },
              ),

              RaisedButton(
                child: Text("隐藏键盘"),
                onPressed: () {
                  // 所有键盘失去焦点并收起键盘
                  focusNode1.unfocus();
                  focusNode2.unfocus();
                },
              ),
            ],
          );
        }),

      ],

    );
  }
}







class FiledWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("输入框和表单练习"),
        backgroundColor: Colors.yellow,
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            TFWidget(),
            
          ],
        )
      ),
    );
  }
}