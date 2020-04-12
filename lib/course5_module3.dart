import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

void main(){
  runApp(PluginUse());
}

class PluginUse extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'this is title',
      home:Scaffold(
        appBar: AppBar(
          title: Text(
              'this is appbar',
          ),
        ),
        body: Center(
            child: MaterialButton(
              onPressed: (){},
              child: Text(
                  'hello',
                style: TextStyle(color: ColorUtil.color('#a27878')),//调用了plugin中的方法 功能：将颜色进行转换
              ),
              padding: EdgeInsets.only(left: 10.0,right: 10.0),//对text 添加padding
            )
        ),
      ),
    );
  }

}

