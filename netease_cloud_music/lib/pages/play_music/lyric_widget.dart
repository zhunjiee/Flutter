/**
 * @ClassName lyric_widget
 * @Description TODO
 * @Author houge
 * @Date 2020/3/12 3:45 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../../model/lyric_model.dart';

class LyricWidget extends CustomPainter {
  LyricWidget(this.lyric, this.curLine);

  final List<Lyric> lyric;
  final int curLine;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}