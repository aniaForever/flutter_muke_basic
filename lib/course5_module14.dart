//如何自定义字体

///字体下载地址：https://fonts.google.com/specimen/Rubik+Mono+One?selection.family=Rubik+Mono+One
///更多参考：https://flutter.dev/docs/cookbook/design/fonts
///
import 'package:flutter/material.dart';

class ConfigFontPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConfigFontPageState();
  }
}

class _ConfigFontPageState extends State<ConfigFontPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepPurpleAccent,
//        fontFamily: 'RubikMonoOne',//1、整体应用字体
      ),
      title: "如何自定义字体",
      home: Scaffold(
        appBar: AppBar(
          title: Text("如何自定义字体"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                "测试 ahahha",
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 30,
                  fontFamily: 'RubikMonoOne',//2、局部应用字体
                ),
              ),
              Text(
                "测试 afjaflk",
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 30,
                ),
              ),
              Text(
                "测试 fajfl;r",
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 30,
                ),
              ),
              Text(
                "测试 fajfkjakf",
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 30,
                ),
              ),
              Text(
                "测试 哈哈哈哈哈",
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
