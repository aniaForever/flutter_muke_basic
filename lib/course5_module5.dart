import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//StateFulWidget与基础组件
void main() {
  runApp(new StatefulGroupPage());
}

class StatefulGroupPage extends StatefulWidget {
  @override
  _StatefulState createState() {
    return new _StatefulState();
  }
}

class _StatefulState extends State<StatefulGroupPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      color: Colors.yellow,
      fontSize: 10,
    );
    return MaterialApp(
      title: "StatefulWidget以及基础组件",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("StatefulWidget以及基础组件"),
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
                  children: <Widget>[
                    Text(
                      "children1",
                      style: textStyle,
                    ),
                    Icon(
                      Icons.android,
                      size: 40,
                      color: Colors.red,
                    ),
                    CloseButton(),
                    BackButton(),
                    Image.network(
                      //图片组件
                      'http://www.devio.org/img/avatar.png',
                      width: 100,
                      height: 100,
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
                      margin: EdgeInsets.only(top: 10), //顶部
                      decoration: BoxDecoration(color: Colors.greenAccent), //背景
                      child: PageView(
                        children: <Widget>[
                          _item("page1", Colors.greenAccent),
                          _item("page2", Colors.deepPurpleAccent),
                          _item("page3", Colors.yellow)
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : RefreshIndicator(
                child: ListView(
                  //RefreshIndicator需要配合列表ListView进行使用
                  children: <Widget>[
                    Text("这个是购物车页面"),
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
}
