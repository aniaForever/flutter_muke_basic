import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HeroAnimationRouteA());
}

//页面A
class HeroAnimationRouteA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "测试Hero",
      home: Scaffold(
        appBar: AppBar(
          title: Text("测试Hero"),
        ),
        body: ClickWidget(),
      ),
    );
  }
}

//图片Widget
class ClickWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
//      //应该是有涟漪效果
        child: InkWell(
          child: Hero(
            tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
            child: ClipOval(
              child: Image.asset(
                "images/lake.jpg",
                width: 100,
                height: 70,
              ),
            ),
          ),
          onTap: () {
            //点击事件  点击这里打开页面b
            Navigator.push(context, PageRouteBuilder(pageBuilder:
                (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
              //渐变动画
              return FadeTransition(
                opacity: animation,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("原图"),
                  ),
                  body: HeroAnimationRouteB(),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}

//页面B
class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar",
        child: Image.asset("images/lake.jpg"),
      ),
    );
  }
}
