import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//如何导入和使用Flutter的资源文件
class ResPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResState();
  }
}

class _ResState extends State<ResPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "如何导入和使用Flutter的资源文件",
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("如何导入和使用Flutter的资源文件"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          child: Image(
            image: AssetImage(//导入一个图片资源
              'images/lake.jpg',
            ),
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
