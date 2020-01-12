import 'dart:math';

import 'package:flutter/material.dart';

class DragTestRoute extends StatefulWidget {
  @override
  _DragTestRouteState createState() => _DragTestRouteState();
}

class _DragTestRouteState extends State<DragTestRoute> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("手势识别"),),
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                child: CircleAvatar(child: Text("A"),),
                // 手指按钮
                onPanDown: (DragDownDetails e) {
                  print("用户手指按下: ${e.globalPosition}");
                },
                // 手指滑动
                onPanUpdate: (DragUpdateDetails e) {
                  setState(() {
                    _top += e.delta.dy;
                    _left += e.delta.dx;
                  });
                },
                // 滑动结束,手指抬起
                onPanEnd: (DragEndDetails e){
                  // 打印滑动结束时在x、y轴上的速度
                  print(e.velocity);
                },


                // 垂直拖拽
                onVerticalDragUpdate: (DragUpdateDetails e){},
                // 水平拖拽
                onHorizontalDragUpdate: (e){},

                
              ),
            )
          ],
        )
      ),
    );
  }
}
