import 'package:flutter/material.dart';

/*
单选开关Switch和复选框CheckBox，
(他们都是继承自StatelessWidget
所以它们本身不会保存当前选择状态，所以一般都是在父widget中管理选中状态；)
当用户点击Switch或Checkbox时，它们会触发onChanged回调，我们可以在此回调中处理选中状态改变逻辑；
 */
class SwitchAndCheckBoxTest extends StatefulWidget {
  @override 

  _SwitchAndCheckBoxTestState createState() => new _SwitchAndCheckBoxTestState();
}

class _SwitchAndCheckBoxTestState extends State<SwitchAndCheckBoxTest> {
  bool _switchSelected = true; //维护单选开关
  bool _checkboxSelected = true;// 维护复选框状态

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单选和复选开关"),
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            // 单选框 -只能定义长度，不能定义宽度
            Switch(
              value: _switchSelected,
              activeColor: Colors.orange,// 设置激活状态的颜色
              onChanged: (value) {
              // 重构界面
               setState(() {
                _switchSelected = value;
              }); 
            },
          ),
          

            // 复选框-大小固定
            Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                 _checkboxSelected = value;
                 });
              },
            ),

         ],
        ),
      ),
    );
  }
}
