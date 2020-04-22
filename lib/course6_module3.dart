import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//图片控件开发详解

void main() {
  runApp(ImageDemoPage());
}

class ImageDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageDemoPageState();
  }
}

class _ImageDemoPageState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "图片控件开发详解",
      home: Scaffold(
        appBar: AppBar(
          title: Text("图片控件开发详解"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
//        body: Center(
//          child: Image.network('http://www.devio.org/img/avatar.png'),
//        ),
        body: Column(
          children: <Widget>[
            Image.network('http://www.devio.org/img/avatar.png'), //加载网络图片
            Image(
              height: 100,
              width: 150,
              image: AssetImage("images/lake.jpg"),//加载项目里面的本地图片：注意这里要是绝对路径
            ),
            Image.asset(
              "images/lake.jpg",
              width: 200,
              height: 250,
            )
          ],
        ),
      ),
    );
  }
}
