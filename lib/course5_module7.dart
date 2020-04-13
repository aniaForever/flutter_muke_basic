import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_muke_basic/course5_module11.dart';
import 'package:flutter_muke_basic/course5_module12.dart';
import 'package:flutter_muke_basic/course5_module13.dart';
import 'package:flutter_muke_basic/course5_module14.dart';

import 'course5_module4.dart';
import 'course5_module5.dart';
import 'course5_module6.dart';
import 'course5_module8.dart';
import 'course5_module9.dart';

//如何创建和使用Flutter的路由和导航？

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '如何创建和使用Flutter的路由和导航？',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RouterNavigator(title: '如何创建和使用Flutter的路由和导航？'),
      routes: <String, WidgetBuilder>{//定义路由，也就是为页面起路由别名
        //这个就是一个map
        "statelessWidget": (BuildContext context) => StatelessWidgetGroupPage(),
        "statefulWidget":(BuildContext context)=>StatefulGroupPage(),
        "layout":(BuildContext context)=>FlutterLayoutPage(),
        "gesture":(BuildContext context)=>GesturePage(),
        "respage":(BuildContext context)=>ResPage(),
        "widgetLifeCycle":(BuildContext context)=>WidgetLifeCyclePage(),
        "appLifeCycle":(BuildContext context)=>AppLifeCycle(),
        "dynamicTheme":(BuildContext context)=>DynamicThemePage(),
        "configFont":(BuildContext context)=>ConfigFontPage(),
      },
    );
  }
}

class RouterNavigator extends StatefulWidget {
  RouterNavigator({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RouterNavigatorState createState() => _RouterNavigatorState();
}

class _RouterNavigatorState extends State<RouterNavigator> {
  bool isRouterJump = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SwitchListTile(
              //滑动开关
              title: Text('${isRouterJump ? "" : "不"}通过路由进行跳转'),
              value: isRouterJump,
              onChanged: (value) {
                //当切换的时候的回调
                setState(() {
                  isRouterJump = value;
                });
              },
            ),
            _item("StatelessWidget与基础组件", StatelessWidgetGroupPage(), "statelessWidget"),
            _item("StateFulWidget与基础组件", StatefulGroupPage(), "statefulWidget"),
            _item("如何进行Flutter布局开发", FlutterLayoutPage(), "layout"),
            _item("如何检测用户手势以及处理点击事件", GesturePage(), "gesture"),
            _item("如何导入和使用Flutter的资源文件", ResPage(), "respage"),
            _item("flutter页面生命周期指南", WidgetLifeCyclePage(), "widgetLifeCycle"),
            _item("如何获取flutter应用的生命周期", AppLifeCycle(), "appLifeCycle"),
            _item("如何修改flutter应用的主题", DynamicThemePage(), "dynamicTheme"),
            _item("如何自定义字体", ConfigFontPage(), "configFont"),
          ],
//
        ),
      ),
    );
  }

  _item(String content, page, String routeName) {
    return Container(
      //一个按钮widget
      child: RaisedButton(
        //按钮的点击事件
        onPressed: () {
          if (isRouterJump) {
            Navigator.pushNamed(context, routeName); //通过路由名进行跳转
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => page)); //通过页面直接进行跳转
          }
        },
        child: Text(content),
      ),
    );
  }
}
