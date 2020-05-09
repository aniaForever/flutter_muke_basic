import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//实现顶部导航
void main() {
  runApp(TabbedAppbarSample());
}

class TabbedAppbarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tabbed AppBar",
      //1、创建一个tabcontroller
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
//            title: Text("Tabbed AppBar"),
            //2、创建一个包含4个Tab Widgets 的TabBar.默认情况下，TabBar在Widget树中查找最近的DefaultTabController。如果是手动创建的TabController，则需要将其传递到“TabBar”
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(
                  //创建子项Tab
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          //3、选择选项卡时显示相关的内容。顺序很重要，必须与TabBar中的选项卡的顺序相对应
          body: TabBarView(
            //可以滑动的tabview
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChoiceCard(
                  choice: choice,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;

  const Choice(this.title, this.icon);
}

const List<Choice> choices = const <Choice>[
  const Choice("home", Icons.photo),
  const Choice("bicycle", Icons.directions_bike),
  const Choice("home", Icons.add_shopping_cart),
  const Choice("home", Icons.work),
];

class ChoiceCard extends StatelessWidget {
  final Choice choice;

  const ChoiceCard({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          //而MainAxisSize.min表示尽可能少的占用水平空间，当子组件没有占满水平剩余空间，则Row的实际宽度等于所有子组件占用的的水平空间；
          mainAxisSize: MainAxisSize.min,
          //表示子组件在Row所占用的水平空间内对齐方式
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              choice.icon,
              size: 128.0,
              color: textStyle.color,
            ),
            Text(
              choice.title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
