import 'package:flutter/material.dart';

/*
图片：
Flutter中用Image来加载并显示图片，image的数据源可以是asset、文件、内存以及网络；

ImageProvider
是一个抽象类，主要定义了图片数据获取的接口load()

Image widget：
有一个必选的image参数，对应一个ImageProvider
 */
// 从asset中加载图片
class AssetmageWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("lib/images/bank.png"),
      width: 200,
      height: 50,
    );

    // 以下为简化写法
    // return Image.asset(
    //   "lib/images/bank.png",
    //   width: 200,
    //   height: 50,
    // );
  }
}

// 从网络加载图片
class NetImageWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage("http://10.106.1.163:21031/Images/20190509/021338_8443f77c-2373-4e8f-9e86-b13f96ac8d0d.jpg?width=620&height=350"),
      width: 200,
    );

    // 以下为简化写法
    // return Image.network(
    //   "http://10.106.1.163:21031/Images/20190509/021338_8443f77c-2373-4e8f-9e86-b13f96ac8d0d.jpg?width=620&height=350",
    //   width: 200,
    // );
  }
}

// 图片参数
class ParaImgWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("lib/images/logo.png"),
      width: 100,
      height: 300,
      color: Colors.blue,//图片的混合色值
      colorBlendMode: BlendMode.difference,// 混合模式
      fit: BoxFit.contain,//图片的显示样式（平铺，拉伸、自适应等）
      alignment: Alignment.center,//图片的对齐样式
      repeat: ImageRepeat.repeatY,
    );
  }
}

/*
Icon-相当于Text文本
 */
class IconWidget extends StatelessWidget {
  
  
  Widget build(BuildContext context) {
    String icons = "";
    icons += "\uE914";
    icons += " \uE000";
    icons += " \uE90D";

    return Text(
      icons,
      style: TextStyle(
        fontFamily: "MaterialIcons",
        fontSize: 24,
        color: Colors.green,
      ),
    );

    // 也可以用下列写法
    // return Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Icon(Icons.ac_unit,color: Colors.orange),
    //             Icon(Icons.cached,color: Colors.yellow),
    //           ],
    //         );
  }
}


class IconImgWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片和Icon学习"),
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            Text("1.从asset中加载图片"),
            AssetmageWidget(),

            Text("2.从网络中加载图片"),
            NetImageWidget(),

            Text("3.图片自定义参数值"),
            ParaImgWidget(),

            Text("4.Icon展示"),
            IconWidget(),
            
          ],
        ),
      ),
    );
  }
}