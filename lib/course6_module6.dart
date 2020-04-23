import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//动画Animation开发指南-怎么实现一个动画
void main() {
  runApp(LogoAppPage());
}

class LogoAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogoAppPageState();
  }
}

class _LogoAppPageState extends State<LogoAppPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  AnimationStatus animationStatus; //animation的状态
  double animationValue;

  @override
  void initState() {
    super.initState();
    //指定了执行时间2s。当页面在屏幕不可见的时候动画做一些资源的回收
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    //数值在0-400之间变化
    animation = Tween<double>(begin: 0, end: 400).animate(animationController);
    //用于给Animation添加帧监听器，在每一帧都会被调用。帧监听器中最常见的行为是改变状态后调用setState()来触发UI重建。
    animation.addListener(() {
      setState(() {
        animationValue = animation.value;
      });
    });
    //可以给Animation添加“动画状态改变”监听器；动画开始、结束、正向或反向（见AnimationStatus定义）时会调用状态改变的监听器。
    animation.addStatusListener((AnimationStatus status) {
      setState(() {
        animationStatus = status;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "动画Animation开发指南-AnimatedWidget与AnimatedBuilder-1",
      home: Scaffold(
        appBar: AppBar(
          title: Text("动画Animation开发指南-AnimatedWidget与AnimatedBuilder-1"),
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
            Text(
              'state=' + animationStatus.toString(),
            ),
            Text(
              'value=' + animationValue.toString(),
            ),
            //这个就是我们的动画，用container来承载
            //因为在动画的过程中高度宽度是变化的，可以通过控制container的大小来控制
            //动画最终是控制了container容器的大小是变化的，也是这个flutterlogo的大小
            Container(
              height: animation.value,
              width: animation.value,
              child: FlutterLogo(),
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
