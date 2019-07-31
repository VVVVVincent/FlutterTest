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


// 自定义输入框
class CusTFWidget extends StatelessWidget {

  Widget build(BuildContext context) {
    // 设置提示文本的颜色和下划线颜色
    return Theme(
      data: Theme.of(context).copyWith(
        hintColor: Colors.grey,// 定义下划线颜色
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.grey), // 输入文本样式
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0)// 提示文本样式
        )
      ),

      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
            labelText: "用户名",
            hintText: "用户名或邮箱",
            prefixIcon: Icon(Icons.person),
            border: InputBorder.none,// 隐藏下划线
          ),
          // cursorColor: Colors.blue,// 定义光标颜色
         ),

         TextField(
            decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: "密码",
            hintText: "您的登录密码",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0)
          ),
          obscureText: true,
         )

        ],
      ),
    );
  }

}

/*
FormField：表单
提供了自动验证输入内容自否合法的属性
下例：
  用户名不能为空，如果为空则提示
  密码不能小于6位，如果小于6则提示
 */

class FormWidget extends StatefulWidget {
  @override

  _FormWidgetState createState() => new _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  TextEditingController _uNameC = new TextEditingController();
  TextEditingController _uPwdC = new TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),

      child: Form(
        key: _formKey,//设置globalKey，用于后面获取FormState
        autovalidate: true,// 开启自动验证
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              controller: _uNameC,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                icon: Icon(Icons.person)
              ),

              // 校验用户名
              validator: (value){
                return value.trim().length > 0? null:"用户名不能为空！";
              },
            ),

            TextFormField(
              controller: _uPwdC,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                icon: Icon(Icons.lock)
              ),
              obscureText: true,

              // 校验密码
              validator: (pwd) {
                return pwd.trim().length < 6 ?"密码不能少于6位!":null;
              },
            ),

            // 登录按钮
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      child: Text("登录"),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {

                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
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
            // TFWidget(),
            // CusTFWidget(),
            FormWidget(),
            
          ],
        )
      ),
    );
  }
}