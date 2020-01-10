import 'package:flutter/material.dart';

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() => _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = "No Gesture Detected!"; // 事件名称

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("手势识别"),),
      body: Center(
        child: GestureDetector(
           child: Container(
             width: 200,
             height: 100,
             alignment: Alignment.center,
             color: Colors.blue,
             child: Text(_operation, style: TextStyle(color: Colors.white),),
           ),
          onTap: (){
             updateText("Tap");
          },
          onDoubleTap: (){
             updateText("Double Tap");
          },
          onLongPress: (){
             updateText("LongPress");
          },
        ),
      ),
    );
  }

  void updateText(String text) {
    // 更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}
