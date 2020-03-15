/**
 * @ClassName custom_paint_widget
 * @Description TODO
 * @Author houge
 * @Date 2020/3/12 6:39 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'my_painter.dart';

class CustomPaintRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(300, 300),
        painter: MyPainter(),
      ),
    );
  }
}
