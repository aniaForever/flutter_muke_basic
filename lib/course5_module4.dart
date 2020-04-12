import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//StatelessWidget与基础组件
void main() {
  runApp(new StatelessWidgetGroupPage());
}

class StatelessWidgetGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle= new TextStyle(
      color: Colors.yellow,
      fontSize: 20,
    );
    return MaterialApp(
      title: "如何使用statelesswidget",
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("statelesswidget 与基础组件"),
          leading: GestureDetector(//返回按钮
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.green),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text("children1",style: textStyle,),
              Text("children2",style: textStyle,),
              Icon(Icons.android,size: 40,color: Colors.red,),
              CloseButton(),
              BackButton(),
              Chip(
                avatar: Icon(Icons.ac_unit),
                label: Text("这个是材料设计小部件"),
              ),
              Divider(
                color: Colors.amber,
                height: 20,//不是线的高度，是容器的高度
                indent: 10,//左侧间距
                endIndent: 40,//右侧间距
              ),
              Card(
                color: Colors.blue,
                elevation: 4,//圆角
                margin: EdgeInsets.all(10),//外间距
                child: Container(
                  padding: EdgeInsets.all(20),//内间距
                  child: Text(
                    "this is a card",
                    style: textStyle,
                  ),
                ),
              ),
              AlertDialog(
                title: Text('this is title'),
                content: Text("this is content"),
                elevation: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
