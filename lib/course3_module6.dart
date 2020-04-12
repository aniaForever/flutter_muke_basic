//3-6 【文档讲解】Flutter入门基础知识
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
//  point1 入门
//  runApp(
//    Center(//可选命名参数
//      child: Text(//使用关键字new 新建一个对象，new可以省略
//        "hello world",
//        textDirection: TextDirection.ltr,//可选命名参数
//      ),
//    ),
//  );


runApp(_MyApp());
}

////  point2 创建一个有titlebar的页面
//class MyApp extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'this is the title',
//      home: Scaffold(
//        appBar:AppBar(
//          title: Text(
//            'this id title'
//          ),
//        ) ,
//        body: Center(
//          child: Text(
//            'this is child',
//            textDirection: TextDirection.rtl,
//          ),
//        ),
//      ),
//    );
//  }
//
//}

//  point2 创建一个有titlebar的页面
class _MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'this is the title',
      home: Scaffold(
        appBar:AppBar(
          title: Text(
              'this id title'
          ),
        ) ,
        body: CustomeCard(
          index: 0,
          onPress: null,
        ),
      ),
    );
  }

}

//point3 创建一个自定义widget，可以重用
class CustomeCard extends StatelessWidget{
  final index;
  final Function onPress;

  //常量构造方法，所有变量都是final的
  //如果父类没有无名无参构造函数，需要显示调用父类的构造函数
  const CustomeCard({Key key, this.index, this.onPress}) : super(key: key);//todo 在方法中定义可选参数的时候，是用{}来定义的

  @override
  Widget build(BuildContext context) {
    return Card(//返回一个Card实例,new可以省略
      child: Column(
        children: <Widget>[//一个Widget数组（list）
          Text('Card $index'),//通配符
          FlatButton(
            child: Text('pressed'),
            onPressed: this.onPress,
          )
        ],
      ),
    );
  }

}