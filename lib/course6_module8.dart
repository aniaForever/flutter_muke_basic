import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//动画Animation开发指南-用AnimatedWidget与AnimatedBuilder简化和重构我们对动画的使用  之AnimatedBuilder
//主要是对动画过程进行了拆分
void main() {
  runApp(LogoApp());
}

//页面
class LogoWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //垂直方向的margin
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

//以下可以对子widget实现放大动画
//Flutter中正是通过这种方式封装了很多动画，如：FadeTransition、ScaleTransition、SizeTransition等，很多时候都可以复用这些预置的过渡类。
//eg：这个demo分别封装出widget和animation，然后作为参数传入这里面
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        //在这里使用AnimatedBuilder
        animation: animation,
        builder: (context, child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class LogoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogoAppState();
  }
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
//   动画控制器：AnimationController用于控制动画，它包含动画的启动forward()、停止stop() 、反向播放 reverse()等方法。AnimationController会在动画的每一帧，就会生成一个新的值。
//   默认情况下，AnimationController在给定的时间段内线性的生成从0.0到1.0（默认区间）的数字
    animationController = new AnimationController(
        duration: const Duration(seconds: 2), vsync: this);
    //一条曲线：通过CurvedAnimation来指定动画的曲线
    final Animation curve = new CurvedAnimation(
        parent: animationController, curve: Curves.linearToEaseOut);
    //一个tween：默认情况下，AnimationController对象值的范围是[0.0，1.0]。如果我们需要构建UI的动画值在不同的范围或不同的数据类型，则可以使用Tween来添加映射以生成不同的范围或数据类型的值
    //在2s内生成从0-400的double数值
    animation = new Tween<double>(begin: 0, end: 400).animate(curve);
    //启动动画
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      //直接在这里使用
      child: LogoWidgetPage(),
      animation: animation,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
