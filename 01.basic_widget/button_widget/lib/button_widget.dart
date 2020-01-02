import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidgetTest extends StatefulWidget {
  @override
  _ButtonWidgetTestState createState() => _ButtonWidgetTestState();
}

class _ButtonWidgetTestState extends State<ButtonWidgetTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              print("RaisedButton");
            },
            child: Text("RaisedButton是最常用的按钮"),
          ),
          FlatButton(
              onPressed: () {
                print("FlatButton");
              },
              child: Text("透明按钮,只显示文字")),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              print("IconButton");
            },
            color: Colors.redAccent,
          ),

          OutlineButton(
            onPressed: () {},
            child: Text("带边线的按钮"),
          ),
          CupertinoButton(child: Text("iOS风格按钮"), onPressed: null),
          // 带图标的按钮
          RaisedButton.icon(
              onPressed: null, icon: Icon(Icons.person), label: Text("带图标的按钮")),

          // 按钮尺寸及圆角
          Container(
            width: 300,
            height: 50,
            child: RaisedButton(
              onPressed: () {},
              child: Text(
                "按钮尺寸及圆角",
                // 修改文字颜色 方式一
//                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue[200],
              highlightColor: Colors.blue[400],
              textColor: Colors.redAccent,  // 文字颜色
              colorBrightness: Brightness.dark, // 因为按钮背景是蓝色(深色)，我们需要指定按钮主题colorBrightness为Brightness.dark，这是为了保证按钮文字颜色为浅色。
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
              ),
            ),
          )
        ],
      ),
    );
  }
}
