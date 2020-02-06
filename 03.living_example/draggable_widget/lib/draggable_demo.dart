import 'package:draggable_widget/draggable_widget.dart';
import 'package:flutter/material.dart';

class DraggableDemo extends StatefulWidget {
  @override
  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  Color _draggableColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DraggableWidget(
            offset: Offset(80.0, 80.0),
            widgetColor: Colors.tealAccent,
          ),
          DraggableWidget(
            offset: Offset(180.0, 80.0),
            widgetColor: Colors.redAccent,
          ),
          Center(
            // 用来接收拖拽事件的控件
            child: DragTarget(
              // 构造器，里边进行修改child值
              builder: (BuildContext context, List candidateData, List rejectedData) {
                return Container(
                  width: 200.0,
                  height: 200.0,
                  color: _draggableColor,
                );
              },
              // 当推拽到控件里时触发，经常在这里得到传递过来的值
              onAccept: (Color color) {
                _draggableColor = color;
              },
            ),
          )
        ],
      ),
    );
  }
}
