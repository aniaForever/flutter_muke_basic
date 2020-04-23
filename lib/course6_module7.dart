import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//用AnimatedWidget与AnimatedBuilder简化和重构我们对动画的使用
void main() {
  runApp(LogoAppWidgetPage());
}

class LogoAppWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogoAppWidgetPageState();
  }
}

class AnimatedLogo extends AnimatedWidget {
  //构造函数
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class _LogoAppWidgetPageState extends State<LogoAppWidgetPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    //指定了执行时间2s。当页面在屏幕不可见的时候动画做一些资源的回收
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    //数值在0-400之间变化
    animation = Tween<double>(begin: 0, end: 400).animate(animationController);
    //这里不需要添加监听器了，因为已经有了AnimatedLogo
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "用AnimatedWidget与AnimatedBuilder简化和重构我们对动画的使用",
      home: Scaffold(
        appBar: AppBar(
          title: Text("用AnimatedWidget与AnimatedBuilder简化和重构我们对动画的使用"),
        ),
        body: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                animationController.reset(); //对动画进行归位  也就是能重复播放
                animationController.forward();
              },
              child: Text(
                'start',
                textDirection: TextDirection.ltr,
              ),
            ),
            Container(
              //在这里直接使用AnimatedLogo就可以了
              child: AnimatedLogo(
                animation: animation,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose(); //注意做资源的回收
    super.dispose();
  }
}