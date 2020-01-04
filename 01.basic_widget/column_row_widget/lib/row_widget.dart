import 'package:flutter/material.dart';

class RowTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hello world!"),
            Text("I am fine, thank you, and you?"),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text("Hello world!"),
            Text("I am fine, thank you, and you?"),
          ],
        ),

        Row(
          mainAxisSize: MainAxisSize.min, // mainAxisSize为min,mainAxisAlignment设置无效
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hello world!"),
            Text("I am fine, thank you, and you?"),
          ],
        ),

        Row(
          textDirection: TextDirection.rtl, // 从右向左
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text("Hello world!"),
            Text("I am fine, thank you, and you?"),
          ],
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Hello world!", style: TextStyle(fontSize: 40.0),),
            Text("I am fine, thank you, and you?"),
          ],
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Hello world!", style: TextStyle(fontSize: 40.0),),
            Text("I am fine, thank you, and you?"),
          ],
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text("Hello world!", style: TextStyle(fontSize: 40.0),),
            Text("I am fine, thank you, and you?"),
          ],
        ),
      ],
    );
  }
}

