import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//如何检测用户手势以及处理点击事件

void main() {
  runApp(GesturePage());
}

class GesturePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GesturePageState();
  }
}

class _GesturePageState extends State<GesturePage> {
  String printMsg = '';
  double moveX = 0;
  double moveY = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "如何检测用户手势以及处理点击事件",
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("如何检测用户手势以及处理点击事件"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _printMsg("点击");
                    },
                    onDoubleTap: () {
                      _printMsg("双击");
                    },
                    onLongPress: () {
                      _printMsg("长按");
                    },
                    onTapCancel: () {
                      _printMsg("取消");
                    },
                    onTapUp: (e) => _printMsg("松开"),
                    onTapDown: (e) => _printMsg("按下"),
                    onPanUpdate: (e) => _printMsg("......"),
                    child: Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Text(
                        '点我',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Text(printMsg),
                ],
              ),
              Positioned(
                //跟随手指滑动的小球
                left: moveX,
                top: moveY,
                child: GestureDetector(
                  onPanUpdate: (e) => _setLocation(e),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent, //背景颜色
                        borderRadius: BorderRadius.circular(
                            40)), //圆角。注意：宽高70，设置为35后就是圆角的样式了
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _printMsg(String msg) {
    setState(() {
      printMsg = printMsg + ",${msg}";
    });
  }

  //当State被改变时，可以手动调用其setState()方法通知Flutter framework状态发生改变，Flutter framework在收到消息后，会重新调用其build方法重新构建widget树，从而达到更新UI的目的。
  _setLocation(DragUpdateDetails details) {
    setState(() {
      moveX = moveX + details.delta.dx;
      moveY = moveY + details.delta.dy;
    });
  }
}
