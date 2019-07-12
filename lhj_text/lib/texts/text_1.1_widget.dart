import 'package:flutter/material.dart';

/*
widget可以用来表示view
 */

//StatelessWidget 用于不需要构建状态的场景
class Ehco extends StatelessWidget 
{
  const Ehco(
    {
      Key key,
      @required this.text,
      this.backgroundColor:Colors.grey,
    }
  ):super(key:key)

  final String text;
  final backgroundColor;
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