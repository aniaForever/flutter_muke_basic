import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//如何进行Flutter布局开发

void main() {
  runApp(new FlutterLayoutPage());
}

class FlutterLayoutPage extends StatefulWidget {
  @override
  _StatefulState createState() {
    return new _StatefulState();
  }
}

class _StatefulState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      color: Colors.yellow,
      fontSize: 10,
    );
    return MaterialApp(
      title: "如何进行Flutter布局开发",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("如何进行Flutter布局开发"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 40,
                color: Colors.red,
              ),
              activeIcon: Icon(
                Icons.home,
                size: 40,
                color: Colors.black12,
              ),
              title: Text("首页"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_shopping_cart,
                size: 40,
                color: Colors.red,
              ),
              activeIcon: Icon(
                Icons.add_shopping_cart,
                size: 40,
                color: Colors.black12,
              ),
              title: Text("购物车"),
            ),
          ],
        ),
        //显示悬浮按钮
        floatingActionButton: FloatingActionButton(
          child: Text("点击我"),
          onPressed: null,
        ),
        //完成点击底部导航栏 两个页面的切换
        body: _currentIndex == 0
            ? Container(
                decoration: BoxDecoration(color: Colors.green),
                alignment: Alignment.center,
                child: Column(
                  //垂直容器组件
                  children: <Widget>[
                    Row(
                      //水平容器组件
                      children: <Widget>[
                        ClipOval(
                          //剪切成圆角的组件
                          child: SizedBox(
                            //限制子widget大小的罪案
                            width: 100,
                            height: 100,
                            child: Image.network(
                              'http://www.devio.org/img/avatar.png',
                            ),
                          ),
                        ),
                        Padding(
                          //设置padding的组件
                          padding: EdgeInsets.all(10),
                          child: ClipRRect(
                            //剪切圆角的组件
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            //设置圆角
                            child: Opacity(
                              //设置透明度的组件
                              opacity: 0.6, //60%的透明度
                              child: Image.network(
                                //图片组件
                                'http://www.devio.org/img/avatar.png',
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      //输入框组件
                      decoration: InputDecoration(
                        hintText: "请输入文字内容",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.deepPurpleAccent,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0), //内容间距
                      ),
                    ),
                    Container(
                      //约束这个pageview的大小
                      height: 100,
                      margin: EdgeInsets.all(10), //顶部
                      decoration: BoxDecoration(color: Colors.greenAccent), //背景
                      child: PhysicalModel(
                        //圆角组件
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20), //圆角大小
                        clipBehavior: Clip.antiAlias, //抗锯齿
                        child: PageView(
                          children: <Widget>[
                            _item("page1", Colors.red),
                            _item("page2", Colors.deepPurpleAccent),
                            _item("page3", Colors.yellow)
                          ],
                        ),
                      ),
//
                    ),
                    Column(
                      children: <Widget>[
                        FractionallySizedBox(
                          widthFactor: 1, //设置宽度铺满
                          child: Container(
                            decoration:
                                BoxDecoration(color: Colors.deepPurpleAccent),
                            child: Text("铺满试试"),
                          ),
                        ),
                        Stack(
                          children: <Widget>[
                            Image.network(
                              'http://www.devio.org/img/avatar.png',
                              width: 100,
                              height: 100,
                            ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              width: 30,
                              height: 30,
                              child: Image.network(
                                'http://www.devio.org/img/avatar.png',
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: 8, //水平间距
                          runSpacing: 6, //垂直间距
                          children: <Widget>[
                            _createChip("flutter"),
                            _createChip("携程"),
                            _createChip("实战"),
                            _createChip("开发"),
                            _createChip("哈哈哈哈"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : RefreshIndicator(
                child: ListView(
                  //RefreshIndicator需要配合列表ListView进行使用
                  children: <Widget>[
                    Text("这个是购物车页面"),
                    Text("这个是购物车页面"),
                    Text("这个是购物车页面"),
//                    Column(
//                      children: <Widget>[
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                              color: Colors.lightGreenAccent,
//                            ),
//                            child: Text(
//                              "拉伸填满高度",
//                              style: textStyle,
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
                  ],
                ),
                onRefresh: handleRefresh, //列表下拉的时候会回调这个callback
              ),
      ),
    );
  }

  //延时处理
  Future<Null> handleRefresh() async {
    await Future.delayed(Duration(microseconds: 200));
    return null;
  }

  Widget _item(String title, Color color) {
    return Container(
      decoration: BoxDecoration(color: color),
      alignment: Alignment.center,
      child: Center(child: Text(title)),
    );
  }

  _createChip(String s) {
    return Chip(
      avatar: CircleAvatar(
        //圆形组件
        backgroundColor: Colors.black12,
        child: Text(
          //内容
          s.substring(0, 1),
          style: TextStyle(color: Colors.black),
        ),
      ),
      label: Text(s), //chip的label
    );
  }
}
