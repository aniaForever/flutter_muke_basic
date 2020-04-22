import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

//图片控件开发详解

void main() {
  runApp(ImageDemoPage());
}

class ImageDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageDemoPageState();
  }
}

class _ImageDemoPageState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "图片控件开发详解",
      home: Scaffold(
        appBar: AppBar(
          title: Text("图片控件开发详解"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
//        body: Center(
//          child: Image.network('http://www.devio.org/img/avatar.png'),
//        ),
        body: Column(
          children: <Widget>[
            //1、加载网络图片
            Image.network('http://www.devio.org/img/avatar.png'),
            //2、加载项目里面的本地图片：注意这里要是绝对路径
            Image(
              height: 100,
              width: 150,
              image: AssetImage("images/lake.jpg"),
            ),
            Image.asset(
              "images/lake.jpg",
              width: 40,
              height: 30,
            ),
            //3、加载手机中的图片,传入绝对路径
            Image.file(
              File(
                  '/storage/emulated/0/Pictures/Screenshots/Screenshot_2020-02-15-22-09-52.png'),
              width: 100,
              height: 60,
            ),
            //4、加载手机中的图片，传入相对路径
            //这里完整的路径是/storage/emulated/0/Android/data/com.basic.muke.flutter_muke_basic/files/Pictures/Screenshot_2020-01-04-12-05-34.jpg
            //加载本地文件可能比较慢，所以用了FutureBuilder  参考：https://book.flutterchina.club/chapter7/futurebuilder_and_streambuilder.html
            FutureBuilder(
                future: _getLocalFile(
                    "Pictures/Screenshot_2020-01-04-12-05-34.jpg"),
                builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
                  print(snapshot.connectionState);
                  return snapshot.data != null
                      ? Image.file(
                          snapshot.data,
                          width: 150,
                          height: 100,
                        )
                      : Text("图片加载是吧");
                }),
          ],
        ),
      ),
    );
  }

  Future<File> _getLocalFile(String filename) async {
    String dir = (await getExternalStorageDirectory()).path; //获取手机上的外部存储卡的前缀路径
    File f = new File(dir + "/" + filename); //和文件名进行拼接
    print("absolute path = " + (dir + "/" + filename));
    return f;
  }
}
