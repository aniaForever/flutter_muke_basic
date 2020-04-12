import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'this is title',
      home:Scaffold(
        appBar: AppBar(
          title: Text(
            'this is appbar'
          ),
        ),
        body: Center(
          child: MaterialButton(
            onPressed: (){},
            child: Text('hello'),
            padding: EdgeInsets.only(left: 10.0,right: 10.0),//对text 添加padding
          )
        ),
      ),
    );
  }

}

