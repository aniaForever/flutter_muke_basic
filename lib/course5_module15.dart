//拍照App开发

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PickImagePageState();
  }
}

class _PickImagePageState extends State {
  List<File> _images = []; //初始化一个空的数组 todo

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "拍照App开发",
      home: Scaffold(
        appBar: AppBar(
          title: Text("拍照App开发"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
//        body: _image == null ? Text("没有选择照片") : Image.file(_image),
        body: Center(
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: _genImages(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pickImage, //todo 为什么用_pickImage()就报错了？
          tooltip: '选择照片',
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }

//
  Future getImage(bool isTakePhoto) async {
    Navigator.pop(context); //todo 关闭弹窗？？？
    //方法也是对象，并且有具体类型Function
    var image = await ImagePicker.pickImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      _images.add(image);
    });
  }

  _pickImage() {
    showModalBottomSheet(
        //显示底部弹窗
        context: context,
        builder: (context) => Container(
              height: 160,
              child: Column(
                children: <Widget>[
                  _item('拍照', true),
                  _item('从相册选择', false),
                ],
              ),
            ));
  }

  Widget _item(String content, bool isTakePhoto) {
    return GestureDetector(
      //点击事件
      child: ListTile(
        //todo 为什么用ListTile？
        leading: Icon(
          //图标
          isTakePhoto ? Icons.add_a_photo : Icons.add_photo_alternate,
        ),
        title: Text(content), //文案
        onTap: () => getImage(isTakePhoto), //点击item，注意这的语法
      ),
    );
  }

  /**
   * 生成
   */
  _genImages() {
   return _images.map((file) {//注意这里需要设置reture，返回值
      //对_images进行遍历
      return Stack(
        children: <Widget>[
          ClipRRect(
            //圆角效果
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              file,
              width: 110,
              height: 90,
              fit: BoxFit.fill,
            ), //加载图片，图片模式fill
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _images.remove(file);
                });
              },
              child: ClipOval(
                //圆角删除按钮
                child: Container(
                  padding: EdgeInsets.all(3), //里面的删除按钮和背景的间距
                  decoration: BoxDecoration(
                    color: Colors.black38,
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }).toList();//转成一个列表
  }
}
