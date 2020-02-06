import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

class AddPhotoDemo extends StatefulWidget {
  @override
  _AddPhotoDemoState createState() => _AddPhotoDemoState();
}

class _AddPhotoDemoState extends State<AddPhotoDemo> {
  static double itemPadding = 10;
  static double itemSpacing = 20;
  static double width = MediaQueryData.fromWindow(window).size.width;
  static double itemWidth = (width - itemPadding*3*2 - itemSpacing*2)/3;


  List<Widget> photoList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    photoList = List<Widget>()..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Photo Demo"),
      ),
      body: Center(
        child: Opacity(
          opacity: .8,
          child: Container(
            width: width,
            height: itemWidth*3 + itemPadding*3*2,
            color: Colors.grey,
            child: Wrap(
              children: photoList,
              spacing: itemSpacing,  // 设置间距
            ),
          ),
        ),
      ),
    );
  }

  /*
  * 添加照片按钮
  * */
  Widget buildAddButton() {
    // 返回一个手势事件Widget, 用于添加照片
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(itemPadding),
        child: Container(
          width: itemWidth,
          height: itemWidth,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
      onTap: () {
        if (photoList.length < 9) {
          setState(() {
            // 小于9张在"+"前面添加照片
            photoList.insert(photoList.length - 1, buildPhoto());
          });
        }
      },
    );
  }

  /*
  * 照片控件
  * */
  Widget buildPhoto() {
    return Padding(
      padding: EdgeInsets.all(itemPadding),
      child: Container(
        width: itemWidth,
        height: itemWidth,
        child: Center(
          child: Text("照片"),
        ),
        color: Colors.orangeAccent,
      ),
    );
  }
}
