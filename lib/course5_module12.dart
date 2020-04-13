//如何获取flutter应用的生命周期

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLifeCycle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppLifeCycleState();
  }
}

class _AppLifeCycleState extends State<AppLifeCycle>
    with WidgetsBindingObserver {
  //继承绑定观察器
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this); //绑定生命周期监听器
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "如何获取flutter应用的生命周期",
      home: Scaffold(
        appBar: AppBar(
          title: Text("如何获取flutter应用的生命周期"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          child: Text("flutter应用的生命周期"),
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); //移除生命周期监听器
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    //监听应用生命周期的变化
    print("current state=${state}");
    if (state == AppLifecycleState.paused) {
      print("App进入后台");
    } else if (state == AppLifecycleState.resumed) {
      print("App进入前台");
    } else if (state == AppLifecycleState.inactive) {
      //不常用：应用程序处于非活动状态，并且未接收用户输入时调用，比如：来了个电话
      print("app :inactive");
    } else if (state == AppLifecycleState.detached) {
      print("app :detached");
    }
  }
}
