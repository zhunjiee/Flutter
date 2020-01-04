import 'package:flutter/material.dart';

class WrapFlowTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 30,  // 主轴(水平)方向间距
        runSpacing: 10, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.center,  //沿主轴方向居中
        children: <Widget>[
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("A"),),
            label: Text("hahahaha"),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("B"),),
            label: Text("hehehehe"),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("C"),),
            label: Text("hohohoho"),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("D"),),
            label: Text("huhuhuhu"),
          ),
        ],
      ),
    );
  }
}
