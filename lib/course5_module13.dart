//如何修改flutter应用的主题

import 'package:flutter/material.dart';

class DynamicThemePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DynamicThemePageState();
  }
}

class _DynamicThemePageState extends State<DynamicThemePage> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: _brightness,
        primaryColor: Colors.deepPurpleAccent,
      ),
      title: "如何修改flutter应用的主题",
      home: Scaffold(
        appBar: AppBar(
          title: Text("如何修改flutter应用的主题"),
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
              RaisedButton(
                onPressed: () {
                  //切换主题
                  setState(() {
                    if (_brightness == Brightness.light) {
                      _brightness = Brightness.dark;
                    } else {
                      _brightness = Brightness.light;
                    }
                  });
                },
                child: Text("切换主题"),
              ),
              Text("测试 文字",
              style: TextStyle(
                color: Colors.lightGreen,
                fontSize: 50,
              ),)
            ],
          ),

        ),
      ),
    );
  }
}
