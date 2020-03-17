import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidgetTest extends StatefulWidget {
  @override
  _ButtonWidgetTestState createState() => _ButtonWidgetTestState();
}

class _ButtonWidgetTestState extends State<ButtonWidgetTest> {
  int _dropValue;
  List<bool> _selecteds = [false, false, true];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
              child: Text("透明按钮,只显示文字,没有背景色")),
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
            onPressed: () {},
            icon: Icon(Icons.person),
            label: Text("带图标的按钮"),
          ),

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
              textColor: Colors.redAccent, // 文字颜色
              // 因为按钮背景是蓝色(深色)，我们需要指定按钮主题colorBrightness为Brightness.dark，
              // 这是为了保证按钮文字颜色为浅色。
              colorBrightness: Brightness.dark,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
          ),

          DropdownButton(
            items: [
              DropdownMenuItem(child: Text("语文"), value: 1),
              DropdownMenuItem(
                  child: Text("数学", style: TextStyle(color: Colors.blue)),
                  value: 2),
              DropdownMenuItem(child: Text("英语"), value: 3),
            ],
            // 自定义选中样式,必须与上面一一对应
            selectedItemBuilder: (context) {
              return [
                Text('语文', style: TextStyle(color: Colors.red)),
                Text('数学', style: TextStyle(color: Colors.red)),
                Text('英语', style: TextStyle(color: Colors.red))
              ];
            },
            onChanged: (value) {
              setState(() {
                _dropValue = value;
              });
            },
            value: _dropValue,
            hint: Text("请选择科目"), // 占位文字
          ),

          PopupMenuButton(
            itemBuilder: (context) {
              return <PopupMenuEntry>[
                PopupMenuItem(child: Text("语文"), value: 1),
                PopupMenuItem(child: Text("数学"), value: 2),
                PopupMenuItem(child: Text("英语"), value: 3),
                PopupMenuItem(child: Text("物理"), value: 4),
                PopupMenuItem(child: Text("化学"), value: 5),
              ];
            },
            initialValue: 2,
            onSelected: (value) {
              print("PopupMenu: $value");
            },
            onCanceled: () {
              print("onCanceled");
            },
//            icon: Icon(Icons.add),  // 自定义图标,不再是默认的3个点
          ),

          ToggleButtons(
            children: [
              Icon(Icons.local_cafe),
              Icon(Icons.fastfood),
              Icon(Icons.cake),
            ],
            isSelected: _selecteds,
            onPressed: (index) {
              setState(() {
                _selecteds[index] = !_selecteds[index];
              });
            },
              borderRadius: BorderRadius.circular(30),
              borderColor: Colors.orange,
              borderWidth: 3,
              selectedBorderColor: Colors.deepOrange,
          ),
        ],
      ),
    );
  }
}
