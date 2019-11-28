import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/rendering.dart';
import 'dart:ui';

// 屏幕宽度
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
// 屏幕高度
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
// 导航栏高度
double navHeight = AppBar().preferredSize.height;

// 电池条高度
double statusBarHeight(BuildContext context) =>
    MediaQuery.of(context).padding.top;
// 底部安全高度，
double safeAreaHeight(BuildContext context) =>
    MediaQuery.of(context).padding.bottom;
// body高度= screenHeight - navHeight - statusBarHeight-safeAreaHeight
bodyHeight(BuildContext context) => (screenHeight(context) -
    statusBarHeight(context) -
    navHeight -
    safeAreaHeight(context));

class CheckTrustRoute extends StatelessWidget {
  Widget build(BuildContext ctx) {
    void alertAction(String alertStr) {
      showAboutDialog(
          context: ctx,
          applicationName: "移动A+",
          children: <Widget>[Text(alertStr,textAlign: TextAlign.center,)]);
    }

    print(navHeight);
    print(bodyHeight(ctx));
    print(safeAreaHeight(ctx));
    return Scaffold(
      appBar: AppBar(
        title: Text("查看委托"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: bodyHeight(ctx) - 50,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverFixedExtentList(
                  // 行高度
                  itemExtent: 50,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext ctx, int index) {
                      var list1 = ["签署人", "签署时间", "开始时间", "结束时间", "签署类型"];
                      var list2 = [
                        "lhj",
                        "2019-10-04",
                        "2019-11-26",
                        "2020-01-01",
                        "租售委托"
                      ];
                      // 构建行内组件
                      return Row(
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 30,
                            // color: Colors.red,
                            margin: EdgeInsets.only(left: 16.0),
                            child: Text(
                              list1[index],
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Container(
                            width: screenWidth(ctx) - 16 * 2 - 100,
                            height: 30,
                            // color: Colors.orange,
                            alignment: Alignment.centerRight,
                            child: Text(
                              list2[index],
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          )
                        ],
                      );
                    },
                    childCount: 5,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 20,
                    color: Color.fromRGBO(244, 243, 237, 1),
                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: 200,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext ctx, int index) {
                      var list = [
                        ["房产证照片", "2张", "lib/images/1.JPG"],
                        ["身份证照片", "5张", "lib/images/2.JPG"],
                        ["委托书照片", "1张", "lib/images/3.JPG"],
                        ["个人照片", "6张", "lib/images/4.JPG"],
                        ["其他照片", "3张", "lib/images/5.JPG"],
                      ];
                      var list2 = list[index];
                      var text1 = list2[0];
                      var text2 = list2[1];
                      var imgName = list2[2];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: screenWidth(ctx) / 3,
                            height: 200,
                            // color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(text1,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(51, 51, 51, 1))),
                                Text(text2,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromRGBO(51, 51, 51, 1))),
                              ],
                            ),
                          ),
                          Container(
                            width: screenWidth(ctx) / 2,
                            height: 180,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0), //圆角,
                            ),
                            child: Image.asset(imgName, fit: BoxFit.fill),
                          ),
                        ],
                      );
                    },
                    childCount: 5,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: screenHeight(ctx) -
                    navHeight -
                    statusBarHeight(ctx) -
                    safeAreaHeight(ctx) -
                    50),
            width: screenWidth(ctx),
            height: 50 + safeAreaHeight(ctx),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 16.0),
                  width: (screenWidth(ctx) - 16 * 2 - 1) / 2,
                  height: 50 + safeAreaHeight(ctx) - 18 * 2,
                  color: Colors.red,
                  child: FlatButton(
                    child:
                        Text("审核通过", style: prefix0.TextStyle(fontSize: 18.0)),
                    onPressed: () {
                      alertAction("点击了审核通过");
                    },
                    textColor: Colors.white,
                    colorBrightness: Brightness.dark, //按钮主题，默认时浅色主题
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.zero, //按钮的外形,边框弧度
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 50 + safeAreaHeight(ctx) - 25 * 2,
                  color: Colors.white,
                ),
                Container(
                  width: (screenWidth(ctx) - 16 * 2 - 1) / 2,
                  height: 50 + safeAreaHeight(ctx) - 18 * 2,
                  color: Colors.red,
                  child: FlatButton(
                    child:
                        Text("审核拒绝", style: prefix0.TextStyle(fontSize: 18.0)),
                    onPressed: () {
                      alertAction("点击了审核拒绝");
                    },
                    textColor: Colors.white,
                    colorBrightness: Brightness.dark, //按钮主题，默认时浅色主题
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.zero, //按钮的外形,边框弧度
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
